`timescale 1ns/1ns

module shift_register_4_bit(clk, x_in, s_in, ldx, shrx, x_out, s_out, x_zero);
	input wire[3:0] x_in;
	input wire clk, s_in, ldx, shrx;
	output reg[3:0] x_out;
	output reg s_out;
	output wire x_zero;

	always @(posedge clk) begin
		if (ldx)
			x_out = x_in;
		else if (shrx)
			{x_out, s_out} = {s_in, x_out};
		else
			x_out = x_out;
	end

	assign x_zero = x_out[0];
endmodule 



