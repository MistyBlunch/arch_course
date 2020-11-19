`include "adder_32.v"
`timescale 1ns/1ns

module adder_32_tb();
  reg a, b, cin;
  wire sum, cout;

  adder_32(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
  initial begin
    a = 1;
    b = 1;
    cin = 1;
    #1

  end
  initial begin
    $dumfile("adder_32.vcd");
    $dumpvars;
  end
endmodule