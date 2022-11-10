// did not implement overflow logic, but put the schematic approach in PDF

`timescale 1ns/1ps
`default_nettype none
module shift_left_logical(in, shamt, out);

parameter N = 32; // only used as a constant! Don't feel like you need to a shifter for arbitrary N.

input wire [N-1:0] in;            // the input number that will be shifted left. Fill in the remainder with zeros.
input wire [$clog2(N)-1:0] shamt; // the amount to shift by (think of it as a decimal number from 0 to 31). 
output logic [N-1:0] out;       

mux32 OUT_31 (
.in00(in[31]), .in01(in[30]), .in02(in[29]), .in03(in[28]), .in04(in[27]),
.in05(in[26]), .in06(in[25]), .in07(in[24]), .in08(in[23]), .in09(in[22]),
.in10(in[21]), .in11(in[20]), .in12(in[19]), .in13(in[18]), .in14(in[17]),
.in15(in[16]), .in16(in[15]), .in17(in[14]), .in18(in[13]), .in19(in[12]),
.in20(in[11]), .in21(in[10]), .in22(in[9]), .in23(in[8]), .in24(in[7]),
.in25(in[6]), .in26(in[5]), .in27(in[4]), .in28(in[3]), .in29(in[2]),
.in30(in[1]), .in31(in[0]), .select(shamt), .out(out[31])
);

mux32 OUT_30 (
.in00(in[30]), .in01(in[29]), .in02(in[28]), .in03(in[27]), .in04(in[26]),
.in05(in[25]), .in06(in[24]), .in07(in[23]), .in08(in[22]), .in09(in[21]),
.in10(in[20]), .in11(in[19]), .in12(in[18]), .in13(in[17]), .in14(in[16]),
.in15(in[15]), .in16(in[14]), .in17(in[13]), .in18(in[12]), .in19(in[11]),
.in20(in[10]), .in21(in[9]), .in22(in[8]), .in23(in[7]), .in24(in[6]),
.in25(in[5]), .in26(in[4]), .in27(in[3]), .in28(in[2]), .in29(in[1]),
.in30(in[0]), .in31(0), .select(shamt), .out(out[30])
);


mux32 OUT_29 (
.in00(in[29]), .in01(in[28]), .in02(in[27]), .in03(in[26]), .in04(in[25]),
.in05(in[24]), .in06(in[23]), .in07(in[22]), .in08(in[21]), .in09(in[20]),
.in10(in[19]), .in11(in[18]), .in12(in[17]), .in13(in[16]), .in14(in[15]),
.in15(in[14]), .in16(in[13]), .in17(in[12]), .in18(in[11]), .in19(in[10]),
.in20(in[9]), .in21(in[8]), .in22(in[7]), .in23(in[6]), .in24(in[5]),
.in25(in[4]), .in26(in[3]), .in27(in[2]), .in28(in[1]), .in29(in[0]), .in30(0),
.in31(0), .select(shamt), .out(out[29])
);


mux32 OUT_28 (
.in00(in[28]), .in01(in[27]), .in02(in[26]), .in03(in[25]), .in04(in[24]),
.in05(in[23]), .in06(in[22]), .in07(in[21]), .in08(in[20]), .in09(in[19]),
.in10(in[18]), .in11(in[17]), .in12(in[16]), .in13(in[15]), .in14(in[14]),
.in15(in[13]), .in16(in[12]), .in17(in[11]), .in18(in[10]), .in19(in[9]),
.in20(in[8]), .in21(in[7]), .in22(in[6]), .in23(in[5]), .in24(in[4]),
.in25(in[3]), .in26(in[2]), .in27(in[1]), .in28(in[0]), .in29(0), .in30(0),
.in31(0), .select(shamt), .out(out[28])
);


mux32 OUT_27 (
.in00(in[27]), .in01(in[26]), .in02(in[25]), .in03(in[24]), .in04(in[23]),
.in05(in[22]), .in06(in[21]), .in07(in[20]), .in08(in[19]), .in09(in[18]),
.in10(in[17]), .in11(in[16]), .in12(in[15]), .in13(in[14]), .in14(in[13]),
.in15(in[12]), .in16(in[11]), .in17(in[10]), .in18(in[9]), .in19(in[8]),
.in20(in[7]), .in21(in[6]), .in22(in[5]), .in23(in[4]), .in24(in[3]),
.in25(in[2]), .in26(in[1]), .in27(in[0]), .in28(0), .in29(0), .in30(0),
.in31(0), .select(shamt), .out(out[27])
);


