`include "adder_32.v"
`timescale 1ns/1ns

module sub_32_tb();
  reg a, b;
  wire sub;

  sub_32(.a(a), .b(b), .cin(cin), .sub(sub));
  initial begin
    $display("a=%b, b=%b, sub=%b", a, b, sub);
    a = 3;
    b = 2;
    #1
    a = 5;
    b = 1;
    #1
    a = 8;
    b = 4;
    #1
    
  end
  initial begin
    $dumfile("sub_32.vcd");
    $dumpvars;
  end
endmodule