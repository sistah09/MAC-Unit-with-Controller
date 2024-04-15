module controller(
	input clk,
	input rst_n,
	input start,
	input end_mult,
	output reg finish,
	output reg reset_out,
	output reg load_mult,
	output reg begin_mult,
	output reg add,
	output reg write_en,
	output reg [2:0]state

);
	//reg [2:0]state;
	reg [5:0]temp_count;
	parameter IDLE=3'b000, INIT=3'b001, LOAD=3'b010, RUN=3'b011, TEST=3'b100, ADD=3'b101, END=3'b110;
	parameter NUMBER=100 ;
	
	always @ (posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			reset_out = 1'b0;
			state <= IDLE;
			temp_count <= NUMBER;
			finish = 1'b0;
			begin_mult = 1'b0;
			load_mult = 1'b0;
			add = 1'b0;
		end
		else begin
		
			case(state)
				IDLE:begin
					reset_out = 1'b1;
					add = 1'b0;
					begin_mult = 1'b0;
					load_mult = 1'b0;
					finish = 1'b0;
					if (start)	state <= INIT; 
					else	state <= IDLE; 
				end
				 
				INIT:begin
					reset_out = 1'b0;
					add = 1'b0;
					begin_mult = 1'b0;
					load_mult = 1'b0;
					finish = 1'b0;
				 	state <= LOAD; 
				end
				LOAD:begin 
					reset_out = 1'b1;
					add = 1'b0;
					begin_mult = 1'b0;
					load_mult = 1'b1;
					finish = 1'b0;
					state <= RUN; 
				end

				RUN:begin 
					reset_out = 1'b1;
					add = 1'b0;
					begin_mult = 1'b1;
					load_mult = 1'b0;
					finish = 1'b0;
					state <= TEST; 
				end

				TEST:begin 
					reset_out = 1'b1;
					add = 1'b0;
					begin_mult = 1'b0;
					load_mult = 1'b0;
					finish = 1'b0;
				 	if (end_mult == 0) 
				 		state <= TEST; 
					else 
				 		state <= ADD; 
				end
				 
				ADD:begin 
					reset_out = 1'b1;
					add = 1'b1;
					begin_mult = 1'b0;
					load_mult = 1'b0;
					finish = 1'b0;
				 	if (temp_count == 0) begin
							temp_count <= NUMBER; 
							state <= END; 
							end
				 	else begin
				 		temp_count <= temp_count - 1'b1; 
						state <= LOAD; 
						write_en = 1'b1;
						end
				 end
				END: begin
					reset_out = 1'b0;
					add = 1'b0;
					begin_mult = 1'b0;
					load_mult = 1'b0;
					finish = 1'b1;
					state <= END;
				end
		endcase
		end
end

endmodule