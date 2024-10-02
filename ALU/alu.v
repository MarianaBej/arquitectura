`include "sum3b.v"
`include "mult.v"
`include "rest3b.v"

module alu2b(
        input clk,
        input [2:0] A,
        input [2:0] B,
        input [1:0] Op,
        input init,
        output done,
        output reg [5:0] out_op
    );

wire c_out;

initial begin
    out_op = 'b0;
end

wire [2:0] _sum;
wire [2:0] _rest;
wire [5:0] _mult;

sum3b s0 (.A(A), .B(B), .Sum(_sum), .Ci(1'b0));
rest3b s1 (.A(A), .B(B), .Rest(_rest), .sel(1'b1), .Cout(c_out));
multiplicador s2 (.MR(A), .MD(B), .pp(_mult), .clk(clk), .init(init), .done(done));

always @(*) begin
    case (Op)
        00:begin
            out_op = {3'b000, _sum};
        end
        01:begin
            out_op = {{3{_rest[2]}}, _rest};
            //out_op [2:0] = _rest;
            //out_op [3] = c_out;
            //out_op [5:4] = 2'b00;
        end
        10:begin
            out_op = _mult;
        end
    endcase
    
end


endmodule