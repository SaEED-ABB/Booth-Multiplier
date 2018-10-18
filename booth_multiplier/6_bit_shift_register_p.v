`timescale 1ns/1ns

module shift_register_6_bit(clk, p_in, s_in, clrp, ldp, shrp, p_out, s_out);
	input wire[5:0] p_in;
	input wire clk, s_in, clrp, ldp, shrp;
	output reg[5:0] p_out;
	output reg s_out;

	always @(posedge clk) begin
		if (clrp)
			p_out <= 6'b0;
		else if (ldp)
			p_out <= p_in;
		else if (shrp)
			{p_out, s_out} <= {s_in, p_out};
		else
			p_out <= p_out;
	end
endmodule 


