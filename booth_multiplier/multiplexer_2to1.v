`timescale 1ns/1ns

module multiplexer_2to1(y, y_bar, addbar_sub, result);
	input wire[5:0] y, y_bar;
	input wire addbar_sub;
	output wire[5:0] result;

	assign result = (addbar_sub == 0) ? y : y_bar;
endmodule