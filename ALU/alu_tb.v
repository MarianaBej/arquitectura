`timescale 1ns/1ps
`include "alu.v"
module alu_tb();


reg clk;
reg init;
reg [2:0] A;
reg [2:0] B;
reg [1:0] Op;

wire [5:0] out_op;

alu2b uut(
    .clk(clk),
    .A(A),
    .B(B),
    .Op(Op),
    .init(init)
);

always #1 clk = ~clk;

initial begin
    clk = 1'b0;
    init = 1'b1;
    #10;
    Op = 2'b00;
    A = 3'd2;
    B = 3'd5;
    #10;
    Op = 2'b01;
    #10
    Op = 2'b10;
end

initial begin: TEST_CASE
		$dumpfile("alu_tb.vcd");
		$dumpvars(-1, uut);
        #100 $finish;
	end

endmodule