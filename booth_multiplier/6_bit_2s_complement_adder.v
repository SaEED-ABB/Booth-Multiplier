`timescale 1ns/1ns

module adder(p, y, result);
	input wire[5:0] p, y;
	output wire[5:0] result;
	assign result = p + y;
endmodule 
