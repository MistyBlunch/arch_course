`include "sr_latch.v"

module jk_latch(j,k,c,q,qn);
input j,k,c;
output q,qn;
reg s,r;

always @ (*) begin
  if(c == 1'b0) begin
    s <= 1'b1;
    r <= 1'b1;
  end
  else begin
    if(j == 1'b0 && k == 1'b0) begin
      s <= 1'b1;
      r <= 1'b1;
    end
    else if(j == 1'b0 && k == 1'b1) begin
      s <= 1'b1;
      r <= 1'b0;
    end
    else if(j == 1'b1 && k == 1'b0) begin
      s <= 1'b0;
      r <= 1'b1;
    end
    else if(j == 1'b1 && k == 1'b1) begin
      s <= 1'b1;
      r <= 1'b0;
    end
  end
end

sr_latch latch(s,r,q,qn);

endmodule