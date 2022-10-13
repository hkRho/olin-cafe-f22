module full_adder(a, b, c_in, c_out, s);

input wire a, b, c_in;
output logic s, c_out;

always_comb begin
    s = a ^ b ^ c_in;
    c_out = (a & b ) | (a & c_in) | (b & c_in);
end

endmodule


module add32(a, b, c_in, c_out, s);

parameter N = 32;

input wire [N-1:0] a, b;
input wire c_in;
output wire [N-1:0] s;
output wire c_out;

wire [N:0] carries;
assign carries[0] = c_in;
assign c_out = carries[N];
generate
    genvar i;
    for(i =0 ; i < N; i++) begin : ripple_carry
        full_adder ADDER (
            .a(a[i]),
            .b(b[i]),
            .c_in(carries[i]),
            .c_out(carries[i+1]),
            .s(s[i])
        );
    end
endgenerate

endmodule