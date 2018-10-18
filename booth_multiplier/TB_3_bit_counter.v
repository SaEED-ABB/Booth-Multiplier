`timescale 1ns/1ns

module TB_3_bit_counter();
	reg clk, clrc, count_up;
	wire seen4;

	counter_3_bit SHIFT_COUNTER(clk, clrc, count_up, seen4);

	initial begin
		clk = 0;
		clrc = 1;
		count_up = 0;
		#50; clk = 1;
		#50; clk = 0;clrc = 0; count_up = 1;
		
		#50; clk = 1;
		#50; clk = 0;
		
		#50; clk = 1;
		#50; clk = 0;
		
		#50; clk = 1;
		#50; clk = 0;
		
		#50; clk = 1;
		#50; clk = 0; clrc = 1;

		#50; clk = 1;
	end
endmodule