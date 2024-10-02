`include "sum1b.v"

module sum3b (
        input  [2:0] A,
        input  [2:0] B,
        input Ci,
        output Cout,
        output [2:0] Sum
    );

  wire c1,c2;

  sum1b s0 (.A(A[0]), .B(B[0]), .Ci(Ci),  .Cout(c1), .Sum(Sum[0]));
  sum1b s1 (.A(A[1]), .B(B[1]), .Ci(c1), .Cout(c2), .Sum(Sum[1]));
  sum1b s2 (.A(A[2]), .B(B[2]), .Ci(c2), .Cout(Cout), .Sum(Sum[2]));

endmodule
