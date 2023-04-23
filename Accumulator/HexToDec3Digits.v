module HexToDec3Digits(h,ones,tens, hundreds);
	input [7:0] h;
	output reg [3:0] ones, tens, hundreds;
		
	always @(h) begin			
		ones[3:0] = (h%10);
		tens[3:0] = (h/10) % 10;
		hundreds[3:0] = (h/100) % 10;
	end
endmodule