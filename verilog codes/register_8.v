module register_8(
	input [7:0]in,
	input reset,
	input clk,
	output [7:0]out
);

d_ff d0(clk, reset, in[0], out[0]);
d_ff d1(clk, reset, in[1], out[1]);
d_ff d2(clk, reset, in[2], out[2]);
d_ff d3(clk, reset, in[3], out[3]);
d_ff d4(clk, reset, in[4], out[4]);
d_ff d5(clk, reset, in[5], out[5]);
d_ff d6(clk, reset, in[6], out[6]);
d_ff d7(clk, reset, in[7], out[7]);
/*
genvar i;
generate 
	for (i=0;i<8;i=i+1) begin: for1
		d_ff di(clk, reset, in[i], out[i]);
	end
endgenerate
*/
endmodule