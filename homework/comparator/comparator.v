module comparator(AB,CD,F1,F2,F3);
input [1:0] AB,CD;
output F1,F2,F3;

assign F1 = (( ~(AB) & CD) | ( AB & ~(CD)));
assign F2 = ~(AB) & CD;
assign F3 = ~(CD) & AB;

endmodule