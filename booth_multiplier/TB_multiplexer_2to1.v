`timescale 1ns/1ns

module TB_multiplexer_2to1();
	reg[5:0] y, y_bar;
	reg add_bar_sub;
	wire[5:0] result;
	multiplexer_2to1 Y_OR_YBAR_MUX(y, y_bar, add_bar_sub, result);

	initial begin
		y = 6'b100010;
		y_bar = 6'b011110;
		add_bar_sub = 0;
		#50;
		add_bar_sub = 1;
		#50;
	end
endmodule