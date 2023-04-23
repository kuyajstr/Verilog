module LedManager(sel, leds);
input [3:0] sel;
output reg [9:0] leds;

always @(sel)
	case (sel)
		0: leds = 9'b000000000;
		1: leds = 9'b000000001;
		2: leds = 9'b000000011;
		3: leds = 9'b000000111;
		4: leds = 9'b000001111;
		5: leds = 9'b000011111;
		6: leds = 9'b000111111;
		7: leds = 9'b001111111;
		8: leds = 9'b011111111;
		9: leds = 9'b111111111;
	endcase

endmodule