module mux16(select, in, out);
    input wire [15:0] in, 
    input wire [3:0] select;
    output logic out;

    wire out1, out2;

    mux8 mux1(.select(select[2:0]), .in(in[7:0]), .out(out1));
    mux8 mux2(.select(select[2:0]), .in(in[15:8]), .out(out2));

    assign out = ((select[3] & out2) | (~select[3] & out1));

endmodule