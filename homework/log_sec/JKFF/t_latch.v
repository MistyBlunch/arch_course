module t_latch(j,k,clk,clrn,prn,q,qn);
  input j,k,clk,clrn,prn;
  output q,qn;
  wire r,s;
  
  assign s = ~(j & clk & r & clrn);
  assign r = ~(k & clk & s & prn);

  sr_latch latch(s,r,clrn,prn,q,qn);

endmodule