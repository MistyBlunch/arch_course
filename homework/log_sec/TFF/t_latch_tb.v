`include "t_latch.v"

module t_latch_tb();
reg t,clk,clrn,prn;
wire q,qn;

t_latch t_latch(t,clk,clrn,prn,q,qn);

always begin
  #1 clk = ~clk;
end

initial begin
  clk<=0;
  t <= 1'b0;clrn <= 1'b0;prn <= 1'b0;#1  
  t <= 1'b1;clrn <= 1'b1;prn <= 1'b0;#1  
  t <= 1'b0;clrn <= 1'b0;prn <= 1'b1;#1  
  $finish;
end

initial begin 
  $monitor("t=%4b,clk=%4b,clrn=%4b,prn=%4b,q=%4b,qn=%4b",t,clk,clrn,prn,q,qn);
end

initial begin
  $dumpfile("t_latch.vcd");
  $dumpvars();
end

endmodule  