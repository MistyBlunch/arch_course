`timescale 1ns/1ns
`include "mux_8_1.v"
module mux_8_1_tb();
reg [15:0] a,b,c,d,e,f,g,h;
reg [2:0] sel;
wire [15:0] y;

mux_8_1 mux_8_1(a,b,c,d,e,f,g,h,sel,y);

initial begin
    a = 1; b = 2; c = 3; d = 4;
    e = 5; f = 6; g = 7; h = 8;
    sel = 4;
    #1
    $display("\na =", a, "\nb =", b, "\nc =", c, "\nd =", d, "\ne =", e, "\nf =", f, "\ng =", g, "\nh =", h, "\nsel =", sel, "\ny =", y);
    $dumpfile("mux_8_1_tb.vcd");
    $dumpvars(0,mux_8_1_tb);
end
endmodule