// adder 32 bits beh y combinacional
module adder_32(a, b, cin, sum, cout);
  input [31:0] a;
  input [31:0] b;
  input cin; // carry in
  output [31:0] sum;
  output cout; // carry out

  assign {cout,sum} = a + b + cin;

endmodule