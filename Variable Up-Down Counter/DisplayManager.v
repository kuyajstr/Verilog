module DisplayManager(f, seg3, seg2, seg1, seg0);
	input [15:0] f;
	
	output reg [3:0] seg3, seg2, seg1, seg0;
	
	wire [3:0] wOnes, wTens, wHundreds, wThousands;
	
	HexToDec4Digits h1(.h(f),.ones(wOnes), .tens(wTens), .hundreds(wHundreds), .thousands(wThousands));
	
	always @(*) begin
		seg3 = wThousands;
		seg2 = wHundreds;
		seg1 = wTens;
		seg0 = wOnes;
	end
	
endmodule