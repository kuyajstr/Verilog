module HexToDec4Digits(h,ones,tens, hundreds, thousands);
	input [15:0] h;
	output reg [3:0] ones, tens, hundreds, thousands;
		
	always @(h) begin			
		ones[3:0] = (h%10);
		tens[3:0] = (h/10) % 10;
		hundreds[3:0] = (h/100) % 10;
		thousands[3:0] = (h/1000) % 10;
	end
endmodule