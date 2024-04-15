module mac(
	input clk,
	input rst_n,
	input [7:0] op_a,
	input [7:0] op_b,
	input start,
	output [19:0]rc,
	output reset,
	output load,
	output begin_mult,
	output stop,
	output add,
	output finish,
	output [2:0]state
	
	//output cout

);

wire [7:0] r_op_a, r_op_b;
wire [15:0] operand_in;
wire c_out;
//wire load;
//wire reset;
//wire add;
//wire end_mult;
//wire begin_mult;
wire write_en;
//wire stop;

//module

register_8 rega (
	.in(op_a),
	.reset(reset),
	.clk(load),
	.out(r_op_a)
);

register_8 regb (
	.in(op_b),
	.reset(reset),
	.clk(load),
	.out(r_op_b)
);

wallace_tree_multiplier multiplier(
	.clk(clk),
	.rst(rst_n),
	.a(r_op_a), 
	.b(r_op_b), 
	.begin_mult(begin_mult),
	.result_p(operand_in), 
	.end_mult(stop)
);

add_accumulate adc(
	.operand_in(operand_in),
	.add(add),
	.reset(reset),
	.rc(rc)

);
controller cont(
	 .clk(clk),
	 .rst_n(rst_n),
	 .start(start),
	 .end_mult(stop),
	 .finish(finish),
	 .reset_out(reset),
	 .load_mult(load),
	 .begin_mult(begin_mult),
	 .add(add),
	 .write_en(write_en),
	 .state(state)

);

endmodule