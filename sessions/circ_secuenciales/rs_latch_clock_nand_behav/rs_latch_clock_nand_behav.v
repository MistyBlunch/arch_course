module rs_latch_clock_nand_behav(r,s,q,qn,clk);
  input r,s,clk;
  output reg q, qn;

  always @ (posedge clk)
    begin
      if(s==0)
        begin
          q <= 1;
          qn <= 0;
        end
      else if(r==0)
        begin
          q <= 0;
          qn <= 1;
        end
      else if(s==1 & r==1)
        begin
          q <= q;
          qn <= qn;
        end
      //else if(s==0 & s==0)
    end
endmodule
