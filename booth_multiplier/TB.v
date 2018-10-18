`timescale 1ns/1ns

module TB();
	reg clk;
	reg[3:0] x_in;
	reg[5:0] y_in;
	reg start;

	wire done;
	wire[9:0] result;

	booth_multiplier MULTIPLIER(.clk(clk), .start(start), .x_in(x_in), .y_in(y_in), 
								.done(done), .result(result));

	initial begin
		start = 1'b0;
		x_in = 4'b0101; // +5
		y_in = 6'b100011; // -29
		clk = 0;
		
		#50; clk = 1;
		#50; clk = 0; start = 1;
		#50; clk = 1;
		#50; clk = 0; start = 0;

		while (done != 1'b1) begin
			#50; clk = 1;
			#50; clk = 0;
		end
		
		#200;
	end

endmodule