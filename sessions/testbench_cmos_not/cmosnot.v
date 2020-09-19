module cmosnot(y, a); // cmos not gate
  input a;  // input instance a
  output y; // output instance f=-a
  // fuentes de voltaje -> supply
  supply1 vdd;   // 1 lógico (power)
  supply0 gnd;    // 0 lógico (ground)

  // transistor pmos -> primitiva de verilog
  // pmos (drain, source, gate);
  pmos p1 (y, vdd, a);

  // nmos (drain, source, gate);
  nmos n1(y, gnd, a);

endmodule
