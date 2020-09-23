`include "demux_1_2.v"
`include "demux_1_8.v"

module demux_1_16(i,sel,a,b,c,d,e,f,g,h,j,k,l,m,n,s,o,p);
  input [15:0] i;
  input [3:0] sel;
  // 0101
  output [15:0] a,b,c,d,e,f,g,h,j,k,l,m,n,s,o,p;
  output [15:0] tmp1, tmp2;

  demux_1_2 demux_1_2(i,sel[3],tmp1,tmp2);

  demux_1_8 demux_1_8_a(tmp1,sel[2:0],a,b,c,d,e,f,g,h);
  demux_1_8 demux_1_8_b(tmp2,sel[2:0],j,k,l,m,n,s,o,p);
endmodule 