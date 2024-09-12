`include "sum4b.v"

module rest4b (
    input [3:0] A,
    input [3:0] B,
    input sel,
    output Cout,
    output [3:0] Rest
    );

  wire c1;
  wire b0,b1,b2,b3;
  wire c_out; 


  assign b0 = B[0]^sel;
  assign b1 = B[1]^sel;
  assign b2 = B[2]^sel;
  assign b3 = B[3]^sel;
  

  sum4b s0 (.A(A), .B({b3,b2,b1,b0}), .Ci(sel),  .Cout(Cout) ,.Sum(Rest));
  
  case (status)
    NEG:  
    default: 
  endcase
endmodule