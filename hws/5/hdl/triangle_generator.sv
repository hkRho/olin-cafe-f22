// Generates "triangle" waves (counts from 0 to 2^N-1, then back down again)
// The triangle should increment/decrement only if the ena signal is high, and hold its value otherwise.
module triangle_generator(clk, rst, ena, out);

parameter N = 8;
input wire clk, rst, ena;
output logic [N-1:0] out;

// typedef enum logic {COUNTING_UP, COUNTING_DOWN} state_t;
// state_t state, next_state;
// logic [N-1:0] cnt, next_cnt;

typedef enum logic {COUNTING_UP = 1'b1, COUNTING_DOWN = 1'b0} state_t;
state_t state, next_state;

// Behavioural approach to a counter

logic [N-1:0] adder_a, counter_pp;
always_comb begin : cl_for_counter
  // mux to switch between +1 and -1
  // adder_a = state ? +1 : -1;
  case (state)
    COUNTING_DOWN : adder_a = -1;
    COUNTING_UP   : adder_a = 1;
    default:        adder_a = 0; // doesn't get implemented unless state is more than one bit, but best practice for later.
  endcase

  // make an adder
  counter_pp = out + adder_a;
end
// counter register
always_ff @(posedge clk) begin :counter_register
  if(rst) out <= 0;
  else if(ena) out <= counter_pp;
  else out <= out;
end

// Finite state machine
always_ff @(posedge clk) begin : state_ff
  if(rst) state <= COUNTING_UP;
  else state <= next_state;
end

logic count_is_zero, count_is_max;
always_comb begin :next_state_cl
  // advantage of these being named - they'll show up in the waveforms!
  count_is_zero = (counter_pp == 0); // equivalent &(~out);
  count_is_max = (counter_pp == {N{1'b1}});
  
  case(state)
    COUNTING_DOWN: begin
      if(count_is_zero) next_state = COUNTING_UP;
    end
    COUNTING_UP: begin
      if(count_is_max) next_state = COUNTING_DOWN;
    end
    default: next_state = COUNTING_UP; // Just being safe, doesn't do anything for 1 bit state.
  endcase
  
end

// always_ff @(posedge clk) begin
//     if (rst) begin
//         state <= COUNTING_UP;
//         cnt <= 0;
//     end
//     else if (ena) begin
//         state <= next_state;
//         cnt <= next_cnt;
//     end
// end

// always_comb begin : triangle_gen
//     case(state)
//         COUNTING_UP:
//             if (cnt >= (2 ** (N-1))) begin
//                 next_state = COUNTING_DOWN;
//                 next_cnt = cnt - 1;
//             end
//             else begin
//                 next_state = COUNTING_UP;
//                 next_cnt = cnt + 1;
//             end
//         COUNTING_DOWN:
//             if (cnt == 0) begin
//                 next_state = COUNTING_UP;
//                 next_cnt = cnt + 1;
//             end
//             else begin
//                 next_state = COUNTING_DOWN;
//                 next_cnt = cnt - 1;
//             end
//     endcase
// end

// always_comb out = cnt;

//// IN-CLASS EXAMPLE ////
// logic [N-1:0] adder_a, counter_pp;

// always_comb begin : adder
//     // implement mux logic
//     adder_a = state ? +1 : -1;

//     // implement adder logic
//     counter_pp = out + adder_a;
// end

// always_ff @( posedge clk ) begin : counter_ff
//     if (rst) out <= 0;
//     else if (ena) out <= counter_pp;
// end

// always_ff @( posedge clk ) begin : updown_ff
//     if (rst) state <= COUNTING_UP;
//     else state <= next_state;
// end

// always_comb begin : fsm
//     case(state)
//         COUNTING_UP: begin
//             if (out == 0) next_state = COUNTING_DOWN;
//         end
//         COUNTING_DOWN: begin
//             if (out >= 2 ** (N-1)) next_state = COUNTING_UP;
//         end
//     endcase
// end

endmodule