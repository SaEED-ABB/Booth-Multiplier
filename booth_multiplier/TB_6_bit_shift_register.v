`timescale 1ns/1ns

module TB_6_bit_shift_register();
	reg clk, s_in, clrp, ldp, shrp;
	reg[5:0] p_in;
	wire s_out;
	wire[5:0] p_out;

	shift_register_6_bit P_REG(clk, p_in, s_in, clrp, ldp, shrp, p_out, s_out);

	initial begin
		clk = 0;
		s_in = 1;
		clrp = 1;
		ldp = 0;
		shrp = 0;
		p_in = 6'b001101;
		#50; clk = 1;
		#50; clk = 0; clrp = 0; ldp = 1;
		#50; clk = 1;
		#50; clk = 0; ldp = 0; shrp = 1;
		#50; clk = 1;
		#50; clk = 0;
		#200;
	end
endmodule



