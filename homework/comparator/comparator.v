module comparator(AB,CD,F1,F2,F3);
input [0:1] AB,CD;
output reg F1,F2,F3;
always @(AB,CD)
begin
 F1 = (~(AB[1]^CD[1]))&(~(AB[0]^CD[0]));
 F2 = ((!AB[1]&CD[1])||(!AB[0]&CD[1]&CD[0])||(!AB[0]&!AB[1]&CD[0]));
 F3 = ((AB[1]&!CD[1])||(AB[0]&!CD[1]&!CD[0])||(AB[1]&AB[0]&!CD[0])); 
end
endmodule