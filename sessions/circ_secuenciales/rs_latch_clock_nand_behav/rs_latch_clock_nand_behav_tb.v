`timescale 1ns/1ns
`include "rs_latch_clock_nand_behav.v"

module rs_latch_clock_nand_behav_tb;
  reg r,s,clk;
  wire q,qn;

  rs_latch_clock_nand_behav rs_test(.r(r), .s(s), .q(q), .qn(qn), .clk(clk));
 
  initial begin
    clk = 0;
    forever #1 clk=~clk;
  end

  initial begin
     s=1; r=0;
     #1
     $display("r=%b,s=%b,q=%b,qn=%b,clk=%b,", r,s,q,qn,clk);
     #1
     s=0; r=1;
     #1
     $display("r=%b,s=%b,q=%b,qn=%b,clk=%b,", r,s,q,qn,clk);
     $finish;
  end
endmodule
