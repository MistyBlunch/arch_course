module thunderbird(left, right, reset, clk, out);
  input left, right, reset, clk;
  output reg[5:0] out;
  reg [5:0] state, n_state;

  // outputs
  parameter 
  R = 6'b000000, 
  LA = 6'b001000,
  LBLA = 6'b011000,
  LCLBLA = 6'b111000,
  RA = 6'b000001,
  RBRA = 6'b000011,
  RCRBRA = 6'b000111,
  LR = 6'b111111;

  always @ (posedge clk or negedge reset) 
  begin
    if(reset==1)
      state <= reset;
    else
      state <= n_state;
  end

  always @(right, left, state) 
  begin
    case(state)
      R: begin 
        // si l=0 y r=1 entonces n_state=RA, si l=1 y r=0 entonces n_state=LA, si ambos son 1 entonces n_state=LR
        out=state; if(left==1'b0 && right==1'b1) n_state=RA; else if(left==1'b1 && right==1'b0) n_state=LA; else if(right==1'b1 && left==1'b1) n_state=LR; 
      end
      LA: begin 
        // si r=0 entonces n_state=LBLA, si y r=1 entonces n_state=R
        out=state; if(right==1'b0) n_state=LBLA; else if(right==1'b1) n_state=R;
      end
      LBLA: begin 
        // si r=0 entonces n_state=LCLBLA si r=1 entonces n_state=R
        out=state; if(right==1'b0) n_state=LCLBLA; else if(right==1'b1) n_state=R; 
      end
      LCLBLA: begin 
        // si r=1 y l=0 entonces n_state=RA, si r=0 y l=1 n_state=LA, si ambos están activos entonces n\_state=LR
        out=state; if(left==1'b0 && right==1'b1) n_state=RA; else if(left==1'b1 && right==1'b0) n_state=LA; else if(left==1'b1 && right==1'b1) n_state=LR;
      end
      RA: begin 
        // si l=0 entonces n_state=RBRA, si l=q n_state=R
        out=state; if(left==1'b0) n_state=RBRA; else if(left==1'b1) n_state=R;
      end
      RBRA: begin 
        // si l=0 entonces n_state=RCRBRA, si l=1 entonces n_state=R
        out=state; if(left==1'b0) n_state=RCRBRA; else if(left==1'b1) n_state=R; 
      end
      RCRBRA: begin 
        // si l=0 y r=1 entonces n_state=RA, si l=1 y r=0 entonces n_state=LA, si l=1 y r=1 entonces n_state=LR
        out=state; if(left==1'b0 && right==1'b1) n_state=RA; else if(left==1'b1 && right==1'b0) n_state=LA; else if(right==1'b1 && left==1'b1) n_state=LR;
      end
      LR: begin 
        // si l=0 y r=1 entonces n_state=RA, si l=1 y r=0 entonces n_state=LA
        out=state; if(left==1'b0 && right==1'b1) n_state=RA; else if(left==1'b1 && right==1'b0) n_state=LA;
      end
      default: n_state=R;  
    endcase
  end

endmodule