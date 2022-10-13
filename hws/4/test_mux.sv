`timescale 1ns/1ps
`default_nettype none

module test_mux32;

// logics for all inputs to the UUT
parameter N = 32;
logic [(N-1):0] in00, in01, in02, in03, in04, in05, in06, in07, in08, 
    in09, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, 
    in21, in22, in23, in24, in25, in26, in27, in28, in29, in30, in31;
logic [4:0] select;
wire [(N-1):0] out;

mux32 #(.N(N)) UUT(
  .in00(in00),
  .in01(in01),
  .in02(in02),
  .in03(in03),
  .in04(in04),
  .in05(in05),
  .in06(in06),
  .in07(in07),
  .in08(in08),
  .in09(in09),
  .in10(in10),
  .in11(in11),
  .in12(in12),
  .in13(in13),
  .in14(in14),
  .in15(in15),
  .in16(in16),
  .in17(in17),
  .in18(in18),
  .in19(in19),
  .in20(in20),
  .in21(in21),
  .in22(in22),
  .in23(in23),
  .in24(in24),
  .in25(in25),
  .in26(in26),
  .in27(in27),
  .in28(in28),
  .in29(in29),
  .in30(in30),
  .in31(in31),
  .out(out),
  .select(select)
);

initial begin
  $dumpfile("mux32.fst");
  $dumpvars(0, UUT);

  in00 = 32'd0;
  in01 = 32'd1;
  in02 = 32'd2;
  in03 = 32'd3;
  in04 = 32'd4;
  in05 = 32'd5;
  in06 = 32'd6;
  in07 = 32'd7;
  in08 = 32'd8;
  in09 = 32'd9;
  in10 = 32'd10;
  in11 = 32'd11;
  in12 = 32'd12;
  in13 = 32'd13;
  in14 = 32'd14;
  in15 = 32'd15;
  in16 = 32'd16;
  in17 = 32'd17;
  in18 = 32'd18;
  in19 = 32'd19;
  in20 = 32'd20;
  in21 = 32'd21;
  in22 = 32'd22;
  in23 = 32'd23;
  in24 = 32'd24;
  in25 = 32'd25;
  in26 = 32'd26;
  in27 = 32'd27;
  in28 = 32'd28;
  in29 = 32'd29;
  in30 = 32'd30;
  in31 = 32'd31;
  $display("Running simulation...");

  // int i is 32 bits, want only 2 bits of that.
  for(int i = 0; i < 4; i = i + 1) begin
    select = i[1:0]; // get the lower two bits of i.
    #10;
  end
  
  $display("... done. Use gtkwave to see what this does!");
  $finish;
end

endmodule