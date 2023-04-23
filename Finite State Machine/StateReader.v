module State2Hex(green, yellow, red, Q);
	input green, yellow, red;
	
	output reg [1:0] Q;
	
	always @ (*) begin
		if (green) 	Q = 2'b00;
		if (yellow) Q = 2'b01;
		if (red) 	Q = 2'b10;
	end	

endmodule