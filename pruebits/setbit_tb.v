module setbit_tb;
  wire A;

  // Colocamos el componente, también denominado "instanciar"
  // conectar en el pin A el cable de A
  setbit SB1(
    .A (A) // el cable es el que está dentro del paréntesis
  )

endmodule
