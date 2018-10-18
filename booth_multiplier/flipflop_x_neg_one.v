`timescale 1ns/1ns

module flip_flop(clk, x_neg_one_in, clrx_neg_one, ldx_neg_one, x_neg_one_out);
	input wire clk, x_neg_one_in, clrx_neg_one, ldx_neg_one;
	output reg x_neg_one_out;

	always @(posedge clk) begin
		if (clrx_neg_one)
			x_neg_one_out <= 1'b0;
		else if (ldx_neg_one)
			x_neg_one_out <= x_neg_one_in;
		else
			x_neg_one_out <= x_neg_one_out;
	end
endmodule
