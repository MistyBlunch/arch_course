
//control_unit.v
module controller (
	clk,
	reset,
	Instr,
	ALUFlags,
	RegSrc,
	RegWrite,
	ImmSrc,
	ALUSrc,
	ALUControl,
	MemWrite,
	MemtoReg,
	PCSrc
);
	input wire clk;
	input wire reset;
	input wire [31:12] Instr;
	input wire [3:0] ALUFlags;
	output wire [1:0] RegSrc;
	output wire RegWrite;
	output wire [1:0] ImmSrc;
	output wire ALUSrc;
	output wire [1:0] ALUControl;
	output wire MemWrite;
	output wire MemtoReg;
	output wire PCSrc;
	wire [1:0] FlagW;
	wire PCS;
	wire RegW;
	wire MemW;
	decode dec(
		.Op(Instr[27:26]),
		.Funct(Instr[25:20]),
		.Rd(Instr[15:12]),
		.FlagW(FlagW),
		.PCS(PCS),
		.RegW(RegW),
		.MemW(MemW),
		.MemtoReg(MemtoReg),
		.ALUSrc(ALUSrc),
		.ImmSrc(ImmSrc),
		.RegSrc(RegSrc),
		.ALUControl(ALUControl)
	);
	condlogic cl(
		.clk(clk),
		.reset(reset),
		.Cond(Instr[31:28]),
		.ALUFlags(ALUFlags),
		.FlagW(FlagW),
		.PCS(PCS),
		.RegW(RegW),
		.MemW(MemW),
		.PCSrc(PCSrc),
		.RegWrite(RegWrite),
		.MemWrite(MemWrite)
	);
endmodule



module decode (
	Op,
	Funct,
	Rd,
	FlagW,
	PCS,
	RegW,
	MemW,
	MemtoReg,
	ALUSrc,
	ImmSrc,
	RegSrc,
	ALUControl
);
	input wire [1:0] Op;
	input wire [5:0] Funct;
	input wire [3:0] Rd;
	output reg [1:0] FlagW;
	output wire PCS;
	output wire RegW;
	output wire MemW;
	output wire MemtoReg;
	output wire ALUSrc;
	output wire [1:0] ImmSrc;
	output wire [1:0] RegSrc;
	output reg [1:0] ALUControl;
	reg [9:0] controls;
	wire Branch;
	wire ALUOp;
	always @(*)
		casex (Op)
			2'b00:       //Data Processing
				if (Funct[5])
					controls = 10'b0000101001;
				else
					controls = 10'b0000001001;
			2'b01:   // LDR
				if (Funct[0])
					controls = 10'b0001111000; //str
				else
					controls = 10'b1001110100; //B
			2'b10: controls = 10'b0110100010;
			default: controls = 10'bxxxxxxxxxx;
		endcase
	assign {RegSrc, ImmSrc, ALUSrc, MemtoReg, RegW, MemW, Branch, ALUOp} = controls;
	always @(*)
		if (ALUOp) begin
			case (Funct[4:1])
				4'b0100: ALUControl = 3'b000;
				4'b0010: ALUControl = 3'b001;
				4'b0000: ALUControl = 3'b010;
				4'b1100: ALUControl = 3'b011;
                4'b0001: ALUControl = 3'b100; //EOR
				default: ALUControl = 3'bxxx;
			endcase
			FlagW[1] = Funct[0];
			FlagW[0] = Funct[0] & ((ALUControl == 2'b00) | (ALUControl == 2'b01));
		end
		else begin
			ALUControl = 2'b00;
			FlagW = 2'b00;
		end
	assign PCS = ((Rd == 4'b1111) & RegW) | Branch;
endmodule


module condlogic (
	clk,
	reset,
	Cond,
	ALUFlags,
	FlagW,
	PCS,
	RegW,
	MemW,
	PCSrc,
	RegWrite,
	MemWrite
);
	input wire clk;
	input wire reset;
	input wire [3:0] Cond;
	input wire [3:0] ALUFlags;
	input wire [1:0] FlagW;
	input wire PCS;
	input wire RegW;
	input wire MemW;
	output wire PCSrc;
	output wire RegWrite;
	output wire MemWrite;
	wire [1:0] FlagWrite;
	wire [3:0] Flags;
	wire CondEx;
	flopenr #(2) flagreg1(
		.clk(clk),
		.reset(reset),
		.en(FlagWrite[1]),
		.d(ALUFlags[3:2]),
		.q(Flags[3:2])
	);
	flopenr #(2) flagreg0(
		.clk(clk),
		.reset(reset),
		.en(FlagWrite[0]),
		.d(ALUFlags[1:0]),
		.q(Flags[1:0])
	);
	condcheck cc(
		.Cond(Cond),
		.Flags(Flags),
		.CondEx(CondEx)
	);
	assign FlagWrite = FlagW & {2 {CondEx}};
	assign RegWrite = RegW & CondEx;
	assign MemWrite = MemW & CondEx;
	assign PCSrc = PCS & CondEx;
endmodule


module condcheck (
	Cond,
	Flags,
	CondEx
);
	input wire [3:0] Cond;
	input wire [3:0] Flags;
	output reg CondEx;
	wire neg;
	wire zero;
	wire carry;
	wire overflow;
	wire ge;
	assign {neg, zero, carry, overflow} = Flags;
	assign ge = neg == overflow;
	always @(*)
		case (Cond)
			4'b0000: CondEx = zero;
			4'b0001: CondEx = ~zero;
			4'b0010: CondEx = carry;
			4'b0011: CondEx = ~carry;
			4'b0100: CondEx = neg;
			4'b0101: CondEx = ~neg;
			4'b0110: CondEx = overflow;
			4'b0111: CondEx = ~overflow;
			4'b1000: CondEx = carry & ~zero;
			4'b1001: CondEx = ~(carry & ~zero);
			4'b1010: CondEx = ge;
			4'b1011: CondEx = ~ge;
			4'b1100: CondEx = ~zero & ge;
			4'b1101: CondEx = ~(~zero & ge);
			4'b1110: CondEx = 1'b1;
			default: CondEx = 1'bx;
		endcase
endmodule
