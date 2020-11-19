module sr_latch(s,r,clrn,prn,q,qn);
	input s,r,clrn,prn;
	output reg q,qn;

	always@(*) begin
    q <= ~(s & qn & prn);
    qn <= ~(r & q & clrn);
	end 
endmodule