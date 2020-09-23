`include "mux_16_1.v"
module mux_16_1_tb();
reg [15:0] a,b,c,d,e,f,g,h,i,j,k,l,m,n,s,o;
reg [3:0] sel;
wire [15:0] y;

mux_16_1 mux_16_1(a,b,c,d,e,f,g,h,i,j,k,l,m,n,s,o,sel,y);

initial begin
    a = 1; b = 2; c = 3; d = 4;
    e = 5; f = 6; g = 7; h = 8;
    i = 9; j = 10; k = 11; l = 12;
    m = 13; n = 14; s = 15; o = 16;
    sel = 0;
    #1
    $display("\na =", a, "\nb =", b, "\nc =", c, "\nd =", d, "\ne =", e, "\nf =", f, "\ng =", g, "\nh =", h, "\ni =", i, "\nj =", j, "\nk =", k, "\nl =", l, "\nm =", m, "\nn =", n, "\ns =" ,s, "\no =", o, "\nsel =", sel, "\ny =", y);
    $dumpfile("mux_16_1_tb.vcd");
    $dumpvars();
end
endmodule