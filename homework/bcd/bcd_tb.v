`timescale 1ns/1ns
`include "bcd.v"

module bcd_tb();
  reg [4:0] x,i;
  wire [4:0] y;

  bcd bcd(x,y);

  initial begin
    $dumpfile("comparador.vcd");
    $dumpvars();
    for(i = 0; i < 12; ++i) begin
      x = i;
      #1
      $display("inp = %b ", x[3:0] ,"\nout = %b ",y[3:0]);
    end
  end
endmodule