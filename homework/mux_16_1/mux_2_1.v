module mux_2_1(a,b,sel,y);
  input [15:0] a,b;
  input sel;
  output [15:0] y;

  assign y = (sel == 1'b0) ? a : b;
endmodule