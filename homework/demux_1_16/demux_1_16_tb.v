`timescale 1ns/1ns
`include "demux_1_16.v"

module demux_1_16_tb();
  reg [15:0] i;
  reg [3:0] sel;
  wire [15:0] a,b,c,d,e,f,g,h,j,k,l,m,n,s,o,p;

  demux_1_16 demux_1_16(i,sel,a,b,c,d,e,f,g,h,j,k,l,m,n,s,o,p);

  initial begin
    i = 1;
    sel = 5;
    #1
    $display("a =", a, "\nb =", b, "\nc =", c, "\nd =", d, "\ne =", e, "\nf =", f, "\ng =", g, "\nh =", h, "\nj =", j, "\nk =", k, "\nl =", l, "\nm =", m, "\nn =", n, "\ns =" ,s, "\no =", o, "\np =", p, "\nsel =", sel, "\ni =", i);
    
    $dumpfile("mux_1_16_tb.vcd");
    $dumpvars();
  end

endmodule