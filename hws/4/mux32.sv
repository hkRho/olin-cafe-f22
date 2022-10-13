	
`timescale 1ns/1ps
`default_nettype none
/*
  Making 32 different inputs is annoying, so I use python:
  print(", ".join([f"in{i:02}" for i in range(32)]))
  The solutions will include comments for where I use python-generated HDL.
*/

module mux32(
  in00, in01, in02, in03, in04, in05, in06, in07, in08, in09, in10, 
  in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, 
  in22, in23, in24, in25, in26, in27, in28, in29, in30, in31,
  select,out
);
	//parameter definitions
	parameter N = 32;
	//port definitions
  // python: print(", ".join([f"in{i:02}" for i in range(32)]))
	input  wire [(N-1):0] in00, in01, in02, in03, in04, in05, in06, in07, in08, 
    in09, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, 
    in21, in22, in23, in24, in25, in26, in27, in28, in29, in30, in31;
	input  wire [4:0] select;
	output logic [(N-1):0] out;

  // wire out1, out2;

  // mux16 mux1(.select(select[3:0]), .in(in[15:0]), .out(out1));
  // mux16 mux2(.select(select[3:0]), .in(in[31:16]), .out(out2));

  // assign out = ((select[4] & out2) | (~select[4] & out1));

  logic [31:0] a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15;

  mux2 muxA0(select[0], in00, in01, a0);
  mux2 muxA1(select[0], in02, in03, a1);
  mux2 muxA2(select[0], in04, in05, a2);
  mux2 muxA3(select[0], in06, in07, a3);
  mux2 muxA4(select[0], in08, in09, a4);
  mux2 muxA5(select[0], in10, in11, a5);
  mux2 muxA6(select[0], in12, in13, a6);
  mux2 muxA7(select[0], in14, in14, a7);
  mux2 muxA8(select[0], in16, in15, a8);
  mux2 muxA9(select[0], in18, in19, a9);
  mux2 muxA10(select[0], in20, in21, a10);
  mux2 muxA11(select[0], in22, in23, a11);
  mux2 muxA12(select[0], in24, in25, a12);
  mux2 muxA13(select[0], in26, in27, a13);
  mux2 muxA14(select[0], in28, in29, a14);
  mux2 muxA15(select[0], in30, in31, a15);

  logic [31:0] b0, b1, b2, b3, b4, b5, b6, b7;

  mux2 muxB0(select[1], a0, a1, b0);
  mux2 muxB1(select[1], a2, a3, b1);
  mux2 muxB2(select[1], a4, a5, b2);
  mux2 muxB3(select[1], a6, a7, b3);
  mux2 muxB4(select[1], a8, a9, b4);
  mux2 muxB5(select[1], a10, a11, b5);
  mux2 muxB6(select[1], a12, a13, b6);
  mux2 muxB7(select[1], a14, a15, b7);

  logic [31:0] c0, c1, c2, c3;

  mux2 muxC0(select[2], b0, b1, c0);
  mux2 muxC1(select[2], b2, b3, c1);
  mux2 muxC2(select[2], b4, b5, c2);
  mux2 muxC3(select[2], b6, b7, c3);

  logic [31:0] out0, out1;

  mux2 muxD0(select[3], c0, c1, out0);
  mux2 muxD1(select[3], c2, c3, out1);

  mux2 result(select[4], out0, out1, out);

endmodule
