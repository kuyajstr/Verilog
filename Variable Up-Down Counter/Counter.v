module Counter(clk, reset, mode, Q);
	input clk;
	input reset, mode;
	output reg [15:0] Q;
	
	always @(posedge clk, negedge reset) begin
		
		if (reset == 0) begin 
			Q <= 0;
		end
		
		if (mode == 0 ) begin 
			if (Q <= 0) begin
				Q <= Q - 1; 
				
				if (Q < 0) Q <= 9999;
				
			end
			
		end else begin
			if (Q <= 9999) begin
				Q <= Q + 1; 
				
				if (Q > 9999) Q <= 0;
				
			end
		end
		
	end

endmodule