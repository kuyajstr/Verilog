module Accumulator_top(btn, X, Y, clk, reset, seg0, seg1, seg2);
	
	input [1:0] btn;
	
	input [7:0] X,Y;
	
	input clk, reset;
	
	output [6:0] seg0, seg1, seg2;

	wire wClkOut, wResult;
	
	wire [3:0] wClkSel;
	
	wire [3:0] wSeg0, wSeg1, wSeg2;
	
	ButtonManager bm(.btn(btn), .sel(wClkSel));
	VariableClock vc(.clk(clk), .clkSel(wClkSel), .clkOut(wClkOut));

	//Clock150ms clock(.clk(clk), .clkOut(wClkOut));

	Accumulator acc(.X(X), .Y(Y), .clk(wClkOut), .reset(reset), .Result(wResult));
		defparam acc.k = 8;
		defparam acc.m = 8;
	
	HexToDec3Digits h2d(.h(wResult), .ones(wSeg0), .tens(wSeg1), .hundreds(wSeg2));
	
	Bin2Hex d0(.sel(wSeg0), .leds(seg0));
	Bin2Hex d1(.sel(wSeg1), .leds(seg1));
	Bin2Hex d2(.sel(wSeg2), .leds(seg2));

endmodule