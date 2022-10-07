`timescale 1ns/1ps
module decoder_2_to_4(ena, in, out);

input wire ena;
input wire [1:0] in;
output logic [3:0] out;


always_comb begin
  out[3] = in[1] & in[0] & ena;
  out[2] = in[1] & ~ in[0] & ena;
  out[1] = ~ in[1] & in[0] & ena;
  out[0] = ~ in[1] & ~ in[0] & ena;
end

endmodule