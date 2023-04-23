module ClkMngr(clk, value, clkOut);

	input [9:0] clk;
	input [3:0] value;
	output reg clkOut;
	
	always @ (value) begin
		case (value)
		0: clkOut = clk[0];
		1: clkOut = clk[1]; 
		2: clkOut = clk[2];
		3: clkOut = clk[3];
		4: clkOut = clk[4];
		5: clkOut = clk[5];
		6: clkOut = clk[6];
		7: clkOut = clk[7];
		8: clkOut = clk[8];
		9: clkOut = clk[9];
	endcase
	end

endmodule