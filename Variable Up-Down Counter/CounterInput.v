module CounterInput(clk, value, Q, mode);
	input clk;
	input [3:0] value;
	output reg [3:0] Q;
	output reg mode;
	
	always @(posedge clk) begin
		
		if (value == 1 ) begin 
			Q <= Q + 1;
			
			if (Q >= 9) Q <= 9;
		end 
		
		if (value == 2) begin
			Q <= Q - 1; 
			
			if (Q <= 0) Q <= 0;
		end
		
		if (value == 3) begin
			mode = ~mode;
		end
		
	end

endmodule