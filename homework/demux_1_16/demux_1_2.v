module demux_1_2 (i,sel,a,b);
  input [15:0] i;
  input sel;
  output [15:0] a, b;

  assign a = (sel == 1'b0) ? i : 16'b0;
  assign b = (sel == 1'b1) ? i : 16'b0;
endmodule