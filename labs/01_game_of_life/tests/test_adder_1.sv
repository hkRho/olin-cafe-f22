`timescale 1ns / 1ps
`default_nettype none

`define SIMULATION

module test_adder_1;
  // flip all logics/wires from the UUT (Unit Under Test)
  logic a, b, c_in;
  wire sum, c_out;

  adder_1 UUT(
    // .name_of_module_port(name_of_local_wire_or_logic)
    // to avoid confusion about which port is which
    .a(a), 
    .b(b), 
    .c_in(c_in), 
    .sum(sum), 
    .c_out(c_out)
  );

  initial begin // In standard programming land (line by line execution)
    // Collect waveforms
    $dumpfile("adder_1.fst");
    $dumpvars(0, UUT);
    
    $display("a b c_in | sum c_out");
    for (int i = 0; i < 8; i = i + 1) begin
      a = i[2];
      b = i[1];
      c_in = i[0];
      #1 $display("%2b %2b %2b | %4b %4b", a, b, c_in, sum, c_out);
    end
        
    $finish;      
	end

endmodule
