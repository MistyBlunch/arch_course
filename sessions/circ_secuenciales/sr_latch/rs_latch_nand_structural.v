module rs_latch_nand_structural(r,s,q,qn);
  input r,s;
  output q,qn;

  // compuerta(out,inp,inp)
  nand nand1 (q,s,qn);
  nand nand2 (qn,r,q);

endmodule
