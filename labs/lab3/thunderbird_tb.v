`timescale 1ns/1ns
`include "thunderbird.v"
module thunderbird_tb();
  reg left, right, reset, clk;
  wire [5:0] out;

  // clock
  initial begin
  clk = 0;
  forever #3 clk = ~clk;
  end

  initial begin
      $monitor("left=%4b,right=%4b,reset=%4b,clk=%4b,out=%4b",left,right,reset,clk,out);
      $dumpfile("thunderbird.vcd");
      $dumpvars;
      reset<=1'b1;right<=1'b0;left<=1'b0;
      #3
      reset<=1'b0;
      #3
      right<=1'b1;left<=1'b0;
      #8
      right<=1'b0;left<=1'b0;
      #8
      right<=1'b0;left<=1'b0;
      #8
      reset<=1'b0;
      #3
      right<=1'b0;left<=1'b1;
      #8
      right<=1'b0;left<=1'b0;
      #8
      right<=1'b0;left<=1'b0;
      #8
      right<=1'b1;left<=1'b1;
      #3
      $finish;
  end

  thunderbird tbird(left, right, reset, clk, out);


endmodule