`timescale 1ns/1ns

module TB_4_bit_shift_register();
	reg clk, s_in, ldx, shrx;
	reg[3:0] x_in;
	wire s_out, x_zero;
	wire[3:0] x_out;
	shift_register_4_bit X_SHIFT_REGISTER(clk, x_in, s_in, ldx, shrx, x_out, s_out, x_zero);
	
	initial begin
		clk = 0;
		s_in = 1;
		ldx = 0;
		shrx = 0;
		x_in = 4'b1001;
		#50;
		ldx = 1;
		#50; clk = 1;
		#50; clk = 0; shrx = 1; ldx = 0;
		#50; clk = 1;
		#50; clk = 0;
		#300;

	end
endmodule