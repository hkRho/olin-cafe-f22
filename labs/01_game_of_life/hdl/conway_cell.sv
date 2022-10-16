`default_nettype none
`timescale 1ns/1ps

module conway_cell(clk, rst, ena, state_0, state_d, state_q, neighbors);
    input wire clk;
    input wire rst;
    input wire ena;

    input wire state_0;
    output logic state_d; // NOTE - this is only an output of the module for debugging purposes. 
    output logic state_q;

    input wire [7:0] neighbors;


    wire [7:0] 1_bit_out;

    adder_1 adder1_0 (.a(neighbors[0]), .b(neighbors[1]), .c_in(1'b0), .sum(1_bit_out[0]), .c_out(1_bit_out[1]));
    adder_1 adder1_1 (.a(neighbors[2]), .b(neighbors[3]), .c_in(1'b0), .sum(1_bit_out[2]), .c_out(1_bit_out[3]));
    adder_1 adder1_2 (.a(neighbors[4]), .b(neighbors[5]), .c_in(1'b0), .sum(1_bit_out[4]), .c_out(1_bit_out[5]));
    adder_1 adder1_3 (.a(neighbors[6]), .b(neighbors[7]), .c_in(1'b0), .sum(1_bit_out[6]), .c_out(1_bit_out[7]));

    wire [5:0] 2_bit_sum;

    adder_n adder2_0 (.n(2), .a(1_bit_out[1:0]), .b(1_bit_out[3:2]), .c_in(1'b0), .sum(2_bit_sum[1:0]), .c_out(2_bit_sum[2]));
    adder_n adder2_1 (.n(2), .a(1_bit_out[5:4]), .b(1_bit_out[7:6]), .c_in(1'b0), .sum(2_bit_sum[4:3]), .c_out(2_bit_sum[5]));

    wire [3:0] 3_bit_sum;

    adder_n adder3_0 (.n(3), .a(2_bit_out[2:0]), .b(2_bit_out[5:3]), .c_in(1'b0), .sum(2_bit_sum[2:0]), .c_out(2_bit_sum[3]));

    state_d = (state_0 & (3_bit_sum == 3'b010)) | (3_bit_sum == 3'b011);

endmodule

always_ff @(posedge clk) begin : delay

    state_q <= state_d;
    
end