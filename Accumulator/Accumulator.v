module Accumulator(X, Y, clk, reset, Result);
	parameter k = 8;
	parameter m = 4;
	
	input [k-1:0] X;
	input [m-1:0] Y;
	input clk, reset;
	output [k-1:0] Result;
	
	wire [k-1:0] Sum;
	
	wire wCout, wGo;
	
	reg [m-1:0] C;
	
	RippleAdder c1(.Cin(0), .X(X), .Y(Result), .S(Sum), .Cout(wCout));
		defparam c1.n = k;
		
	AsynchRegister r1(.D(Sum), .clk(clk), .reset(reset), .En(wGo), .Q(Result));
		defparam r1.n = 8;
		
		always @(posedge clk, negedge reset) begin
			if (reset == 0) C <= Y;
			else if (wGo) C <= C-1;
		end
	
	assign wGo = |C;
	

endmodule