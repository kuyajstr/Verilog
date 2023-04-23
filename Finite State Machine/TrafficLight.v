module TrafficLight(Clock, Reset, CAR, TIMEOUT, GREEN, YELLOW, RED);
	
	input Clock, Reset, CAR, TIMEOUT;
	
	output reg GREEN, YELLOW, RED;
	
	reg [1:0] present, Next;
	
	parameter green = 2'b00;
	parameter yellow = 2'b01;
	parameter red = 2'b10;
	
	always @(CAR, present) begin
		case(present)
			green: 	if(CAR == 0) 	Next = green;
						else 			 	Next = yellow; 
			
			yellow:	if(CAR == 0) 	Next = yellow;
						else 				Next = red; 
			
			red:		if(CAR == 0) 	Next = red;
						else 				Next = green; 
						
			default: Next = 2'bxx;
		endcase
	end
	
	always @(posedge Clock, negedge Reset) begin
		if (Reset == 0) present <= green;
		
		else begin
			if(present == red && Next == green)
				#300000000 present <= Next;
			
			else present <= Next;
			
			case(Next)
					2'b00: begin 
						GREEN 	= 1;
						YELLOW 	= 0;
						RED 		= 0;
					end
					
					2'b01: begin 
						GREEN 	= 0;
						YELLOW 	= 1;
						RED 		= 0;
					end
					
					2'b10: begin 
						GREEN 	= 0;
						YELLOW 	= 0;
						RED 		= 1;
					end
			endcase
			
		end 
	end

endmodule