`timescale 1ns/1ns  // 1 nanoseg

module mux_2_1_tb;
  reg A,B;
  reg S;
  wire Y; // cable para conectar a la salida
  
  // instanciar modulo de analisis
  mux_2_1 muxtest (.A(A), .B(B), .S(S), .Y(Y)); // forma de asignación directa
  
  initial begin
  	A=0;
  	B=1;
    S=0;
    // imprime el valor de A, B y S en binario
    $display ("A=%b",A," B=%b",B," S=%b",S);
    #1
    $display ("A=%b",A," B=%b",B," S=%b",S," Y=%b",Y);
    #1;
    A=0;
    B=1;
    S=1;
    $display ("A=%b",A," B=%b",B," S=%b",S);
    #1
    $display ("A=%b",A," B=%b",B," S=%b",S," Y=%b",Y);
  end
  // archivo para generar ondas digitales
  initial begin
    $dumpfile("mux2_1.vcd");  // salida del archivo
    $dumpvars;  // quiero que ponga todas las variables definidas en mi modulo
  end
  
endmodule
