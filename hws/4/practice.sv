`timescale 1ns/1ps
`default_nettype none

module practice(rst, clk, ena, seed, out);

input wire rst, clk, ena, seed;
output wire out;
logic A, B, Q1, Q2;

always_comb begin
    A = ena ? B : seed;
    B = Q1 ^ Q2;
end

always_ff @(posedge clk) begin : ff1
    if (rst)
        Q1 <= 1'b0;
    else
        Q1 <= A;
end

always_ff @(posedge clk) begin : ff2
    if (rst)
        Q2 <= 1'b0;
    else
        Q2 <= Q1;
end

reg outt;
always_ff @(posedge clk) begin : f
    if (rst)
        outt <= 1'b0;
    else
        outt <= Q2;
end
assign out = outt;

endmodule
