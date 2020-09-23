`include "mux_2_1.v"
`include "mux_8_1.v"

module mux_16_1(a,b,c,d,e,f,g,h,i,j,k,l,m,n,s,o,sel,y);

input [15:0] a,b,c,d,e,f,g,h,i,j,k,l,m,n,s,o;
input [3:0] sel;
output [15:0] y;

wire [15:0] tp1,tp2;


mux_8_1 mux8_1_1(a,b,c,d,e,f,g,h,sel[2:0],tp1);
mux_8_1 mux8_1_2(i,j,k,l,m,n,s,o,sel[2:0],tp2);

mux_2_1 mux_final(tp1,tp2,sel[3],y);

endmodule