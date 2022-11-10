`timescale 1ns/1ps
`default_nettype none
module shift_right_arithmetic(in,shamt,out);
parameter N = 32; // only used as a constant! Don't feel like you need to a shifter for arbitrary N.

//port definitions
input  wire [N-1:0] in;    // A 32 bit input
input  wire [$clog2(N)-1:0] shamt; // Shift ammount
output wire [N-1:0] out; // The same as SRL, but maintain the sign bit (MSB) after the shift! 
// It's similar to SRL, but instead of filling in the extra bits with zero, we
// fill them in with the sign bit.
// Remember the *repetition operator*: {n{bits}} will repeat bits n times.

mux32 OUT_0 (
.in00(in[0]), .in01(in[1]), .in02(in[2]), .in03(in[3]), .in04(in[4]),
.in05(in[5]), .in06(in[6]), .in07(in[7]), .in08(in[8]), .in09(in[9]),
.in10(in[10]), .in11(in[11]), .in12(in[12]), .in13(in[13]), .in14(in[14]),
.in15(in[15]), .in16(in[16]), .in17(in[17]), .in18(in[18]), .in19(in[19]),
.in20(in[20]), .in21(in[21]), .in22(in[22]), .in23(in[23]), .in24(in[24]),
.in25(in[25]), .in26(in[26]), .in27(in[27]), .in28(in[28]), .in29(in[29]),
.in30(in[30]), .in31(in[31]), .select(shamt), .out(out[0])
);


mux32 OUT_1 (
.in00(in[1]), .in01(in[2]), .in02(in[3]), .in03(in[4]), .in04(in[5]),
.in05(in[6]), .in06(in[7]), .in07(in[8]), .in08(in[9]), .in09(in[10]),
.in10(in[11]), .in11(in[12]), .in12(in[13]), .in13(in[14]), .in14(in[15]),
.in15(in[16]), .in16(in[17]), .in17(in[18]), .in18(in[19]), .in19(in[20]),
.in20(in[21]), .in21(in[22]), .in22(in[23]), .in23(in[24]), .in24(in[25]),
.in25(in[26]), .in26(in[27]), .in27(in[28]), .in28(in[29]), .in29(in[30]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[1])
);


mux32 OUT_2 (
.in00(in[2]), .in01(in[3]), .in02(in[4]), .in03(in[5]), .in04(in[6]),
.in05(in[7]), .in06(in[8]), .in07(in[9]), .in08(in[10]), .in09(in[11]),
.in10(in[12]), .in11(in[13]), .in12(in[14]), .in13(in[15]), .in14(in[16]),
.in15(in[17]), .in16(in[18]), .in17(in[19]), .in18(in[20]), .in19(in[21]),
.in20(in[22]), .in21(in[23]), .in22(in[24]), .in23(in[25]), .in24(in[26]),
.in25(in[27]), .in26(in[28]), .in27(in[29]), .in28(in[30]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[2])
);


mux32 OUT_3 (
.in00(in[3]), .in01(in[4]), .in02(in[5]), .in03(in[6]), .in04(in[7]),
.in05(in[8]), .in06(in[9]), .in07(in[10]), .in08(in[11]), .in09(in[12]),
.in10(in[13]), .in11(in[14]), .in12(in[15]), .in13(in[16]), .in14(in[17]),
.in15(in[18]), .in16(in[19]), .in17(in[20]), .in18(in[21]), .in19(in[22]),
.in20(in[23]), .in21(in[24]), .in22(in[25]), .in23(in[26]), .in24(in[27]),
.in25(in[28]), .in26(in[29]), .in27(in[30]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[3])
);


mux32 OUT_4 (
.in00(in[4]), .in01(in[5]), .in02(in[6]), .in03(in[7]), .in04(in[8]),
.in05(in[9]), .in06(in[10]), .in07(in[11]), .in08(in[12]), .in09(in[13]),
.in10(in[14]), .in11(in[15]), .in12(in[16]), .in13(in[17]), .in14(in[18]),
.in15(in[19]), .in16(in[20]), .in17(in[21]), .in18(in[22]), .in19(in[23]),
.in20(in[24]), .in21(in[25]), .in22(in[26]), .in23(in[27]), .in24(in[28]),
.in25(in[29]), .in26(in[30]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[4])
);


