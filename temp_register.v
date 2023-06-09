	module temp_register (input clk, reset_n, load, increment, decrement, input [7:0] data,
					output negative, positive, zero);

	reg signed [7:0] counter /*synthesis keep*/;
	reg neg,pos,z;
	
	assign negative = neg;
	assign positive = pos;
	assign zero = z;
	always @(posedge clk) begin
		
		if (!reset_n) counter <= 0;
		else if (load) counter <= data;
		else if (increment) counter <= counter + 8'b00000001;
		else if (decrement) counter <= counter - 8'b00000001;
		
		if (counter < 0) begin
			neg <= 1;
			pos <= 0;
			z <= 0;
		end
		
		else if (counter == 0) begin
			z <= 1;
			neg <= 0;
			pos <= 0;
		end
		
		else if (counter > 0) begin
			pos <= 1;
			neg <= 0;
			z <= 0;
		end
	
	end

endmodule
