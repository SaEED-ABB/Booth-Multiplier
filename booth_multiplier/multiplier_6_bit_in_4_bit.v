`timescale 1ns/1ns

module booth_multiplier(clk, start, x_in, y_in,
						done, result);

	input wire clk, start;
	input wire[3:0] x_in;
	input wire[5:0] y_in;
	output wire done;
	output wire[9:0] result;

	wire ldy, addbar_sub, shrp, ldp, clrp, shrx, ldx, clrx_neg_one, ldx_neg_one, clrc, count_up;
	wire x_zero, x_neg_one, seen4;

	wire[5:0] p_in;

	datapath DP(.clk(clk), .ldy(ldy), .y_in(y_in), .p_in(p_in), .x_in(x_in), .addbar_sub(addbar_sub), .shrp(shrp), .ldp(ldp), .clrp(clrp), .shrx(shrx), .ldx(ldx), .clrx_neg_one(clrx_neg_one), .ldx_neg_one(ldx_neg_one), .clrc(clrc), .count_up(count_up),
				.result(result), .x_zero(x_zero), .x_neg_one(x_neg_one), .seen4(seen4));
	controller CU(.clk(clk), .x_zero(x_zero), .x_neg_one(x_neg_one), .seen4(seen4), .start(start),
				.ldy(ldy), .addbar_sub(addbar_sub), .shrp(shrp), .ldp(ldp), .clrp(clrp), .shrx(shrx), .ldx(ldx), .clrx_neg_one(clrx_neg_one), .ldx_neg_one(ldx_neg_one), .clrc(clrc), .count_up(count_up), .done(done));

endmodule