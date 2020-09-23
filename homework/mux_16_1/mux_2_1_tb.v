`timescale 1ns/1ns
`include "mux_2_1.v"
module mux_2_1_tb();
reg [15:0] a,b;
reg sel;
wire [15:0] y;

mux_2_1 mux_2_1(a,b,sel,y);

initial begin
    a = 1; b = 2;
    #1
    sel = 1;
    #1
    $display("\na =", a, "\nb =", b,"\nsel =", sel, "\ny =", y);
    $dumpfile("mux_2_1_tb.vcd");
    $dumpvars();
end
endmodule