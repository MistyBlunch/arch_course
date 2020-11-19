// mult
// mult 64 bits: 32 bist inputs, 64 bits: outputs
module mult_64(a, b, mult);
  input [31:0] a;
  input [31:0] b;
  output [63:0] mult;
  
  assign mult = a * b;

endmodule