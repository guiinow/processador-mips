module ULAControl(input            clk,
			      input      [0:1] OpALU,
				  input      [0:5] funct,
				  output reg [0:3] inputALU);
		   
	
	always @(negedge clk) begin 
		case (OpALU)
			2'b00: inputALU <= 4'b0010; //4 bits, add, porque é LW e/ou SW
			2'b01: inputALU <= 4'b0110; //4 bits, branch equal 
			2'b10: case (funct)
				6'b100000: inputALU <= 4'b0010; //add
				6'b100010: inputALU <= 4'b0110; //subtract
				6'b100100: inputALU <= 4'b0000; //AND
				6'b100101: inputALU <= 4'b0001; //OR
				6'b101010: inputALU <= 4'b0111; //slt
				default: inputALU <= 4'b0000;
			endcase
			default: inputALU <= 4'b0000;
		endcase
	end	   
endmodule

// a ula recebe 6 bits de funct e 2 bits de op alu
	// funct só para instruções do tipo r
	// funct 
	// 100000 - add
	// 100010 - subtract
	// 100100 - AND
	// 100101 - or
	// 101010 - set on less than slt
	// OpALU para tipo R: 10
	// OpALU para tipo I: 00
	// OpALU para branch: 01