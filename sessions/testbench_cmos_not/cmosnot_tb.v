`timescale 1ns/1ns
/*note that the symbol is ` (to the left)
time unit precision can be us (micro) or ms (mili), etc*/

module cmosnot_tb;  // testbench name -> modulo de prueba que tiene dentro un submodulo
  reg a;  
  wire y;
  cmosnot cmos_not (y,a);  // module instance
  initial begin  //for simulation
         a = 0;  //initial value of a 0
      #1 a = 1;  //after 1ns change to 1
      #1 a = 0;  //after 1ns change to 0
      #1 $finish;  // finish simulation
  end // end simulation
  initial begin //for debugging display
    // imprime la entrada y la salida (A y Y)
    $monitor("%2d:\ta = %b\ty = %b", $time, a, y);  // parecido a un print, cout, etc
  end
endmodule
