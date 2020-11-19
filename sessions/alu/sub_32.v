// sub 32 bits beh y combinacional
module sub_32(a, b, sub);
  input [31:0] a;
  input [31:0] b;
  output [31:0] sub;
  
  assign sub = a - b;

endmodule