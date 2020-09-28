`include "comparator.v"
module test_comparator();
wire F1,F2,F3;
reg [0:1] AB,CD;
comparator comp(AB,CD,F1,F2,F3);
initial begin
	$dumpfile("comparator.vcd");
	$dumpvars();
	AB = 1; CD =0;
	#2
	$display("AB = ",AB,"CD = ",CD, "\n");
	$display("F1 = ",F1," F2= ",F2," F3 = ",F3);
	#2
	AB = 0; CD = 1;
	$display("AB = ",AB,"CD = ",CD, "\n");
	$display("F1 = ",F1," F2= ",F2," F3 = ",F3);
	#4
	AB = 0; CD = 0;
	$display("AB = ",AB,"CD = ",CD, "\n");
	$display("F1 = ",F1," F2= ",F2," F3 = ",F3);
	$finish;
end
	
endmodule