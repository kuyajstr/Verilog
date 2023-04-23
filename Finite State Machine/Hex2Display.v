module Hex2Display(sel, leds);
	input [1:0] sel;
	output reg [7:1] leds;
	
	always @(sel)
	case (sel)
		0: leds = 7'b0000010;
		1: leds = 7'b0011001;
		2: leds = 7'b0001000;
	endcase
endmodule