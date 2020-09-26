`include "mux_16_1.v"
module mux_16_1_tb();
reg [15:0] a,b,c,d,e,f,g,h,i,j,k,l,m,n,s,o,z;
reg [3:0] sel;
wire [15:0] y;

mux_16_1 mux_16_1(a,b,c,d,e,f,g,h,i,j,k,l,m,n,s,o,sel,y);

initial begin
  $display(" a =", a, " b =", b, " c =", c, " d =", d, " e =", e, " f =", f, " g =", g, " h =", h, " i =", i, " j =", j, " k =", k, " l =", l, " m =", m, " n =", n, " s =" ,s, " o =", o, " sel =", sel, " y =", y);
  $dumpfile("mux_16_1_tb.vcd");
  $dumpvars();
  
  a = 1212; b = 23; c = 0; d = 432;
  e = 51; f = 61; g = 17; h = 38;
  i = 91; j = 140; k = 111; l = 124;
  m = 113; n = 14; s = 155; o = 165;

  for(z = 0; z < 16; ++z) begin
    i = 3;
    sel = z;
    #3
    $display(" a =", a, " b =", b, " c =", c, " d =", d, " e =", e, " f =", f, " g =", g, " h =", h, " i =", i, " j =", j, " k =", k, " l =", l, " m =", m, " n =", n, " s =" ,s, " o =", o, " sel =", sel, " y =", y);
  end
end
endmodule