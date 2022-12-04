`timescale 1ns/1ps
`default_nettype none

`include "alu_types.sv"
`include "rv32i_defines.sv"

module rv32i_multicycle_core(
  clk, rst, ena,
  mem_addr, mem_rd_data, mem_wr_data, mem_wr_ena,
  PC
);

parameter PC_START_ADDRESS=0;

// Standard control signals.
input  wire clk, rst, ena; // <- worry about implementing the ena signal last.

// Memory interface.
output logic [31:0] mem_addr, mem_wr_data;
input   wire [31:0] mem_rd_data;
output logic mem_wr_ena;

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
register_file REGISTER_FILE(
  .clk(clk), 
  .wr_ena(reg_write), .wr_addr(rd), .wr_data(rfile_wr_data),
  .rd_addr0(rs1), .rd_addr1(rs2),
  .rd_data0(reg_data1), .rd_data1(reg_data2)
);

// ALU and related control signals
// Feel free to replace with your ALU from the homework.
logic [31:0] src_a, src_b;
alu_control_t alu_control;
wire [31:0] alu_result;
wire overflow, zero, equal;
alu_behavioural ALU (
  .a(src_a), .b(src_b), .result(alu_result),
  .control(alu_control),
  .overflow(overflow), .zero(zero), .equal(equal)
);

enum logic [1:0] {ALU_SRC_A_PC, ALU_SRC_A_OLD_PC, ALU_SRC_A_A} alu_src_a;
enum logic [1:0] {ALU_SRC_B_IMM, ALU_SRC_B_B, ALU_SRC_B_4} alu_src_b;
wire [31:0] reg_A, reg_B;
wire [31:0] imm_ext;

always_comb begin : ALU_MUX_A
  case (alu_src_a)
    ALU_SRC_A_PC: src_a = PC;
    ALU_SRC_A_OLD_PC: src_a = PC_old;
    ALU_SRC_A_A: src_a = reg_A;
    default: src_a = 0;
  endcase
end

always_comb begin : ALU_MUX_B
  case (alu_src_b)
    ALU_SRC_B_IMM: src_b = imm_ext;
    ALU_SRC_B_B: src_b = reg_B;
    ALU_SRC_B_4: src_b = 32'd4;
    default: src_b = 0;
  endcase
end

// Registers
logic alu_ena;

register #(.N(32)) DATA_REGISTER(
  .clk(clk), .rst(rst), .ena(PC_ena), .d(mem_rd_data), .q(mem_data)
);

register #(.N(32)) ALU_REGISTER(
  .clk(clk), .rst(rst), .ena(alu_ena), .d(alu_result), .q(alu_out)
);

// Mux
enum logic [1:0] {RESULT_SRC_ALU_RESULT, RESULT_SRC_DATA, RESULT_SRC_ALU_OUT} result_src;
enum logic {ADDR_PC, ADDR_RESULT} addr_src;
wire [31:0] alu_out;
wire [31:0] mem_data;
wire [31:0] result;

always_comb begin : RESULT_MUX:
  case (addr_src)
    ADDR_PC: mem_addr = PC;
    ADDR_RESULT: mem_addr = result;
  endcase
end

always_comb begin : RESULT_MUX
  case (result_src)
    RESULT_SRC_ALU_RESULT: result = alu_result;
    RESULT_SRC_DATA: result = mem_data;
    RESULT_SRC_ALU_OUT: result = alu_out;
    default: result = alu_result;
  endcase
end

// Implement your multicycle rv32i CPU here!

endmodule
