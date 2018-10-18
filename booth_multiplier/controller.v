`timescale 1ns/1ns

module controller(clk, x_zero, x_neg_one, seen4, start,
				ldy, addbar_sub, shrp, ldp, clrp, shrx, ldx, clrx_neg_one, ldx_neg_one, clrc, count_up, done);

	input wire clk, x_zero, x_neg_one, seen4, start;
	output reg ldy, addbar_sub, shrp, ldp, clrp, shrx, ldx, clrx_neg_one, ldx_neg_one, clrc, count_up, done;

	reg[3:0] ps, ns;
	parameter[3:0] IDLE = 0, INIT = 1, W8_TO_LOAD_X = 2, ADD = 3, COMP = 4, SHIFT = 5;

	always @(ps, start, x_zero, x_neg_one, seen4) begin
		ns = IDLE;
		case (ps)
			IDLE: ns = (start == 1'b1) ? INIT : IDLE;
			INIT: ns = (start == 1'b0) ? W8_TO_LOAD_X : INIT;
			W8_TO_LOAD_X: begin
				ns = (x_zero == 1'b0 && x_neg_one == 1'b1) ? ADD : 
					(x_zero == 1'b1 && x_neg_one == 1'b0) ? COMP :
					SHIFT;
				end
			ADD: ns = SHIFT;
			COMP: ns = SHIFT;
			SHIFT: ns = (seen4 == 1'b1) ? IDLE : W8_TO_LOAD_X;
		endcase
	end

	always @(ps) begin
		{ldy, addbar_sub, shrp, ldp, clrp, shrx, ldx, clrx_neg_one, ldx_neg_one, clrc, count_up, done} = 12'b000000000000;

		case (ps)
			IDLE: done = 1'b1;
			INIT: {ldx, clrp, clrx_neg_one, ldy, clrc} = 5'b11111;
			W8_TO_LOAD_X: count_up = 1'b1;
			ADD: ldp = 1'b1;
			COMP: {ldp, addbar_sub} = 2'b11;
			SHIFT: {shrp, shrx, ldx_neg_one} = 3'b1111;
		endcase
	end

	always @(posedge clk) begin
		ps = ns;
	end

endmodule