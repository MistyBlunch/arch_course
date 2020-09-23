`include "comparator.v"
module comparator_tb();
  reg [1:0] AB,CD;
  wire F1,F2,F3;

  comparator comparator(AB,CD,F1,F2,F3);

  initial begin
    AB = 1;
    CD = 0;
    #1
    $display("AB = ", AB, "\nCD = ", CD);
  end
endmodule