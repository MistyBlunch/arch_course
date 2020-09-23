`timescale 1ns/1ns
`include "bcd.v"

module bcd_tb();
  reg [4:0] x,i;
  wire [4:0] y;

  bcd bcd(x,y);

  initial begin
    for(i = 0; i < 17; ++i) begin
      x = i;
      #1
      $display("x = %b ", x[3:0] ,"\ny = %b ",y[3:0]);
      $display("--------------------------");
    end
  end
endmodule