module bcd(x,y);
  input [4:0] x;
  output reg [4:0] y;

  always@ (x,y) begin
    if(x == 4'b0000) begin
      y = 4'b0001;
    end
    else if(x == 4'b0001) begin
      y = 4'b0010;
    end
    else if(x == 4'b0010) begin
      y = 4'b0011;
    end
    else if(x == 4'b0011) begin
      y = 4'b0100;
    end
    else if(x == 4'b0100) begin
      y = 4'b0101;
    end
    else if(x == 4'b0101) begin
      y = 4'b0110;
    end
    else if(x == 4'b0110) begin
      y = 4'b0111;
    end
    else if(x == 4'b0111) begin
      y = 4'b1000;
    end
    else if(x == 4'b1000) begin
      y = 4'b1001;
    end
    else if(x == 4'b1001) begin
      y = 4'b0000;
    end
    else begin
      y = 4'bx;
    end
  end
endmodule