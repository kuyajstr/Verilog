module Assestment5_top(btn, displayMode, mode, reset, sw, sign, seg5, seg3, seg2, seg1, seg0, clkIndicator);

	input [3:0] btn;
	input displayMode;
	input mode, reset;
	
	input [2:0] sw;
	
	output reg sign;
	output [6:0] seg5, seg3, seg2, seg1, seg0;
	output reg clkIndicator;
	
	wire wClkOut;
	wire wSign, wDash;
	wire [1:0] wDisplayMode;
	wire [15:0] wQ;
	wire [3:0] wValue;
	wire [3:0] wSeg5, wSeg3, wSeg2, wSeg1, wSeg0;
	
	ButtonManager bm(.btn(btn),  .clkOut(wClkOut), .value(wValue));
	
	Counter c(.clk(wClkOut), .mode(mode), .reset(reset), .Q(wQ), .value(wValue), .sign(wSign));
	
	
	DisplayManager dm(.displayMode(displayMode), .sw(sw), .f(wQ), .seg5(wSeg5), .seg3(wSeg3), .seg2(wSeg2), .seg1(wSeg1), .seg0(wSeg0), .dash(wDash));
		
	always @(*) begin 
		clkIndicator = wClkOut;
		sign = wSign || ~wDash;
	end
	
	Bin2Hex d0(.sel(wSeg0), .leds(seg0));
	Bin2Hex d1(.sel(wSeg1), .leds(seg1));
	Bin2Hex d2(.sel(wSeg2), .leds(seg2));
	Bin2Hex d3(.sel(wSeg3), .leds(seg3));
	Bin2Hex d5(.sel(wSeg5), .leds(seg5));

endmodule