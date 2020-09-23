`timescale 1ns/1ns
`include "demux_1_2.v"
module demux_1_2_tb ();
  reg [15:0] i;
  reg sel;
  wire [15:0] a, b;

  demux_1_2 demux_1_2 (i,sel,a,b);

  initial begin
    i = 1;
    sel = 0;
    #1
    $display ("a = ",a, "\nb = ", b);
    
    $dumpfile("mux_2_1_tb.vcd");
    $dumpvars();
  end
endmodule