module mux_2_1 (A, B, S, Y);
  input S, A, B;
  output Y;
  wire S_not, D0_out_and, D1_out_and;

  // structural
  not not_D1 (S_not, S);  // gate (out, inputs)
  and and_D0 (D0_out_and, A, S);
  and and_D1 (D1_out_and, B, S_not);
  or out_mux (Y, D0_out_and, D1_out_and);

endmodule
