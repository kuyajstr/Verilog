module DisplayManager(displayMode, sw, f, seg5, seg3, seg2, seg1, seg0, dash);
	input displayMode;
	input [2:0] sw;
	input [15:0] f;
	
	output reg [3:0] seg5, seg3, seg2, seg1, seg0;
	output reg dash;
	
	wire [3:0] wOnes, wTens, wHundreds, wThousands;
	
	wire [3:0] wZero, wOne, wBit;
	
	
	BitCounter bc (.num(f), .z(wZero), .o(wOne), .b(wBit));
	
	HexToDec4Digits h1(.h(f),.ones(wOnes), .tens(wTens), .hundreds(wHundreds), .thousands(wThousands));
	
	
	always @(*) begin
		
		if (sw[0] == 0 && sw[1] == 0 && sw[2] == 0) begin
			dash = 16;
			seg5 = 16;
			if (displayMode == 0) begin
				seg3 = wThousands;
				seg2 = wHundreds;
				seg1 = wTens;
				seg0 = wOnes;
			end
			if (displayMode == 1) begin
				seg3 = f[15:12];
				seg2 = f[11:8];
				seg1 = f[7:4];
				seg0 = f[3:0];
			end
		end
	
		if (sw[0] ==1) begin
			seg5 = 1;
			dash = 0;
			
			seg3 = wOne;
		end
			
		if (sw[1] ==1) begin
			seg5 = 0;
			dash = 0;
			
			seg3 = wZero;
		end
		
		if (sw[2] ==1) begin
			seg5 = 4'b1011;
			dash = 0;
			
			seg3 = wBit;
		end
		
	end
	
endmodule