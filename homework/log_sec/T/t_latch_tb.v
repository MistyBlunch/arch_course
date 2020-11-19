`include "t_latch.v"
module t_latch_tb();
  reg t,c;
  wire q,qn;

t_latch tl(c,t,q,qn);

initial begin
  t<=1'b1;c<=1'b0;
  #2
  t<=1'b1;c<=1'b1;
  #2
  t<=1'b0;c<=1'b1;
  #2
  t<=1'b0;c<=1'b0;
  #2

  $finish;
end

initial begin
  $monitor("t=%4b\t| c=%4b\t| q=%4b\t| qn=%4b\t",t,c,q,qn);
end

initial begin
  $dumpfile("tl.vcd");
  $dumpvars();
end
endmodule