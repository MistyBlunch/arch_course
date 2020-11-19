`timescale 1ns/1ns
`include "rs_latch_nand_structural.v"
module rs_lacth_nand_structural_tb;
 reg r,s;
 wire q,qn;

 rs_latch_nand_structural rs_test( .r(r), .s(s), .q(q), .qn(qn));

 initial begin
   //r=1; s=1; 
   r=0; s=0; 
   #1
   $display("r=%b, s=%b, q=%b, qn=%b",r,s,q,qn);
   #1
   r=0; s=1; 
   #1
   $display("r=%b, s=%b, q=%b, qn=%b",r,s,q,qn);
   #1
   r=1; s=1;
   #1
   $display("r=%b, s=%b, q=%b, qn=%b",r,s,q,qn);
   #1
   r=1; s=0;
   #1
   $display("r=%b, s=%b, q=%b, qn=%b",r,s,q,qn);  
   #1
   r=1; s=1;
   #1
   $display("r=%b, s=%b, q=%b, qn=%b",r,s,q,qn);  
 end

 initial begin
   $dumpfile("rs_latch_nand_structural.vcd");
   $dumpvars;
 end
endmodule
