module CounterOutput(clk, mode, reset, Q);
	input clk;
	input mode, reset;
	output reg [15:0] Q;

	always @(posedge clk, negedge reset) begin
		
		if (reset == 0) begin 
			Q <= 0;
		end
		else begin
			if (mode == 0)	begin
				Q <= Q - 1; 
				
				if (Q == 0) Q <= 9999;
			end else begin
				Q <= Q + 1; 
				
				if (Q > 9999) Q <= 0;
			end
		end
		
	end

endmodule