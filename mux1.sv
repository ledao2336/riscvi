module mux1(
	input  logic [31:0] pc,
	input  logic [31:0] rs1_data,
	input  bit 	 opa_sel,
	output logic [31:0] operand_a
);
	assign operand_a = (opa_sel==1'b0) ? rs1_data : pc;
endmodule 
