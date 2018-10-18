`timescale 1ns/1ns

module counter_3_bit(clk, clrc, count_up, seen4);
	input wire clk, clrc, count_up;
	output wire seen4;

	reg[2:0] counter;

	always @(posedge clk) begin
		if (clrc)
			counter <= 3'b0;
		else if (count_up)
			counter <= counter + 1;
		else
			counter <= counter;
	end

	assign seen4 = (counter == 3'b100 ? 1'b1 : 1'b0);

endmodule

