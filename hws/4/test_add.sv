`timescale 1ns / 1ps
`default_nettype none

`define SIMULATION

module test_add32;

parameter N = 32;
parameter NUM_BITS = 2 ** N;

// flip all logics/wires from the UUT (Unit Under Test)
logic [N-1:0] a, b;
logic c_in;
logic [N-1:0] summ;
wire [N-1:0] sum;
wire c_out;

add32 UUT(
    .a(a), 
    .b(b), 
    .c_in(c_in), 
    .s(sum), 
    .c_out(c_out)
);

initial begin // In standard programming land (line by line execution)
// Collect waveforms
$dumpfile("add32.fst");
$dumpvars(0, UUT);

// check overflow
$display("OVERFLOW TEST CASE");
a = 32'b1111_1111_1111_1111_1111_1111_1111_1111;
b = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
c_in = 0;
summ = a + b + c_in;
#1 
$display("  | %32b\n", a);
$display("  | %32b\n", b);
$display("%1b | %32b\n", c_out, summ);


// random input generation
$display("RANDOM TEST CASES");
for (int i = 0; i < 10; i = i + 1) begin
    a = $urandom % NUM_BITS;
    b = $urandom % NUM_BITS;
    c_in = 0;
    summ = a + b;
    #1 
    $display("  | %32b\n", a);
    $display("  | %32b\n", b);
    $display("%1b | %32b\n", c_out, summ);
    $display("--------------------------------------");
end
    
$finish;      
end

endmodule