module(input clk, input reset, output y);

  // state register
  reg[1:0] state, nextstate;

  // constant in Verilog
  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  parameter S2 = 2'b00;

  // instance state register
  always @ (posedge clk, posedge rest)
    if(reset) begin 
      state <= S0
    end
    else begin 
      state <= nextstate
    end

  // nextstate logic
  always @ (*)
    case (state)
      S0 : nextstate = S1;
      S1 : nextstate = S2;
      S2 : nextstate = S0;
      default :  nextstate = S0;
    endcase

  // output logic
  assign y = (state == S0);

endmodule