`timescale 1ns/1ns

module register_6_bit(clk, y_in, ldy, y_out);
	input clk, ldy;
	input wire[5:0] y_in;
	output reg[5:0] y_out;

	always @(posedge clk) begin
		if (ldy)
			y_out <= y_in;
		else
			y_out <= y_out;
	end
endmodule