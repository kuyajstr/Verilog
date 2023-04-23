module clk1000ms(clk, clk1000);
	input clk;
	output reg clk1000;
	
	integer count = 0;
	always @(posedge clk) begin
		
		count <= count + 1;

		if(count >= (25000000)) begin
			count <= 0;
			clk1000 <= ~clk1000;
		end
		
	end
endmodule
