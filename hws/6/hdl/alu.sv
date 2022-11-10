`timescale 1ns/1ps
`default_nettype none

`include "alu_types.sv"

module alu(a, b, control, result, overflow, zero, equal);
parameter N = 32; // Don't need to support other numbers, just using this as a constant.

input wire [N-1:0] a, b; // Inputs to the ALU.
input alu_control_t control; // Sets the current operation.
output logic [N-1:0] result; // Result of the selected operation.

output logic overflow = 0; // Is high if the result of an ADD or SUB wraps around the 32 bit boundary.
output logic zero = 0;  // Is high if the result is ever all zeros.
output logic equal = 0; // is high if a == b.

// Use *only* structural logic and previously defined modules to implement an 
// ALU that can do all of operations defined in alu_types.sv's alu_op_code_t.

logic [N-1:0] ANDD, ORR, XORR, sll_result, srl_result, sra_result, add_result, sub_result, slt_result, sltu_result;
always_comb ANDD = a & b;
always_comb ORR = a | b;
always_comb XORR = a ^ b;
shift_left_logical SLL(.in(a), .shamt(control), .out(sll_result));
shift_right_logical SRL (.in(a), .shamt(control), .out(srl_result));
shift_right_arithmetic SRA (.in(a), .shamt(control), .out(sra_result));
adder_n ADD (.a(a), .b(b), .c_in(1'b0), .sum(add_result));
adder_n SUB (.a(a), .b(~b), .c_in(1'b0), .sum(sub_result));
slt SLT (.a(a), .b(b), .out(slt_result));
sltu SLTU (.a(a), .b(b), .out(sltu_result));


// ground the extra ones that you don't use
// the bit ordering matters 
mux16 ALU(
  .in00(0), .in01(ANDD), .in02(ORR), .in03(XORR), .in04(0), .in05(sll_result), .in06(srl_result), .in07(sra_result), .in08(add_result),
  .in09(0), .in10(0), .in11(0), .in12(sub_result), .in13(slt_result), .in14(0), .in15(sltu_result),
  .select(control), .out(result)
);

endmodule