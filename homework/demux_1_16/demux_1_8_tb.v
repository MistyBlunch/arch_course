`timescale 1ns/1ns
`include "demux_1_8.v"

module demux_1_8_tb();
  reg [15:0] i;
  reg [2:0] sel;
  wire [15:0] a,b,c,d,e,f,g,h;

  demux_1_8 demux_1_8(i,sel,a,b,c,d,e,f,g,h);

  initial begin
    i = 1;
    sel = 3;
    #1
    $display("a = ",a,"\nb = ",b,"\nc = ",c,"\nd = ",d,"\ne = ",e,"\nf = ",f,"\ng = ",g,"\nh = ",h);
    
    $dumpfile("mux_8_1_tb.vcd");
    $dumpvars();
  end
endmodule