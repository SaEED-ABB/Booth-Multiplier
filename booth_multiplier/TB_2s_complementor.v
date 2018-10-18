`timescale 1ns/1ns

module TB_2s_complementor();
	reg[5:0] y;
	wire[5:0] y_bar;
	complementor Y_COMP(y, y_bar);
	initial begin
		y = 6'b101001;
		#500;

	end
endmodule