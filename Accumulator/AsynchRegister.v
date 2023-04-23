module AsynchRegister(D, clk, reset, En, Q);
	parameter n = 4;
	
	input [n-1:0] D;
	input clk, reset, En;
	output reg [n-1:0] Q;
	
	always @(posedge clk, negedge reset) begin
		if (reset == 0) Q <= 0;
		else if (En) Q <= D;
	end
endmodule