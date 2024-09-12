`include "rest4b.v"
`timescale 1ns/1ns

module rest4b_tb();

    reg [3:0] xi_tb;
    reg [3:0] yi_tb;
    reg sel_tb;
    wire co_tb;
    wire [3:0] zi_tb;
  
    // Instantiate the Unit Under Test (UUT)
    rest4b uut (
      .sel(sel_tb),
      .A(xi_tb), 
      .B(yi_tb), 
      .Cout(co_tb), 
      .Rest(zi_tb)
    );
  
  initial begin
    sel_tb=1;
    xi_tb=0;
    for (yi_tb = 0; yi_tb < 15; yi_tb = yi_tb + 1) begin
      if (yi_tb==0) begin
        xi_tb=xi_tb+1;
      end
      #5 $display("el valor de %d - %d = %d", xi_tb,yi_tb,zi_tb);
    end
    $finish;
  end      

  initial begin: TEST_CASE
		$dumpfile("rest4b_tb.vcd");
		$dumpvars(-1, uut);
	end
  
  endmodule
  