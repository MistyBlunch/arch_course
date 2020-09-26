`timescale 1ns/1ns
`include "demux_1_16.v"

module demux_1_16_tb();
  reg [15:0] i,z;
  reg [3:0] sel;
  wire [15:0] a,b,c,d,e,f,g,h,j,k,l,m,n,s,o,p;

  demux_1_16 demux_1_16(i,sel,a,b,c,d,e,f,g,h,j,k,l,m,n,s,o,p);

  initial begin
    for(z = 0; z < 16; ++z) begin
      i = 3;
      sel = z;
      #5
      $display("a =", a, " b =", b, " c =", c, " d =", d, " e =", e, " f =", f, " g =", g, " h =", h, " j =", j, " k =", k, " l =", l, " m =", m, " n =", n, " s =" ,s, " o =", o, " p =", p, " sel =", sel, " i =", i);
    end
    
    $dumpfile("mux_1_16_tb.vcd");
    $dumpvars();
  end

endmodule