mux32 OUT_5 (
.in00(in[5]), .in01(in[6]), .in02(in[7]), .in03(in[8]), .in04(in[9]),
.in05(in[10]), .in06(in[11]), .in07(in[12]), .in08(in[13]), .in09(in[14]),
.in10(in[15]), .in11(in[16]), .in12(in[17]), .in13(in[18]), .in14(in[19]),
.in15(in[20]), .in16(in[21]), .in17(in[22]), .in18(in[23]), .in19(in[24]),
.in20(in[25]), .in21(in[26]), .in22(in[27]), .in23(in[28]), .in24(in[29]),
.in25(in[30]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[5])
);


mux32 OUT_6 (
.in00(in[6]), .in01(in[7]), .in02(in[8]), .in03(in[9]), .in04(in[10]),
.in05(in[11]), .in06(in[12]), .in07(in[13]), .in08(in[14]), .in09(in[15]),
.in10(in[16]), .in11(in[17]), .in12(in[18]), .in13(in[19]), .in14(in[20]),
.in15(in[21]), .in16(in[22]), .in17(in[23]), .in18(in[24]), .in19(in[25]),
.in20(in[26]), .in21(in[27]), .in22(in[28]), .in23(in[29]), .in24(in[30]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[6])
);


mux32 OUT_7 (
.in00(in[7]), .in01(in[8]), .in02(in[9]), .in03(in[10]), .in04(in[11]),
.in05(in[12]), .in06(in[13]), .in07(in[14]), .in08(in[15]), .in09(in[16]),
.in10(in[17]), .in11(in[18]), .in12(in[19]), .in13(in[20]), .in14(in[21]),
.in15(in[22]), .in16(in[23]), .in17(in[24]), .in18(in[25]), .in19(in[26]),
.in20(in[27]), .in21(in[28]), .in22(in[29]), .in23(in[30]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[7])
);


mux32 OUT_8 (
.in00(in[8]), .in01(in[9]), .in02(in[10]), .in03(in[11]), .in04(in[12]),
.in05(in[13]), .in06(in[14]), .in07(in[15]), .in08(in[16]), .in09(in[17]),
.in10(in[18]), .in11(in[19]), .in12(in[20]), .in13(in[21]), .in14(in[22]),
.in15(in[23]), .in16(in[24]), .in17(in[25]), .in18(in[26]), .in19(in[27]),
.in20(in[28]), .in21(in[29]), .in22(in[30]), .in23(in[31]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[8])
);


mux32 OUT_9 (
.in00(in[9]), .in01(in[10]), .in02(in[11]), .in03(in[12]), .in04(in[13]),
.in05(in[14]), .in06(in[15]), .in07(in[16]), .in08(in[17]), .in09(in[18]),
.in10(in[19]), .in11(in[20]), .in12(in[21]), .in13(in[22]), .in14(in[23]),
.in15(in[24]), .in16(in[25]), .in17(in[26]), .in18(in[27]), .in19(in[28]),
.in20(in[29]), .in21(in[30]), .in22(in[31]), .in23(in[31]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[9])
);


mux32 OUT_10 (
.in00(in[10]), .in01(in[11]), .in02(in[12]), .in03(in[13]), .in04(in[14]),
.in05(in[15]), .in06(in[16]), .in07(in[17]), .in08(in[18]), .in09(in[19]),
.in10(in[20]), .in11(in[21]), .in12(in[22]), .in13(in[23]), .in14(in[24]),
.in15(in[25]), .in16(in[26]), .in17(in[27]), .in18(in[28]), .in19(in[29]),
.in20(in[30]), .in21(in[31]), .in22(in[31]), .in23(in[31]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[10])
);


mux32 OUT_11 (
.in00(in[11]), .in01(in[12]), .in02(in[13]), .in03(in[14]), .in04(in[15]),
.in05(in[16]), .in06(in[17]), .in07(in[18]), .in08(in[19]), .in09(in[20]),
.in10(in[21]), .in11(in[22]), .in12(in[23]), .in13(in[24]), .in14(in[25]),
.in15(in[26]), .in16(in[27]), .in17(in[28]), .in18(in[29]), .in19(in[30]),
.in20(in[31]), .in21(in[31]), .in22(in[31]), .in23(in[31]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[11])
);


