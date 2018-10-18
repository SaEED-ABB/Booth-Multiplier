`timescale 1ns/1ns

module TB_6_bit_register();
	reg clk, ldy;
	reg[5:0] y_in;
	wire[5:0] y_out;

	register_6_bit Y_REG(clk, y_in, ldy, y_out);

	initial begin
		clk = 0;
		y_in = 6'b100011;
		ldy = 1;
		#50; clk = 1;
		#50; clk = 0;
		#300;
	end
endmodule