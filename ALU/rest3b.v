
module rest3b (
    input [2:0] A,
    input [2:0] B,
    input sel,
    output Cout,
    output [2:0] Rest
    );

  wire b0,b1,b2;
  wire c_out; 


  assign b0 = B[0]^sel;
  assign b1 = B[1]^sel;
  assign b2 = B[2]^sel;
  

  sum3b s0 (.A(A), .B({b2,b1,b0}), .Ci(sel),  .Cout(Cout), .Sum(Rest));
  
endmodule