module flip_flop(clk, rst, ena, d, q);

parameter N = 1;

input wire clk, rst, ena;
input wire [N-1:0] d;
output wire [N-1:0] q;

always_ff @( clk ) begin : ff

    if (rst) begin
        q <= 0;
    end

    else begin
        if (ena) begin
            q <= d;
        end
    end

end


endmodule