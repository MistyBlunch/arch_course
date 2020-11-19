`include "sr_latch.v"
module sr_tb();
    reg s,r;
    wire q,qn;

initial begin
    r<=1'b0;s<=1'b0;
    #1
	r<=1'b0;s<=1'b1;
    #1
	r<=1'b1;s<=1'b0;
    #1
	r<=1'b1;s<=1'b1;
    #1
	$finish;
end

initial begin
    $monitor("r=",r,"s=",s,"q=",q,"qn=",qn);
end

initial begin
    $dumpfile("sr.vcd");
    $dumpvars();
end

sr_latch sr(r,s,q,qn);

endmodule 