mux32 OUT_12 (
.in00(in[12]), .in01(in[13]), .in02(in[14]), .in03(in[15]), .in04(in[16]),
.in05(in[17]), .in06(in[18]), .in07(in[19]), .in08(in[20]), .in09(in[21]),
.in10(in[22]), .in11(in[23]), .in12(in[24]), .in13(in[25]), .in14(in[26]),
.in15(in[27]), .in16(in[28]), .in17(in[29]), .in18(in[30]), .in19(in[31]),
.in20(in[31]), .in21(in[31]), .in22(in[31]), .in23(in[31]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[12])
);


mux32 OUT_13 (
.in00(in[13]), .in01(in[14]), .in02(in[15]), .in03(in[16]), .in04(in[17]),
.in05(in[18]), .in06(in[19]), .in07(in[20]), .in08(in[21]), .in09(in[22]),
.in10(in[23]), .in11(in[24]), .in12(in[25]), .in13(in[26]), .in14(in[27]),
.in15(in[28]), .in16(in[29]), .in17(in[30]), .in18(in[31]), .in19(in[31]),
.in20(in[31]), .in21(in[31]), .in22(in[31]), .in23(in[31]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[13])
);


mux32 OUT_14 (
.in00(in[14]), .in01(in[15]), .in02(in[16]), .in03(in[17]), .in04(in[18]),
.in05(in[19]), .in06(in[20]), .in07(in[21]), .in08(in[22]), .in09(in[23]),
.in10(in[24]), .in11(in[25]), .in12(in[26]), .in13(in[27]), .in14(in[28]),
.in15(in[29]), .in16(in[30]), .in17(in[31]), .in18(in[31]), .in19(in[31]),
.in20(in[31]), .in21(in[31]), .in22(in[31]), .in23(in[31]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[14])
);


mux32 OUT_15 (
.in00(in[15]), .in01(in[16]), .in02(in[17]), .in03(in[18]), .in04(in[19]),
.in05(in[20]), .in06(in[21]), .in07(in[22]), .in08(in[23]), .in09(in[24]),
.in10(in[25]), .in11(in[26]), .in12(in[27]), .in13(in[28]), .in14(in[29]),
.in15(in[30]), .in16(in[31]), .in17(in[31]), .in18(in[31]), .in19(in[31]),
.in20(in[31]), .in21(in[31]), .in22(in[31]), .in23(in[31]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[15])
);


mux32 OUT_16 (
.in00(in[16]), .in01(in[17]), .in02(in[18]), .in03(in[19]), .in04(in[20]),
.in05(in[21]), .in06(in[22]), .in07(in[23]), .in08(in[24]), .in09(in[25]),
.in10(in[26]), .in11(in[27]), .in12(in[28]), .in13(in[29]), .in14(in[30]),
.in15(in[31]), .in16(in[31]), .in17(in[31]), .in18(in[31]), .in19(in[31]),
.in20(in[31]), .in21(in[31]), .in22(in[31]), .in23(in[31]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[16])
);


mux32 OUT_17 (
.in00(in[17]), .in01(in[18]), .in02(in[19]), .in03(in[20]), .in04(in[21]),
.in05(in[22]), .in06(in[23]), .in07(in[24]), .in08(in[25]), .in09(in[26]),
.in10(in[27]), .in11(in[28]), .in12(in[29]), .in13(in[30]), .in14(in[31]),
.in15(in[31]), .in16(in[31]), .in17(in[31]), .in18(in[31]), .in19(in[31]),
.in20(in[31]), .in21(in[31]), .in22(in[31]), .in23(in[31]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[17])
);


mux32 OUT_18 (
.in00(in[18]), .in01(in[19]), .in02(in[20]), .in03(in[21]), .in04(in[22]),
.in05(in[23]), .in06(in[24]), .in07(in[25]), .in08(in[26]), .in09(in[27]),
.in10(in[28]), .in11(in[29]), .in12(in[30]), .in13(in[31]), .in14(in[31]),
.in15(in[31]), .in16(in[31]), .in17(in[31]), .in18(in[31]), .in19(in[31]),
.in20(in[31]), .in21(in[31]), .in22(in[31]), .in23(in[31]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[18])
);


