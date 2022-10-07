
// `include "decoder_2_to_4.sv"
module decoder_3_to_8(ena, in, out);

  input wire ena;
  input wire [2:0] in;
  output logic [7:0] out;
  logic [7:0] outputt;

  decoder_2_to_4 d24_inst1 (
    .ena(in[2]),
    .in(in[1:0]),
    .out(outputt[7:4])
  );

  decoder_2_to_4 d24_inst2 (
    .ena(~ in[2]),
    .in(in[1:0]),
    .out(outputt[3:0])
  );

always_comb begin
    out[7] = outputt[7] & ena;
    out[6] = outputt[6] & ena;
    out[5] = outputt[5] & ena;
    out[4] = outputt[4] & ena;
    out[3] = outputt[3] & ena;
    out[2] = outputt[2] & ena;
    out[1] = outputt[1] & ena;
    out[0] = outputt[0] & ena;
end

endmodule