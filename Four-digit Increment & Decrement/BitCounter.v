module BitCounter(num, z, o, b);

input [15:0] num;

output reg [3:0] z, o, b;

reg [3:0] zTemp;
integer i;

	always @ (num) begin
		z = 0;
		o = 0;
		b = 0;
		zTemp = 0;

		for (i = 0; i <= 15; i = i+1) begin
			if (num[i] == 1) begin
				o = o + 1;
				z = z + zTemp;
				zTemp = 0;
			end else zTemp = zTemp + 1;
			
		end
		
		b = o + z; // add the number of ones and zeros without leading zeros
		
	end
endmodule	