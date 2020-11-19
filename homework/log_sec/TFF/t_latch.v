module t_latch(t,clk,clrn,prn,q,qn);
  input t,clk,clrn,prn;
  output q,qn; 
  wire r,s;
  
  assign s = ~(t & clk & r & clrn);
  assign r = ~(t & clk & s & prn);

  sr_latch latch(s,r,clrn,prn,q,qn);

endmodule