mux32 OUT_26 (
.in00(in[26]), .in01(in[25]), .in02(in[24]), .in03(in[23]), .in04(in[22]),
.in05(in[21]), .in06(in[20]), .in07(in[19]), .in08(in[18]), .in09(in[17]),
.in10(in[16]), .in11(in[15]), .in12(in[14]), .in13(in[13]), .in14(in[12]),
.in15(in[11]), .in16(in[10]), .in17(in[9]), .in18(in[8]), .in19(in[7]),
.in20(in[6]), .in21(in[5]), .in22(in[4]), .in23(in[3]), .in24(in[2]),
.in25(in[1]), .in26(in[0]), .in27(0), .in28(0), .in29(0), .in30(0), .in31(0),
.select(shamt), .out(out[26])
);


mux32 OUT_25 (
.in00(in[25]), .in01(in[24]), .in02(in[23]), .in03(in[22]), .in04(in[21]),
.in05(in[20]), .in06(in[19]), .in07(in[18]), .in08(in[17]), .in09(in[16]),
.in10(in[15]), .in11(in[14]), .in12(in[13]), .in13(in[12]), .in14(in[11]),
.in15(in[10]), .in16(in[9]), .in17(in[8]), .in18(in[7]), .in19(in[6]),
.in20(in[5]), .in21(in[4]), .in22(in[3]), .in23(in[2]), .in24(in[1]),
.in25(in[0]), .in26(0), .in27(0), .in28(0), .in29(0), .in30(0), .in31(0),
.select(shamt), .out(out[25])
);


mux32 OUT_24 (
.in00(in[24]), .in01(in[23]), .in02(in[22]), .in03(in[21]), .in04(in[20]),
.in05(in[19]), .in06(in[18]), .in07(in[17]), .in08(in[16]), .in09(in[15]),
.in10(in[14]), .in11(in[13]), .in12(in[12]), .in13(in[11]), .in14(in[10]),
.in15(in[9]), .in16(in[8]), .in17(in[7]), .in18(in[6]), .in19(in[5]),
.in20(in[4]), .in21(in[3]), .in22(in[2]), .in23(in[1]), .in24(in[0]), .in25(0),
.in26(0), .in27(0), .in28(0), .in29(0), .in30(0), .in31(0), .select(shamt),
.out(out[24])
);


mux32 OUT_23 (
.in00(in[23]), .in01(in[22]), .in02(in[21]), .in03(in[20]), .in04(in[19]),
.in05(in[18]), .in06(in[17]), .in07(in[16]), .in08(in[15]), .in09(in[14]),
.in10(in[13]), .in11(in[12]), .in12(in[11]), .in13(in[10]), .in14(in[9]),
.in15(in[8]), .in16(in[7]), .in17(in[6]), .in18(in[5]), .in19(in[4]),
.in20(in[3]), .in21(in[2]), .in22(in[1]), .in23(in[0]), .in24(0), .in25(0),
.in26(0), .in27(0), .in28(0), .in29(0), .in30(0), .in31(0), .select(shamt),
.out(out[23])
);


mux32 OUT_22 (
.in00(in[22]), .in01(in[21]), .in02(in[20]), .in03(in[19]), .in04(in[18]),
.in05(in[17]), .in06(in[16]), .in07(in[15]), .in08(in[14]), .in09(in[13]),
.in10(in[12]), .in11(in[11]), .in12(in[10]), .in13(in[9]), .in14(in[8]),
.in15(in[7]), .in16(in[6]), .in17(in[5]), .in18(in[4]), .in19(in[3]),
.in20(in[2]), .in21(in[1]), .in22(in[0]), .in23(0), .in24(0), .in25(0),
.in26(0), .in27(0), .in28(0), .in29(0), .in30(0), .in31(0), .select(shamt),
.out(out[22])
);


mux32 OUT_21 (
.in00(in[21]), .in01(in[20]), .in02(in[19]), .in03(in[18]), .in04(in[17]),
.in05(in[16]), .in06(in[15]), .in07(in[14]), .in08(in[13]), .in09(in[12]),
.in10(in[11]), .in11(in[10]), .in12(in[9]), .in13(in[8]), .in14(in[7]),
.in15(in[6]), .in16(in[5]), .in17(in[4]), .in18(in[3]), .in19(in[2]),
.in20(in[1]), .in21(in[0]), .in22(0), .in23(0), .in24(0), .in25(0), .in26(0),
.in27(0), .in28(0), .in29(0), .in30(0), .in31(0), .select(shamt), .out(out[21])
);


