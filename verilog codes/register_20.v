module register_20(
	input [19:0]in,
	input reset,
	input clk,
	output [19:0]out
);
/*
d_ff d0(clk, reset, in[0], out[0]);
d_ff d1(clk, reset, in[1], out[1]);
d_ff d2(clk, reset, in[2], out[2]);
d_ff d3(clk, reset, in[3], out[3]);
d_ff d4(clk, reset, in[4], out[4]);
d_ff d5(clk, reset, in[5], out[5]);
d_ff d6(clk, reset, in[6], out[6]);
d_ff d7(clk, reset, in[7], out[7]);
d_ff d8(clk, reset, in[8], out[8]);
d_ff d9(clk, reset, in[9], out[9]);
d_ff d10(clk, reset, in[10], out[10]);
d_ff d11(clk, reset, in[11], out[11]);
d_ff d12(clk, reset, in[12], out[12]);
d_ff d13(clk, reset, in[13], out[13]);
d_ff d14(clk, reset, in[14], out[14]);
d_ff d15(clk, reset, in[15], out[15]);
d_ff d16(clk, reset, in[16], out[16]);
d_ff d17(clk, reset, in[17], out[17]);
d_ff d18(clk, reset, in[18], out[18]);
d_ff d19(clk, reset, in[19], out[19]);
*/
genvar i;
generate 
	for (i=0;i<20;i=i+1) begin: for1
		d_ff di(clk, reset, in[i], out[i]);
	end
endgenerate

endmodule