module DelayClk(clk, del, adClk);
	input clk;
	input [3:0] del;
	output reg adClk;
	
	integer count = 0;
	
	always @(posedge clk) begin
		
		count <= count + 1;
		
		if(count >= 25000000 - (del*2500000)) begin
			count <= 0;
			adClk <= ~adClk;
		end
		
	end
endmodule
