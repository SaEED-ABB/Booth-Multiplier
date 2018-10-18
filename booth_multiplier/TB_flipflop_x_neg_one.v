`timescale 1ns/1ns

module TB_flipflop_x_neg_one();
	reg clk, x_neg_one_in, clrx_neg_one, ldx_neg_one;
	wire x_neg_one_out;
	flip_flop X_NEG_ONE_FLIPFLOP(clk, x_neg_one_in, clrx_neg_one, ldx_neg_one, x_neg_one_out);

	initial begin
		clk = 0;
		x_neg_one_in = 1;
		clrx_neg_one = 1;
		ldx_neg_one = 0;
		#50; clk = 1;
		#50; clk = 0; clrx_neg_one = 0; ldx_neg_one = 1;
		#50; clk = 1;
		#50; clk = 0;
		#50; clk = 1;
		#50; clk = 0;
		#100;
	end
endmodule