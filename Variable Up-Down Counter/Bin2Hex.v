module Bin2Hex(sel, leds);
	input [3:0] sel;
	output reg [7:1] leds;
	
	always @(sel)
	case (sel)
		0: leds = 7'b1000000;
		1: leds = 7'b1111001;
		2: leds = 7'b0100100;
		3: leds = 7'b0110000;
		4: leds = 7'b0011001;
		5: leds = 7'b0010010;
		6: leds = 7'b0000010;
		7: leds = 7'b1111000;
		8: leds = 7'b0000000;
		9: leds = 7'b0011000;
		10: leds = 7'b0001000;
		11: leds = 7'b0000011;
		12: leds = 7'b1000110;
		13: leds = 7'b0100001;
		14: leds = 7'b0000110;
		15: leds = 7'b0001110;
	endcase
endmodule