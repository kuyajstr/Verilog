module TrafficLight_top (clk, reset, car, timeOut, seg0);

	input clk, reset, car, timeOut;
	
	output [6:0] seg0;
	
	wire wClkOut, wGrn, wYlw, wRed;
	
	wire [1:0] wQ;

	Clock1s c(.clk(clk), .clkOut(wClkOut));
		defparam c.multiplier = 3;
	
	TrafficLight tl(.Clock(wClkOut), .Reset(reset), .CAR(car), .TIMEOUT(timeOut), .GREEN(wGrn), .YELLOW(wYlw), .RED(wRed));
	
	State2Hex s2h(.green(wGrn), .yellow(wYlw), .red(wRed), .Q(wQ));
	
	Hex2Display d(.sel(wQ), .leds(seg0));
	

endmodule