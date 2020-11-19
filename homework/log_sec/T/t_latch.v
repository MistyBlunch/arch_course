`include "sr_latch.v"
module t_latch(c,t,q,qn);
  input c,t;
  output q,qn;

  wire s,tt;
  /* 
    para s: si t y c son uno, entonces la salida será ~(qn) = q, osea 1,
    sino la salida será nand de las 3 entradas t,c y qn.
    
    para tt: si t y c son uno, entonces la salida será ~(q) = qn, osea 0,
    sino la salida será nand de las 3 entradas t,c y qn.
  */
  assign s = (t==1'b1 && c==1'b1) ? 1'b1 :  ~(~(t & qn) & c);
  assign tt = (t==1'b1 && c==1'b1) ? 1'b0 : ~(~(c & q) & t);
  
  sr_latch sr_latch(s,tt,q,qn);

endmodule