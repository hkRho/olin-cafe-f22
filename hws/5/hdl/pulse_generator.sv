/*
  Outputs a pulse generator with a period of "ticks".
  out should go high for one cycle ever "ticks" clocks.
*/
module pulse_generator(clk, rst, ena, ticks, out);

parameter N = 8;
input wire clk, rst, ena;
input wire [N-1:0] ticks;
output logic out;

// logic [N-1:0] counter = 0;
// logic counter_rst;

// always_comb begin : cl
//     counter_rst = (rst | out);
//     out = (counter == ticks);
// end

// always_ff @( posedge clk ) begin : pulse_gen
//     if (counter_rst)
//         counter <= 0;

//     else if (ena)
//         counter <= counter + 1;    
// end

// // logic counter_rst;

// // wire [N-1:0] state, next_state;

// // always_comb counter_comparator = (counter == ticks);
// // always_comb counter_rst = rst | counter_comparator;

// // always_ff @( posedge clk ) begin : ff

// //     if (counter_rst) begin
// //         counter <= 0;
// //     end

// //     else begin
// //         if (ena) begin
// //             counter <= counter + 1;
// //         end
// //     end

// // end

// // always_comb out = counter_comparator & ena;

logic counter_comparator;
wire [N-1:0] counter_pp;

adder_n #(.N(N)) ADDER(
  .a(counter), .b(1), .c_in(1'b0),
  .sum(counter_pp)
);

// Reset or gate
logic local_reset;
always_comb local_reset = rst | counter_comparator;

// Create a Register
logic [N-1:0] counter; // our q
always_ff @(posedge clk) begin
  if(local_reset) begin
    counter <= 0;
  end else if(ena) begin
    counter <= counter_pp;
  end
  // this always exists:
  // else counter <= counter;
end

// comparator_eq #(.N(N)) COMPARATOR_EQ (
//   .a(counter_pp), .b(ticks), .out(counter_comparator)
// );

endmodule
