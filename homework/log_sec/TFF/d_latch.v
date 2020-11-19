`include "sr_latch.v"
module d_latch(s_,r_,clrn,prn,clk,q,qn); 
  input s_, r_, clrn, prn, clk;
	output q, qn;
	wire r, s;

	assign s = ~(clk & s_ & clrn);
	assign r = ~(clk & r_ & prn);

	sr_latch latch(s, r, clrn, prn, q, qn);
endmodule