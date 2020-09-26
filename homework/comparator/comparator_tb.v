`include "comparator.v"
module comparator_tb();
  reg [1:0] AB,CD;
  wire F1,F2,F3;

  comparator comparator(AB,CD,F1,F2,F3);

  initial begin
    $display("AB = ", AB, "\nCD = ", CD);
    $dumpfile("comparador.vcd");
    $dumpvars();
    AB = 1;
    CD = 0;
    #5
    $display("AB = ", AB, "\nCD = ", CD);
    AB = 1;
    CD = 1;
    #5
    $display("AB = ", AB, "\nCD = ", CD);
    AB = 0;
    CD = 1;
    #5
    $display("AB = ", AB, "\nCD = ", CD);
  end
endmodule