module add_accumulate (
	input [15:0] operand_in,
	input add,
	input reset,
	output [19:0] rc
);

wire [19:0] operand_b;
wire [19:0] reg1_out;
wire [19:0] reg2_in;

assign rc = operand_b;

//module instantiations
register_20 reg1( 
	.in({4'b0000,operand_in}),
	.reset(reset),
	.clk(add),
	.out(reg1_out)
	);

ksa20 adder(
	.a(reg1_out),
	.b(operand_b),
   .cin(1'b0),
   .sum(reg2_in)
);


register_20 reg2(
	.in(reg2_in),
	.reset(reset),
	.clk(!add),
	.out(operand_b)
);



endmodule
