// comp 32 bits beh y combinacional
module comp_32(a, b, eq, neq, lt, gt, lte, gte);
  input [31:0] a;
  input [31:0] b;
  output eq, neq, lt, gt, lte, gte; // equal, not equal, less than, greater than, less than equal, greater than equal
  
  assign eq = (a == b);
  assign neq = (a != b);
  assign lt = (a < b);
  assign gt = (a > b);
  assign lte = (a <= b);
  assign gte = (a >= b)

endmodule