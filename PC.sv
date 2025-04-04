module PC(
	input bit clk,reset_n,
	input logic [31:0] in,
	output logic [31:0] out
);
	always_ff @(posedge clk or negedge reset_n) begin
		if(!reset_n)
			out <= 32'b0;
		else
			out <= in;
		
	end
endmodule
