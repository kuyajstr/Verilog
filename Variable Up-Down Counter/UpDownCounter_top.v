module UpDownCounter_top(btn, reset, clck, seg3, seg2, seg1, seg0, leds);
	input [2:0] btn;
	input reset;
	input clck;
	
	output [6:0] seg3, seg2, seg1, seg0;
	output [9:0] leds;
	
	wire wClk;
	wire wMode;
	wire [1:0] wValueInput;
	wire [3:0] wQInput;
	
	wire [9:0] wClkDelay;
	wire [3:0] wValueOutput;
	
	wire wClkOut;
	wire [15:0] wQoutput;
	
	wire [3:0] wSeg3, wSeg2, wSeg1, wSeg0;
	
	ButtonManager bm(.btn(btn[2:0]), .clkOut(wClk), .value(wValueInput));
	
	CounterInput cIn(.clk(wClk), .value(wValueInput), .Q(wQInput), .mode(wMode));
	
	
	
	DelayClk clk1s(.clk(clck), .del(0), .adClk(wClkDelay[0]));
	DelayClk clk900ms(.clk(clck), .del(1), .adClk(wClkDelay[1]));
	DelayClk clk800ms(.clk(clck), .del(2), .adClk(wClkDelay[2]));
	DelayClk clk700ms(.clk(clck), .del(3), .adClk(wClkDelay[3]));
	DelayClk clk600ms(.clk(clck), .del(4), .adClk(wClkDelay[4]));
	DelayClk clk500ms(.clk(clck), .del(5), .adClk(wClkDelay[5]));
	DelayClk clk400ms(.clk(clck), .del(6), .adClk(wClkDelay[6]));
	DelayClk clk300ms(.clk(clck), .del(7), .adClk(wClkDelay[7]));
	DelayClk clk200ms(.clk(clck), .del(8), .adClk(wClkDelay[8]));
	DelayClk clk100ms(.clk(clck), .del(9), .adClk(wClkDelay[9]));
	
	ClkMngr cm(.clk(wClkDelay), .value(wQInput), .clkOut(wClkOut));
	
	LedManager lm(.sel(wQInput), .leds(leds));
	
	CounterOutput cOut(.clk(wClkOut), .reset(reset), .mode(wMode), .Q(wQoutput));
	
	DisplayManager dm(.f(wQoutput), .seg3(wSeg3), .seg2(wSeg2), .seg1(wSeg1), .seg0(wSeg0));
	
	Bin2Hex d0(.sel(wSeg0), .leds(seg0));
	Bin2Hex d1(.sel(wSeg1), .leds(seg1));
	Bin2Hex d2(.sel(wSeg2), .leds(seg2));
	Bin2Hex d3(.sel(wSeg3), .leds(seg3));
	
endmodule