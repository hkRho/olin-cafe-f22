module mux2(select, in00, in01, out);
    input wire select;
    input wire [31:0] in00, in01;
    output logic [31:0] out;

    assign out = select ? in01 : in00;

endmodule