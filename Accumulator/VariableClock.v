module VariableClock(clk, clkSel, clkOut);
	input clk;
	input [3:0] clkSel;
	
	output clkOut;
	
	wire [9:0] clkStore;
	
	genvar i;
	
	generate 
		for(i=0; i< 10; i = i+1) begin:clkGen
			Clock50ms clock(.clk(clk), .clkOut(clkStore[i]));
				defparam clock.delay = (i+1);
		end
	endgenerate
	
	assign clkOut = clkStore[clkSel];
	
endmodule