module sr_latch(s,r,q,qn);
	input s,r;
	output reg q,qn;
	
	always@(*) begin
		q <= ~(s & qn);
		qn <= ~(r & q);
	end 
endmodule