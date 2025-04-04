module mux2(
	input logic [31:0] imme_gen,
	input logic [31:0] rs2_data,
	input bit 	opb_sel,
	output logic [31:0] operand_b
);
	assign operand_b = (opb_sel==1'b0) ? imme_gen : rs2_data;
endmodule 
