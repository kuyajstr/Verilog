module ButtonManager(btn, sel);
	input [1:0] btn;
	reg clkOut;
	output reg [1:0] sel;
	
	always @(btn) begin
		if (btn[0] == 0) sel = 1;
		if (btn[1] == 0) sel = 2;
		
		clkOut = &btn;
	end
endmodule