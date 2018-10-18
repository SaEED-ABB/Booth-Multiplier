`timescale 1ns/1ns


module complementor(y, result);
	input wire[5:0] y;
	output wire[5:0] result;
	assign result = -y;
endmodule
