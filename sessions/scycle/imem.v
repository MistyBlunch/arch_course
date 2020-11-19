
//instruction_mem.v
module imem (
	a,
	rd
);
	input wire [31:0] a;
	output wire [31:0] rd;

	reg [31:0] RAM [0:15];
  	// initial $readmemh("memfile.dat", RAM);  //00000000
		initial $readmemh("memfile2.asm", RAM);
	assign rd = RAM[a[31:2]];
endmodule
