module SwitchManager(sw, dispMode);
	input [2:0] sw;
	output reg [1:0] dispMode;
	
	always @(sw) begin
		if (sw[0] == 1) begin // count 1
			dispMode = 2'b00;
		end
		
		if (sw[1] == 1) begin // count 0
			dispMode = 2'b01;
		end
		
		if (sw[2] == 1) begin // decimal or hex
			dispMode = 2'b10;
		end
	end

endmodule 