module Clock1s (clk, clkOut);
	parameter multiplier = 1;
	
	input clk;
	output reg clkOut;
	
	integer count;
	integer interval = 25000000;
	
	always @(posedge clk) begin
		count <= count+1;
		
		if (count >= multiplier*interval) begin
			count <= 0;
			clkOut <= ~clkOut;
		end
	end
	
endmodule