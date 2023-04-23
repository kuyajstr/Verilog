module Counter(clk, mode, reset, Q, value, sign);
	input clk;
	input mode, reset;
	input [3:0] value;
	output reg [15:0] Q;
	output reg sign = 1; // sign = 0 indicates negative value
	
	always @(posedge clk, negedge reset) begin
		if (reset == 0) begin 
			Q <= 0;
			sign <= 1;
		end
		else begin
			if (mode == 0)	begin
					if (sign == 0) begin
						if ((Q - value) >= 9999) begin
							sign <= 1;
							Q <= value - Q;
						end
						else Q <= Q - value;
					end
					else begin
						if ( (Q + value) >= 9999) Q <= (Q+value)-10000;
						else Q <= Q + value;
					end
			end
			
			if (mode == 1) begin
				if ((Q - value) >= 9999 && sign == 1) begin
					Q <= value - Q;
					sign <= 0;
				end
				else begin 
					if (sign == 0) begin
						if ((Q + value) >= 9999) begin
							Q <= (Q+value)-10000;
							sign <= 1;
						end
						else Q <= Q + value;
					end
					else Q <= Q - value;
				end
			end
		end
	end
endmodule