`include "d_latch.v"
`include "t_latch.v"

module jkff(j,k,clk,clrn,prn,q,qn);
	input j,k,clk,clrn,prn;
	output	q,qn;
	wire r,s;
	
	assign s = ~(qn & j & ~clk & clrn);
	assign r = ~(q & k & ~clk & prn);

	t_latch t_latch(s,r,clk,clrn,prn,q,qn);
	d_latch d_latch(s,r,clrn,prn,clk,q,qn);

endmodule