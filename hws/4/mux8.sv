module mux8(select, in, out);
    input wire [7:0] in, 
    input wire [2:0] select;
    output logic out;

    wire out1, out2;

    mux4 mux1(.select(select[1:0]), .in(in[3:0]), .out(out1));
    mux4 mux2(.select(select[1:0]), .in(in[7:4]), .out(out2));

    assign out = ((select[2] & out2) | (~select[2] & out1));

endmodule