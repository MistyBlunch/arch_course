module mux_2x1__behavioral_case_all (a0,a1,s,y);
  input a0, a1, s;
  output y;
  reg y;
  always @(s or a0 or a1) begin
    case (s)
      1´b0: y = a0;
      1´b1: y = a1;
    endcase
  end
endmodule