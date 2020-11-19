`include "t_latch.v"
`include "d_latch.v"

module tff(t,clk,clrn,prn,q,qn);
  input t,clk,clrn,prn;
  output q,qn;
  wire r_,s_;

  t_latch t_latch(t,clk,clrn,prn,s_,r_);
  d_latch d_latch(s_,r_,clrn,prn,clk,q,qn);

endmodule