mux32 OUT_19 (
.in00(in[19]), .in01(in[20]), .in02(in[21]), .in03(in[22]), .in04(in[23]),
.in05(in[24]), .in06(in[25]), .in07(in[26]), .in08(in[27]), .in09(in[28]),
.in10(in[29]), .in11(in[30]), .in12(in[31]), .in13(in[31]), .in14(in[31]),
.in15(in[31]), .in16(in[31]), .in17(in[31]), .in18(in[31]), .in19(in[31]),
.in20(in[31]), .in21(in[31]), .in22(in[31]), .in23(in[31]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[19])
);


mux32 OUT_20 (
.in00(in[20]), .in01(in[21]), .in02(in[22]), .in03(in[23]), .in04(in[24]),
.in05(in[25]), .in06(in[26]), .in07(in[27]), .in08(in[28]), .in09(in[29]),
.in10(in[30]), .in11(in[31]), .in12(in[31]), .in13(in[31]), .in14(in[31]),
.in15(in[31]), .in16(in[31]), .in17(in[31]), .in18(in[31]), .in19(in[31]),
.in20(in[31]), .in21(in[31]), .in22(in[31]), .in23(in[31]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[20])
);


mux32 OUT_21 (
.in00(in[21]), .in01(in[22]), .in02(in[23]), .in03(in[24]), .in04(in[25]),
.in05(in[26]), .in06(in[27]), .in07(in[28]), .in08(in[29]), .in09(in[30]),
.in10(in[31]), .in11(in[31]), .in12(in[31]), .in13(in[31]), .in14(in[31]),
.in15(in[31]), .in16(in[31]), .in17(in[31]), .in18(in[31]), .in19(in[31]),
.in20(in[31]), .in21(in[31]), .in22(in[31]), .in23(in[31]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[21])
);


mux32 OUT_22 (
.in00(in[22]), .in01(in[23]), .in02(in[24]), .in03(in[25]), .in04(in[26]),
.in05(in[27]), .in06(in[28]), .in07(in[29]), .in08(in[30]), .in09(in[31]),
.in10(in[31]), .in11(in[31]), .in12(in[31]), .in13(in[31]), .in14(in[31]),
.in15(in[31]), .in16(in[31]), .in17(in[31]), .in18(in[31]), .in19(in[31]),
.in20(in[31]), .in21(in[31]), .in22(in[31]), .in23(in[31]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[22])
);


mux32 OUT_23 (
.in00(in[23]), .in01(in[24]), .in02(in[25]), .in03(in[26]), .in04(in[27]),
.in05(in[28]), .in06(in[29]), .in07(in[30]), .in08(in[31]), .in09(in[31]),
.in10(in[31]), .in11(in[31]), .in12(in[31]), .in13(in[31]), .in14(in[31]),
.in15(in[31]), .in16(in[31]), .in17(in[31]), .in18(in[31]), .in19(in[31]),
.in20(in[31]), .in21(in[31]), .in22(in[31]), .in23(in[31]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[23])
);


mux32 OUT_24 (
.in00(in[24]), .in01(in[25]), .in02(in[26]), .in03(in[27]), .in04(in[28]),
.in05(in[29]), .in06(in[30]), .in07(in[31]), .in08(in[31]), .in09(in[31]),
.in10(in[31]), .in11(in[31]), .in12(in[31]), .in13(in[31]), .in14(in[31]),
.in15(in[31]), .in16(in[31]), .in17(in[31]), .in18(in[31]), .in19(in[31]),
.in20(in[31]), .in21(in[31]), .in22(in[31]), .in23(in[31]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[24])
);