mux32 OUT_20 (
.in00(in[20]), .in01(in[19]), .in02(in[18]), .in03(in[17]), .in04(in[16]),
.in05(in[15]), .in06(in[14]), .in07(in[13]), .in08(in[12]), .in09(in[11]),
.in10(in[10]), .in11(in[9]), .in12(in[8]), .in13(in[7]), .in14(in[6]),
.in15(in[5]), .in16(in[4]), .in17(in[3]), .in18(in[2]), .in19(in[1]),
.in20(in[0]), .in21(0), .in22(0), .in23(0), .in24(0), .in25(0), .in26(0),
.in27(0), .in28(0), .in29(0), .in30(0), .in31(0), .select(shamt), .out(out[20])
);


mux32 OUT_19 (
.in00(in[19]), .in01(in[18]), .in02(in[17]), .in03(in[16]), .in04(in[15]),
.in05(in[14]), .in06(in[13]), .in07(in[12]), .in08(in[11]), .in09(in[10]),
.in10(in[9]), .in11(in[8]), .in12(in[7]), .in13(in[6]), .in14(in[5]),
.in15(in[4]), .in16(in[3]), .in17(in[2]), .in18(in[1]), .in19(in[0]), .in20(0),
.in21(0), .in22(0), .in23(0), .in24(0), .in25(0), .in26(0), .in27(0), .in28(0),
.in29(0), .in30(0), .in31(0), .select(shamt), .out(out[19])
);


mux32 OUT_18 (
.in00(in[18]), .in01(in[17]), .in02(in[16]), .in03(in[15]), .in04(in[14]),
.in05(in[13]), .in06(in[12]), .in07(in[11]), .in08(in[10]), .in09(in[9]),
.in10(in[8]), .in11(in[7]), .in12(in[6]), .in13(in[5]), .in14(in[4]),
.in15(in[3]), .in16(in[2]), .in17(in[1]), .in18(in[0]), .in19(0), .in20(0),
.in21(0), .in22(0), .in23(0), .in24(0), .in25(0), .in26(0), .in27(0), .in28(0),
.in29(0), .in30(0), .in31(0), .select(shamt), .out(out[18])
);


mux32 OUT_17 (
.in00(in[17]), .in01(in[16]), .in02(in[15]), .in03(in[14]), .in04(in[13]),
.in05(in[12]), .in06(in[11]), .in07(in[10]), .in08(in[9]), .in09(in[8]),
.in10(in[7]), .in11(in[6]), .in12(in[5]), .in13(in[4]), .in14(in[3]),
.in15(in[2]), .in16(in[1]), .in17(in[0]), .in18(0), .in19(0), .in20(0),
.in21(0), .in22(0), .in23(0), .in24(0), .in25(0), .in26(0), .in27(0), .in28(0),
.in29(0), .in30(0), .in31(0), .select(shamt), .out(out[17])
);


mux32 OUT_16 (
.in00(in[16]), .in01(in[15]), .in02(in[14]), .in03(in[13]), .in04(in[12]),
.in05(in[11]), .in06(in[10]), .in07(in[9]), .in08(in[8]), .in09(in[7]),
.in10(in[6]), .in11(in[5]), .in12(in[4]), .in13(in[3]), .in14(in[2]),
.in15(in[1]), .in16(in[0]), .in17(0), .in18(0), .in19(0), .in20(0), .in21(0),
.in22(0), .in23(0), .in24(0), .in25(0), .in26(0), .in27(0), .in28(0), .in29(0),
.in30(0), .in31(0), .select(shamt), .out(out[16])
);


mux32 OUT_15 (
.in00(in[15]), .in01(in[14]), .in02(in[13]), .in03(in[12]), .in04(in[11]),
.in05(in[10]), .in06(in[9]), .in07(in[8]), .in08(in[7]), .in09(in[6]),
.in10(in[5]), .in11(in[4]), .in12(in[3]), .in13(in[2]), .in14(in[1]),
.in15(in[0]), .in16(0), .in17(0), .in18(0), .in19(0), .in20(0), .in21(0),
.in22(0), .in23(0), .in24(0), .in25(0), .in26(0), .in27(0), .in28(0), .in29(0),
.in30(0), .in31(0), .select(shamt), .out(out[15])
);


