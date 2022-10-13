module mux4(select, in, out);
    input wire [3:0] in, 
    input wire [1:0] select;
    output logic out;

    assign out = (~select[0] & ~select[1] & in[0]) | (~select[0] & select[1] & in[1]) | (select[0] & ~select[1] & in[2]) | (select[0] & select[1] & in[3]);

endmodule