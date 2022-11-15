/*
  Outputs a pulse generator with a period of "ticks".
  out should go high for one cycle ever "ticks" clocks.
*/
module pulse_generator(clk, rst, ena, ticks, out);
parameter N = 8;
input wire clk, rst, ena;
input wire [N-1:0] ticks;
output logic out;

logic [N-1:0] counter = 0;
logic counter_rst;

always_comb begin : cl
    counter_rst = (rst | out);
    out = (counter == ticks);
end

always_ff @( posedge clk ) begin : pulse_gen
    if (counter_rst)
        counter <= 0;

    else if (ena)
        counter <= counter + 1;    
end

// logic counter_rst;

// wire [N-1:0] state, next_state;

// always_comb counter_comparator = (counter == ticks);
// always_comb counter_rst = rst | counter_comparator;

// always_ff @( posedge clk ) begin : ff

//     if (counter_rst) begin
//         counter <= 0;
//     end

//     else begin
//         if (ena) begin
//             counter <= counter + 1;
//         end
//     end

// end

// always_comb out = counter_comparator & ena;


endmodule