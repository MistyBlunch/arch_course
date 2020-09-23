module demux_1_2_tb ();
  reg [15:0] i;
  reg sel;
  wire [15:0] x, y;

demux_1_2 demux_1_2 (i,sel,x,y);

initial begin
  i = 1;
  sel = 0;
  #1
  $display ("x = ",x, "y = ", y);

  $dumpfile("mux_2_1_tb.vcd");
  $dumpvars();
end
endmodule