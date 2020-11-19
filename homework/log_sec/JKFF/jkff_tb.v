`include "jkff.v"

module jkff_tb();
reg j,k,clk,clrn,prn;
wire q,qn;

jkff jkff(j,k,clk,clrn,prn,q,qn);

always begin
	clk <= 0;
  forever #1 clk = ~clk;
end

initial begin
  j <= 1'b0; k <= 1'b1;clrn <= 1'b0;prn <= 1'b0;
  #1
  j <= 1'b0; k <= 1'b1;clrn <= 1'b1;prn <= 1'b0;
  #1
  j <= 1'b1; k <= 1'b0;clrn <= 1'b1;prn <= 1'b0;
  #1
  j <= 1'b0; k <= 1'b1;clrn <= 1'b1;prn <= 1'b0;
  #1
  j <= 1'b0; k <= 1'b1;clrn <= 1'b1;prn <= 1'b0;
  #1
  j <= 1'b0; k <= 1'b1;clrn <= 1'b0;prn <= 1'b1;
  $finish;
end

initial begin
	$monitor("j=%4b,k=%4b,clk=%4b,clrn=%4b,prn=%4b,q=%4b,qn=%4b",j,k,clk,clrn,prn,q,qn);
end

initial begin
	$dumpfile("jkff.vcd");
    $dumpvars();
end

endmodule