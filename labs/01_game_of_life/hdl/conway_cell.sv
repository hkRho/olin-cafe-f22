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


    logic [7:0] one_bit_out;

    adder_1 adder1_0 (.a(neighbors[0]), .b(neighbors[1]), .c_in(1'b0), .sum(one_bit_out[0]), .c_out(one_bit_out[1]));
    adder_1 adder1_1 (.a(neighbors[2]), .b(neighbors[3]), .c_in(1'b0), .sum(one_bit_out[2]), .c_out(one_bit_out[3]));
    adder_1 adder1_2 (.a(neighbors[4]), .b(neighbors[5]), .c_in(1'b0), .sum(one_bit_out[4]), .c_out(one_bit_out[5]));
    adder_1 adder1_3 (.a(neighbors[6]), .b(neighbors[7]), .c_in(1'b0), .sum(one_bit_out[6]), .c_out(one_bit_out[7]));

    logic [5:0] two_bit_out;

    adder_n #(.N(2)) adder2_0 (.a(one_bit_out[1:0]), .b(one_bit_out[3:2]), .c_in(1'b0), .sum(two_bit_out[1:0]), .c_out(two_bit_out[2]));
    adder_n #(.N(2)) adder2_1 (.a(one_bit_out[5:4]), .b(one_bit_out[7:6]), .c_in(1'b0), .sum(two_bit_out[4:3]), .c_out(two_bit_out[5]));

    logic [3:0] three_bit_out;

    adder_n #(.N(3)) adder3_0 (.a(two_bit_out[2:0]), .b(two_bit_out[5:3]), .c_in(1'b0), .sum(three_bit_out[2:0]), .c_out(three_bit_out[3]));

    logic on_3;
    logic on_2;

    always_comb begin 
        // state_d = (state_0 & (three_bit_out == 3'b010) | (three_bit_out == 3'b011));
        // state_d = ((state_0 & ~three_bit_out[0] & three_bit_out[1] & ~three_bit_out[2]) | (three_bit_out[0] & three_bit_out[1] & ~three_bit_out[2]));
        on_3 = ~three_bit_out[3] & ~three_bit_out[2] & three_bit_out[1] & three_bit_out[0];
        on_2 = state_q & ~three_bit_out[3] & ~three_bit_out[2] & three_bit_out[1] & ~three_bit_out[0];
        state_d = on_3 | on_2;
    end


    always_ff @(posedge clk) begin : delay

        if (rst) begin
            state_q <= state_0;
        end
        else if (ena) begin
            state_q <= state_d;
        end else begin
            state_q <= state_q;
        end
    end

endmodule