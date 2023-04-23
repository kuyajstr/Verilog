module Clock150ms(clk, clkOut);
	input clk;
	output reg clkOut;
	
	integer count;
	integer interval = 3750000; //150 ms
	
	always @(posedge clk) begin
		count <= count+1;
		
		if (count >= interval) begin
			count <= 0;
			clkOut <= ~clkOut;
		end
	end
endmodule