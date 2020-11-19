`include "jk_latch.v"

module jk_latch_tb();
	reg j,k,c;
	wire q,qn;

	jk_latch latch(j,k,c,q,qn);

initial begin
	c <= 1;
	j <= 1'b0; k <= 1'b0;#2 
	j <= 1'b0; k <= 1'b1;#2
	j <= 1'b1; k <= 1'b0;#2	
	j <= 1'b1; k <= 1'b1;#2  
	c <= 0;
	j <= 1'b1; k <= 1'b1;#2  
 
	$finish;
	end

	initial begin
		$monitor("c = %d, j = %d, k = %d,  q = %d, qn = %d", c,j,k,q,qn);
	end

	initial begin
		$dumpfile("jkl.vcd");
		$dumpvars();
	end

endmodule