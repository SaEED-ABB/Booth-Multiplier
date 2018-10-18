`timescale 1ns/1ns
// pin not used
module datapath(clk, ldy, y_in, p_in, x_in, addbar_sub, shrp, ldp, clrp, shrx, ldx, clrx_neg_one, ldx_neg_one, clrc, count_up,
				result, x_zero, x_neg_one, seen4);
	input wire clk, ldy, addbar_sub, shrp, ldp, clrp, shrx, ldx, clrx_neg_one, ldx_neg_one, clrc, count_up;
	input wire[3:0] x_in;
	input wire[5:0] p_in, y_in;
	output wire x_zero, x_neg_one, seen4;
	output wire[9:0] result;

	wire[3:0] x_out;
	wire[5:0] y_out, p_out;

	register_6_bit Y_REGISTER(.clk(clk), .y_in(y_in), .ldy(ldy), .y_out(y_out));
	wire[5:0] y_2s_comp;
	complementor Y_COMPLEMENTOR(.y(y_out), .result(y_2s_comp));
	wire[5:0] y_or_y_comp;
	multiplexer_2to1 Y_OR_Y_COMPLEMENT_SELECTOR(.y(y_out), .y_bar(y_2s_comp), .addbar_sub(addbar_sub), .result(y_or_y_comp));

	wire[5:0] p_plus_y;
	adder P_Y_ADDER(.p(p_out), .y(y_or_y_comp), .result(p_plus_y));
	wire p_s_out;
	shift_register_6_bit P_SHIFT_REGISTER(.clk(clk), .p_in(p_plus_y), .s_in(p_out[5]), .clrp(clrp), .ldp(ldp), .shrp(shrp), .p_out(p_out), .s_out(p_s_out));

	wire x_s_out;
	shift_register_4_bit X_SHIFT_REGISTER(.clk(clk), .x_in(x_in), .s_in(p_out[0]), .ldx(ldx), .shrx(shrx), .x_out(x_out), .s_out(x_s_out), .x_zero(x_zero));

	flip_flop X_NEG_ONE_FLIPFLOP(.clk(clk), .x_neg_one_in(x_out[0]), .clrx_neg_one(clrx_neg_one), .ldx_neg_one(ldx_neg_one), .x_neg_one_out(x_neg_one));

	assign result = {p_out, x_out};

	counter_3_bit SHIFT_COUNTER(.clk(clk), .clrc(clrc), .count_up(count_up), .seen4(seen4));
endmodule
