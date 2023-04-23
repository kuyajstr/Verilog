module Clock50ms(clk, clkOut);
	parameter delay = 1;
	input clk;
	output reg clkOut;
	
	integer count;
	integer interval = 1250000; 
	
	// 1 250 000 - 50 ms
	// 2 500 000 - 100 ms
	
	always @(posedge clk) begin
		count <= count+1;
		
		if (count >= delay*interval) begin
			count <= 0;
			clkOut <= ~clkOut;
		end
	end
endmodule