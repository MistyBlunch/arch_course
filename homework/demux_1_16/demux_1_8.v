module demux_1_8(i,sel,a,b,c,d,e,f,g,h);
  input [15:0] i;
  input [2:0] sel;
  output reg [15:0] a,b,c,d,e,f,g,h;

  always@ (*)
  begin
    if(sel == 3'b000) begin
      a = i;
      b = 16'b0;
      c = 16'b0;
      d = 16'b0;
      e = 16'b0;
      f = 16'b0;
      g = 16'b0;
      h = 16'b0;
    end
    else if(sel == 3'b001) begin
      a = 16'b0;
      b = i;
      c = 16'b0;
      d = 16'b0;
      e = 16'b0;
      f = 16'b0;
      g = 16'b0;
      h = 16'b0;
    end
    else if(sel == 3'b010) begin
      a = 16'b0;
      b = 16'b0;
      c = i;
      d = 16'b0;
      e = 16'b0;
      f = 16'b0;
      g = 16'b0;
      h = 16'b0;
    end
    else if(sel == 3'b011) begin
      a = 16'b0;
      b = 16'b0;
      c = 16'b0;
      d = i;
      e = 16'b0;
      f = 16'b0;
      g = 16'b0;
      h = 16'b0;
    end
    else if(sel == 3'b100) begin
      a = 16'b0;
      b = 16'b0;
      c = 16'b0;
      d = 16'b0;
      e = i;
      f = 16'b0;
      g = 16'b0;
      h = 16'b0;  
    end
    else if(sel == 3'b101) begin
      a = 16'b0;
      b = 16'b0;
      c = 16'b0;
      d = 16'b0;
      e = 16'b0;
      f = i;
      g = 16'b0;
      h = 16'b0;  
    end
    else if(sel == 3'b110) begin
      a = 16'b0;
      b = 16'b0;
      c = 16'b0;
      d = 16'b0;
      e = 16'b0;
      f = 16'b0;
      g = i;
      h = 16'b0;  
    end
    else if(sel == 3'b111) begin
      a = 16'b0;
      b = 16'b0;
      c = 16'b0;
      d = 16'b0;
      e = 16'b0;
      f = 16'b0;
      g = 16'b0;
      h = i;
    end
  end
endmodule