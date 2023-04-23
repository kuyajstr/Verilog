module ButtonManager(btn, clkOut, value);
	input [3:0] btn;
	output reg clkOut;
	output reg [3:0] value;
	
	always @(btn) begin
			if (btn[0] == 0) value = 1;
			if (btn[1] == 0) value = 3;
			if (btn[2] == 0) value = 5;
			if (btn[3] == 0) value = 10;	

		clkOut = &btn;
	end
endmodule