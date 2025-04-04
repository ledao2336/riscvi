module mux4(
	input logic [31:0] alu_data,
	input logic [31:0] pc_four,
	input bit 	pc_sel,
	output logic [31:0] pc_next
);
	assign pc_next = (pc_sel == 0) ?  pc_four : alu_data;
endmodule 