module mac_tb();
	reg clk, rst_n;
  	reg [7:0] op_a, op_b;
	reg start;
	wire finish;
   wire [19:0]rc;
	
	wire reset,load,begin_mult,end_mult,add;
	wire [2:0]state;
  
  mac uut(clk,rst_n,op_a,op_b,start,rc,reset,load,begin_mult,end_mult,add,finish,state);
  always #20 clk = ~clk;
  initial
    begin
     	clk=1'b0;
		op_a= 0;
		op_b= 0;
		start=0;
      rst_n = 1'b0; #50
      //rst_n = 1'b1; op_a= 8'hFF; op_b= 8'hFF;  start = 1'b1;
		rst_n = 1'b1; op_a= 8'd10; op_b= 8'd10;  start = 1'b1;
      //rst_n = 1'b1; op_a= 8'd8; op_b= 8'd10;  start = 1'b1; #100;
      //rst_n = 1'b1; op_a= 8'd4; op_b= 8'd2;  start = 1'b1; #100;
      //rst_n = 1'b1; op_a= 8'd3; op_b= 8'd4;  start = 1'b1; #10;
	//$finish;
    end
 initial
   begin
     $dumpfile("top.vcd");
     $dumpvars;
   end
endmodule