mux32 OUT_14 (
.in00(in[14]), .in01(in[13]), .in02(in[12]), .in03(in[11]), .in04(in[10]),
.in05(in[9]), .in06(in[8]), .in07(in[7]), .in08(in[6]), .in09(in[5]),
.in10(in[4]), .in11(in[3]), .in12(in[2]), .in13(in[1]), .in14(in[0]), .in15(0),
.in16(0), .in17(0), .in18(0), .in19(0), .in20(0), .in21(0), .in22(0), .in23(0),
.in24(0), .in25(0), .in26(0), .in27(0), .in28(0), .in29(0), .in30(0), .in31(0),
.select(shamt), .out(out[14])
);


mux32 OUT_13 (
.in00(in[13]), .in01(in[12]), .in02(in[11]), .in03(in[10]), .in04(in[9]),
.in05(in[8]), .in06(in[7]), .in07(in[6]), .in08(in[5]), .in09(in[4]),
.in10(in[3]), .in11(in[2]), .in12(in[1]), .in13(in[0]), .in14(0), .in15(0),
.in16(0), .in17(0), .in18(0), .in19(0), .in20(0), .in21(0), .in22(0), .in23(0),
.in24(0), .in25(0), .in26(0), .in27(0), .in28(0), .in29(0), .in30(0), .in31(0),
.select(shamt), .out(out[13])
);


mux32 OUT_12 (
.in00(in[12]), .in01(in[11]), .in02(in[10]), .in03(in[9]), .in04(in[8]),
.in05(in[7]), .in06(in[6]), .in07(in[5]), .in08(in[4]), .in09(in[3]),
.in10(in[2]), .in11(in[1]), .in12(in[0]), .in13(0), .in14(0), .in15(0),
.in16(0), .in17(0), .in18(0), .in19(0), .in20(0), .in21(0), .in22(0), .in23(0),
.in24(0), .in25(0), .in26(0), .in27(0), .in28(0), .in29(0), .in30(0), .in31(0),
.select(shamt), .out(out[12])
);


mux32 OUT_11 (
.in00(in[11]), .in01(in[10]), .in02(in[9]), .in03(in[8]), .in04(in[7]),
.in05(in[6]), .in06(in[5]), .in07(in[4]), .in08(in[3]), .in09(in[2]),
.in10(in[1]), .in11(in[0]), .in12(0), .in13(0), .in14(0), .in15(0), .in16(0),
.in17(0), .in18(0), .in19(0), .in20(0), .in21(0), .in22(0), .in23(0), .in24(0),
.in25(0), .in26(0), .in27(0), .in28(0), .in29(0), .in30(0), .in31(0),
.select(shamt), .out(out[11])
);


mux32 OUT_10 (
.in00(in[10]), .in01(in[9]), .in02(in[8]), .in03(in[7]), .in04(in[6]),
.in05(in[5]), .in06(in[4]), .in07(in[3]), .in08(in[2]), .in09(in[1]),
.in10(in[0]), .in11(0), .in12(0), .in13(0), .in14(0), .in15(0), .in16(0),
.in17(0), .in18(0), .in19(0), .in20(0), .in21(0), .in22(0), .in23(0), .in24(0),
.in25(0), .in26(0), .in27(0), .in28(0), .in29(0), .in30(0), .in31(0),
.select(shamt), .out(out[10])
);


mux32 OUT_9 (
.in00(in[9]), .in01(in[8]), .in02(in[7]), .in03(in[6]), .in04(in[5]),
.in05(in[4]), .in06(in[3]), .in07(in[2]), .in08(in[1]), .in09(in[0]), .in10(0),
.in11(0), .in12(0), .in13(0), .in14(0), .in15(0), .in16(0), .in17(0), .in18(0),
.in19(0), .in20(0), .in21(0), .in22(0), .in23(0), .in24(0), .in25(0), .in26(0),
.in27(0), .in28(0), .in29(0), .in30(0), .in31(0), .select(shamt), .out(out[9])
);


mux32 OUT_8 (
.in00(in[8]), .in01(in[7]), .in02(in[6]), .in03(in[5]), .in04(in[4]),
.in05(in[3]), .in06(in[2]), .in07(in[1]), .in08(in[0]), .in09(0), .in10(0),
.in11(0), .in12(0), .in13(0), .in14(0), .in15(0), .in16(0), .in17(0), .in18(0),
.in19(0), .in20(0), .in21(0), .in22(0), .in23(0), .in24(0), .in25(0), .in26(0),
.in27(0), .in28(0), .in29(0), .in30(0), .in31(0), .select(shamt), .out(out[8])
);


