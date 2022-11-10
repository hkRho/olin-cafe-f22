`default_nettype none
`timescale 1ns/1ps

module register_file(
  clk, //Note - intentionally does not have a reset! 
  wr_ena, wr_addr, wr_data,
  rd_addr0, rd_data0,
  rd_addr1, rd_data1
);
// Not parametrizing, these widths are defined by the RISC-V Spec!
input wire clk;

// Write channel
input wire wr_ena;
input wire [4:0] wr_addr;
input wire [31:0] wr_data;

// Two read channels
input wire [4:0] rd_addr0, rd_addr1;
output logic [31:0] rd_data0, rd_data1;

logic [31:0] x00; 
always_comb x00 = 32'd0; // ties x00 to ground. 

// DON'T DO THIS:
// logic [31:0] register_file_registers [31:0]
// CAN'T: because that's a RAM. Works in simulation, fails miserably in synthesis.

// Hint - use a scripting language if you get tired of copying and pasting the logic 32 times - e.g. python: print(",".join(["x%02d"%i for i in range(0,32)]))
wire [31:0] x01,x02,x03,x04,x05,x06,x07,x08,x09,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31;

mux32 #(.N(32)) rd_0 (x00,x01,x02,x03,x04,x05,x06,x07,x08,x09,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,rd_addr0,rd_data0);
mux32 #(.N(32)) rd_1 (x00,x01,x02,x03,x04,x05,x06,x07,x08,x09,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31,rd_addr1,rd_data1);

register reg_01 (.clk(clk), .ena(&(wr_addr ~^ 5'd01) & wr_ena), .rst(1'b0), .d(wr_data), .q(x01));
register reg_02 (.clk(clk), .ena(&(wr_addr ~^ 5'd02) & wr_ena), .rst(1'b0), .d(wr_data), .q(x02));
register reg_03 (.clk(clk), .ena(&(wr_addr ~^ 5'd03) & wr_ena), .rst(1'b0), .d(wr_data), .q(x03));
register reg_04 (.clk(clk), .ena(&(wr_addr ~^ 5'd04) & wr_ena), .rst(1'b0), .d(wr_data), .q(x04));
register reg_05 (.clk(clk), .ena(&(wr_addr ~^ 5'd05) & wr_ena), .rst(1'b0), .d(wr_data), .q(x05));
register reg_06 (.clk(clk), .ena(&(wr_addr ~^ 5'd06) & wr_ena), .rst(1'b0), .d(wr_data), .q(x06));
register reg_07 (.clk(clk), .ena(&(wr_addr ~^ 5'd07) & wr_ena), .rst(1'b0), .d(wr_data), .q(x07));
register reg_08 (.clk(clk), .ena(&(wr_addr ~^ 5'd08) & wr_ena), .rst(1'b0), .d(wr_data), .q(x08));
register reg_09 (.clk(clk), .ena(&(wr_addr ~^ 5'd09) & wr_ena), .rst(1'b0), .d(wr_data), .q(x09));
register reg_10 (.clk(clk), .ena(&(wr_addr ~^ 5'd10) & wr_ena), .rst(1'b0), .d(wr_data), .q(x10));
register reg_11 (.clk(clk), .ena(&(wr_addr ~^ 5'd11) & wr_ena), .rst(1'b0), .d(wr_data), .q(x11));
register reg_12 (.clk(clk), .ena(&(wr_addr ~^ 5'd12) & wr_ena), .rst(1'b0), .d(wr_data), .q(x12));
register reg_13 (.clk(clk), .ena(&(wr_addr ~^ 5'd13) & wr_ena), .rst(1'b0), .d(wr_data), .q(x13));
register reg_14 (.clk(clk), .ena(&(wr_addr ~^ 5'd14) & wr_ena), .rst(1'b0), .d(wr_data), .q(x14));
register reg_15 (.clk(clk), .ena(&(wr_addr ~^ 5'd15) & wr_ena), .rst(1'b0), .d(wr_data), .q(x15));
register reg_16 (.clk(clk), .ena(&(wr_addr ~^ 5'd16) & wr_ena), .rst(1'b0), .d(wr_data), .q(x16));
register reg_17 (.clk(clk), .ena(&(wr_addr ~^ 5'd17) & wr_ena), .rst(1'b0), .d(wr_data), .q(x17));
register reg_18 (.clk(clk), .ena(&(wr_addr ~^ 5'd18) & wr_ena), .rst(1'b0), .d(wr_data), .q(x18));
register reg_19 (.clk(clk), .ena(&(wr_addr ~^ 5'd19) & wr_ena), .rst(1'b0), .d(wr_data), .q(x19));
register reg_20 (.clk(clk), .ena(&(wr_addr ~^ 5'd20) & wr_ena), .rst(1'b0), .d(wr_data), .q(x20));
register reg_21 (.clk(clk), .ena(&(wr_addr ~^ 5'd21) & wr_ena), .rst(1'b0), .d(wr_data), .q(x21));
register reg_22 (.clk(clk), .ena(&(wr_addr ~^ 5'd22) & wr_ena), .rst(1'b0), .d(wr_data), .q(x22));
register reg_23 (.clk(clk), .ena(&(wr_addr ~^ 5'd23) & wr_ena), .rst(1'b0), .d(wr_data), .q(x23));
register reg_24 (.clk(clk), .ena(&(wr_addr ~^ 5'd24) & wr_ena), .rst(1'b0), .d(wr_data), .q(x24));
register reg_25 (.clk(clk), .ena(&(wr_addr ~^ 5'd25) & wr_ena), .rst(1'b0), .d(wr_data), .q(x25));
register reg_26 (.clk(clk), .ena(&(wr_addr ~^ 5'd26) & wr_ena), .rst(1'b0), .d(wr_data), .q(x26));
register reg_27 (.clk(clk), .ena(&(wr_addr ~^ 5'd27) & wr_ena), .rst(1'b0), .d(wr_data), .q(x27));
register reg_28 (.clk(clk), .ena(&(wr_addr ~^ 5'd28) & wr_ena), .rst(1'b0), .d(wr_data), .q(x28));
register reg_29 (.clk(clk), .ena(&(wr_addr ~^ 5'd29) & wr_ena), .rst(1'b0), .d(wr_data), .q(x29));
register reg_30 (.clk(clk), .ena(&(wr_addr ~^ 5'd30) & wr_ena), .rst(1'b0), .d(wr_data), .q(x30));
register reg_31 (.clk(clk), .ena(&(wr_addr ~^ 5'd31) & wr_ena), .rst(1'b0), .d(wr_data), .q(x31));

// x00 is always connected to ground so is 0
// make 32:1 mux
// read two values and write one value

endmodule