mux32 OUT_25 (
.in00(in[25]), .in01(in[26]), .in02(in[27]), .in03(in[28]), .in04(in[29]),
.in05(in[30]), .in06(in[31]), .in07(in[31]), .in08(in[31]), .in09(in[31]),
.in10(in[31]), .in11(in[31]), .in12(in[31]), .in13(in[31]), .in14(in[31]),
.in15(in[31]), .in16(in[31]), .in17(in[31]), .in18(in[31]), .in19(in[31]),
.in20(in[31]), .in21(in[31]), .in22(in[31]), .in23(in[31]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[25])
);


mux32 OUT_26 (
.in00(in[26]), .in01(in[27]), .in02(in[28]), .in03(in[29]), .in04(in[30]),
.in05(in[31]), .in06(in[31]), .in07(in[31]), .in08(in[31]), .in09(in[31]),
.in10(in[31]), .in11(in[31]), .in12(in[31]), .in13(in[31]), .in14(in[31]),
.in15(in[31]), .in16(in[31]), .in17(in[31]), .in18(in[31]), .in19(in[31]),
.in20(in[31]), .in21(in[31]), .in22(in[31]), .in23(in[31]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[26])
);


mux32 OUT_27 (
.in00(in[27]), .in01(in[28]), .in02(in[29]), .in03(in[30]), .in04(in[31]),
.in05(in[31]), .in06(in[31]), .in07(in[31]), .in08(in[31]), .in09(in[31]),
.in10(in[31]), .in11(in[31]), .in12(in[31]), .in13(in[31]), .in14(in[31]),
.in15(in[31]), .in16(in[31]), .in17(in[31]), .in18(in[31]), .in19(in[31]),
.in20(in[31]), .in21(in[31]), .in22(in[31]), .in23(in[31]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[27])
);


mux32 OUT_28 (
.in00(in[28]), .in01(in[29]), .in02(in[30]), .in03(in[31]), .in04(in[31]),
.in05(in[31]), .in06(in[31]), .in07(in[31]), .in08(in[31]), .in09(in[31]),
.in10(in[31]), .in11(in[31]), .in12(in[31]), .in13(in[31]), .in14(in[31]),
.in15(in[31]), .in16(in[31]), .in17(in[31]), .in18(in[31]), .in19(in[31]),
.in20(in[31]), .in21(in[31]), .in22(in[31]), .in23(in[31]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[28])
);


mux32 OUT_29 (
.in00(in[29]), .in01(in[30]), .in02(in[31]), .in03(in[31]), .in04(in[31]),
.in05(in[31]), .in06(in[31]), .in07(in[31]), .in08(in[31]), .in09(in[31]),
.in10(in[31]), .in11(in[31]), .in12(in[31]), .in13(in[31]), .in14(in[31]),
.in15(in[31]), .in16(in[31]), .in17(in[31]), .in18(in[31]), .in19(in[31]),
.in20(in[31]), .in21(in[31]), .in22(in[31]), .in23(in[31]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[29])
);


mux32 OUT_30 (
.in00(in[30]), .in01(in[31]), .in02(in[31]), .in03(in[31]), .in04(in[31]),
.in05(in[31]), .in06(in[31]), .in07(in[31]), .in08(in[31]), .in09(in[31]),
.in10(in[31]), .in11(in[31]), .in12(in[31]), .in13(in[31]), .in14(in[31]),
.in15(in[31]), .in16(in[31]), .in17(in[31]), .in18(in[31]), .in19(in[31]),
.in20(in[31]), .in21(in[31]), .in22(in[31]), .in23(in[31]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[30])
);


mux32 OUT_31 (
.in00(in[31]), .in01(in[31]), .in02(in[31]), .in03(in[31]), .in04(in[31]),
.in05(in[31]), .in06(in[31]), .in07(in[31]), .in08(in[31]), .in09(in[31]),
.in10(in[31]), .in11(in[31]), .in12(in[31]), .in13(in[31]), .in14(in[31]),
.in15(in[31]), .in16(in[31]), .in17(in[31]), .in18(in[31]), .in19(in[31]),
.in20(in[31]), .in21(in[31]), .in22(in[31]), .in23(in[31]), .in24(in[31]),
.in25(in[31]), .in26(in[31]), .in27(in[31]), .in28(in[31]), .in29(in[31]),
.in30(in[31]), .in31(in[31]), .select(shamt), .out(out[31])
);

endmodule