mux32 OUT_7 (
.in00(in[7]), .in01(in[6]), .in02(in[5]), .in03(in[4]), .in04(in[3]),
.in05(in[2]), .in06(in[1]), .in07(in[0]), .in08(0), .in09(0), .in10(0),
.in11(0), .in12(0), .in13(0), .in14(0), .in15(0), .in16(0), .in17(0), .in18(0),
.in19(0), .in20(0), .in21(0), .in22(0), .in23(0), .in24(0), .in25(0), .in26(0),
.in27(0), .in28(0), .in29(0), .in30(0), .in31(0), .select(shamt), .out(out[7])
);


mux32 OUT_6 (
.in00(in[6]), .in01(in[5]), .in02(in[4]), .in03(in[3]), .in04(in[2]),
.in05(in[1]), .in06(in[0]), .in07(0), .in08(0), .in09(0), .in10(0), .in11(0),
.in12(0), .in13(0), .in14(0), .in15(0), .in16(0), .in17(0), .in18(0), .in19(0),
.in20(0), .in21(0), .in22(0), .in23(0), .in24(0), .in25(0), .in26(0), .in27(0),
.in28(0), .in29(0), .in30(0), .in31(0), .select(shamt), .out(out[6])
);


mux32 OUT_5 (
.in00(in[5]), .in01(in[4]), .in02(in[3]), .in03(in[2]), .in04(in[1]),
.in05(in[0]), .in06(0), .in07(0), .in08(0), .in09(0), .in10(0), .in11(0),
.in12(0), .in13(0), .in14(0), .in15(0), .in16(0), .in17(0), .in18(0), .in19(0),
.in20(0), .in21(0), .in22(0), .in23(0), .in24(0), .in25(0), .in26(0), .in27(0),
.in28(0), .in29(0), .in30(0), .in31(0), .select(shamt), .out(out[5])
);


mux32 OUT_4 (
.in00(in[4]), .in01(in[3]), .in02(in[2]), .in03(in[1]), .in04(in[0]), .in05(0),
.in06(0), .in07(0), .in08(0), .in09(0), .in10(0), .in11(0), .in12(0), .in13(0),
.in14(0), .in15(0), .in16(0), .in17(0), .in18(0), .in19(0), .in20(0), .in21(0),
.in22(0), .in23(0), .in24(0), .in25(0), .in26(0), .in27(0), .in28(0), .in29(0),
.in30(0), .in31(0), .select(shamt), .out(out[4])
);


mux32 OUT_3 (
.in00(in[3]), .in01(in[2]), .in02(in[1]), .in03(in[0]), .in04(0), .in05(0),
.in06(0), .in07(0), .in08(0), .in09(0), .in10(0), .in11(0), .in12(0), .in13(0),
.in14(0), .in15(0), .in16(0), .in17(0), .in18(0), .in19(0), .in20(0), .in21(0),
.in22(0), .in23(0), .in24(0), .in25(0), .in26(0), .in27(0), .in28(0), .in29(0),
.in30(0), .in31(0), .select(shamt), .out(out[3])
);


mux32 OUT_2 (
.in00(in[2]), .in01(in[1]), .in02(in[0]), .in03(0), .in04(0), .in05(0),
.in06(0), .in07(0), .in08(0), .in09(0), .in10(0), .in11(0), .in12(0), .in13(0),
.in14(0), .in15(0), .in16(0), .in17(0), .in18(0), .in19(0), .in20(0), .in21(0),
.in22(0), .in23(0), .in24(0), .in25(0), .in26(0), .in27(0), .in28(0), .in29(0),
.in30(0), .in31(0), .select(shamt), .out(out[2])
);


mux32 OUT_1 (
.in00(in[1]), .in01(in[0]), .in02(0), .in03(0), .in04(0), .in05(0), .in06(0),
.in07(0), .in08(0), .in09(0), .in10(0), .in11(0), .in12(0), .in13(0), .in14(0),
.in15(0), .in16(0), .in17(0), .in18(0), .in19(0), .in20(0), .in21(0), .in22(0),
.in23(0), .in24(0), .in25(0), .in26(0), .in27(0), .in28(0), .in29(0), .in30(0),
.in31(0), .select(shamt), .out(out[1])
);


mux32 OUT_0 (
.in00(in[0]), .in01(0), .in02(0), .in03(0), .in04(0), .in05(0), .in06(0),
.in07(0), .in08(0), .in09(0), .in10(0), .in11(0), .in12(0), .in13(0), .in14(0),
.in15(0), .in16(0), .in17(0), .in18(0), .in19(0), .in20(0), .in21(0), .in22(0),
.in23(0), .in24(0), .in25(0), .in26(0), .in27(0), .in28(0), .in29(0), .in30(0),
.in31(0), .select(shamt), .out(out[0])
);

endmodule
