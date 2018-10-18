`timescale 1ns/1ns

module TB_adder();
	reg[5:0] A, B;
	wire[5:0] A_PLUS_B;

	adder P_Y_ADDER(A, B, A_PLUS_B);
	initial begin
		A = 6'b101010;
		B = 6'b110101;
		#400;
	end
endmodule