`timescale 1ns/1ps
`default_nettype none

`include "alu_types.sv"
`include "rv32i_defines.sv"

module rv32i_multicycle_core(
  clk, rst, ena,
  mem_addr, mem_rd_data, mem_wr_data, mem_wr_ena,
  PC, instructions_completed
);

parameter PC_START_ADDRESS=0;

// Standard control signals.
input  wire clk, rst, ena; // <- worry about implementing the ena signal last.

// Memory interface.
output logic [31:0] mem_addr, mem_wr_data;
input   wire [31:0] mem_rd_data;
output logic mem_wr_ena;
output logic [31:0] instructions_completed;

// Program Counter
output wire [31:0] PC;
wire [31:0] PC_old;
logic PC_ena;
logic [31:0] PC_next; 

// Program Counter Registers
register #(.N(32), .RESET(PC_START_ADDRESS)) PC_REGISTER (
  .clk(clk), .rst(rst), .ena(PC_ena), .d(PC_next), .q(PC)
);
register #(.N(32)) PC_OLD_REGISTER(
  .clk(clk), .rst(rst), .ena(PC_ena), .d(PC), .q(PC_old)
);

// Instruction Register
wire [31:0] IR;
logic IR_write;
register #(.N(32)) IR_REGISTER(
  .clk(clk), .rst(rst), .ena(IR_write), .d(mem_rd_data), .q(IR)
);

//  an example of how to make named inputs for a mux:
/*
    enum logic {MEM_SRC_PC, MEM_SRC_RESULT} mem_src;
    always_comb begin : memory_read_address_mux
      case(mem_src)
        MEM_SRC_RESULT : mem_rd_addr = alu_result;
        MEM_SRC_PC : mem_rd_addr = PC;
        default: mem_rd_addr = 0;
    end
*/

// Register file
logic reg_write;
logic [4:0] rd, rs1, rs2;
logic [31:0] rfile_wr_data;
wire [31:0] reg_data1, reg_data2;
logic [31:0] regA, regB;  // what we've read from rs1 and rs2
register_file REGISTER_FILE(
  .clk(clk), 
  .wr_ena(reg_write), .wr_addr(rd), .wr_data(rfile_wr_data),
  .rd_addr0(rs1), .rd_addr1(rs2),
  .rd_data0(reg_data1), .rd_data1(reg_data2)
);

// Implement your multicycle rv32i CPU here!
// Instruction Decoding
logic [6:0] op;
logic [3:0] func3;
logic [6:0] func7;
logic [11:0] imm12;
logic [19:0] imm20;

logic rtype;

always_comb begin : DECODER
  op = IR[6:0];
  rd = IR[11:7];
  func3 = IR[14:12];
  func7 = IR[31:25];
  rs1 = IR[19:15];
  rs2 = IR[24:20];
  imm12 = IR[31:20];

  rtype = (op == OP_RTYPE);

  case (func3)
    3'b000: begin
      if (rtype & func7[5]) ri_alu_control = ALU_SUB; // need rtype here bc then we include the "subi" case which doesn't exist
      else ri_alu_control = ALU_ADD;
    end 
    3'b001: ri_alu_control = ALU_SLL;
    3'b010: ri_alu_control = ALU_SLT;
    3'b011: ri_alu_control = ALU_SLTU;
    3'b100: ri_alu_control = ALU_XOR;
    3'b101: begin
      if (func7[5]) ri_alu_control = ALU_SRA;
      else ri_alu_control = ALU_SRL;
    end
    3'b110: ri_alu_control = ALU_OR;
    3'b111: ri_alu_control = ALU_AND;
  endcase
end


enum logic [3:0] {
    S_FETCH = 0, S_DECODE = 1, S_EXECUTE_I = 2, 
    S_EXECUTE_R, S_WRITEBACK, S_ERROR = 4'd15
} state;

always_ff @(posedge clk) begin: main_fsm
  if (rst) begin
    state <= S_FETCH;
    regA <= 0;
    regB <= 0;
    last_result <= 0;
    instructions_completed <= 0;
  end
  else begin
    case (state)
    S_FETCH: state <= S_DECODE;

    S_DECODE: begin
      // Figure out what the next state is based on op code.
      case (op)
        OP_ITYPE: state <= S_EXECUTE_I;
        OP_RTYPE: state <= S_EXECUTE_R;
        default: state <= S_ERROR;
      endcase

      // Read from the register
      regA <= reg_data1;
      regB <= reg_data2;
    end

    S_EXECUTE_I, S_EXECUTE_R: begin
      state <= S_WRITEBACK;
      last_result <= alu_result;
    end

    S_WRITEBACK: begin
      state <= S_FETCH;
      instructions_completed <= instructions_completed + 1;
    end

    default: state <= S_ERROR;
    endcase
  end
end


// ALU and related control signals
// Feel free to replace with your ALU from the homework.
logic [31:0] src_a, src_b;
alu_control_t alu_control, ri_alu_control;
wire [31:0] alu_result;
logic [31:0] last_result; // book calls it ALUOut
wire overflow, zero, equal;
alu_behavioural ALU (
  .a(src_a), .b(src_b), .result(alu_result),
  .control(alu_control),
  .overflow(overflow), .zero(zero), .equal(equal)
);

//ALU Control Unit
logic [31:0] alu_out;

always_comb begin : ALU_control_unit
  case (state)
    S_FETCH: begin
      src_a = PC;
      src_b = 32'd4;
      alu_control = ALU_ADD;
    end
    S_EXECUTE_I: begin
      src_a = regA;
      src_b = sign_extended_immediate;
      alu_out = alu_result;
      alu_control = ri_alu_control;
    end
    S_EXECUTE_R: begin
      src_a = regA;
      src_b = regB;
      alu_out = alu_result;
      alu_control = ri_alu_control;
    end
    default: begin
      src_a = 0;
      src_b = 0;
      alu_control = ri_alu_control;
    end
  endcase
end


logic [31:0] sign_extended_immediate;
always_comb begin : SIGN_EXTENDER
  sign_extended_immediate = { {20{imm12[11]}}, imm12 };
end

//PC Control Unit
always_comb begin : PC_control_unit
  case (state)
    S_FETCH: begin
      PC_ena = 1;
      PC_next = alu_result;
    end
    default: begin
      PC_ena = 0;
      PC_next = 0;
    end
  endcase
end

//Memory Control Unit
always_comb begin : Memory_control_unit
  mem_addr = PC;
  mem_wr_ena = 0;
end

//IR Control
always_comb IR_write = (state == S_FETCH);

//Register File Control
always_comb begin : rfile_control_unit
  reg_write = (state == S_WRITEBACK);
  rfile_wr_data = last_result;
end


endmodule