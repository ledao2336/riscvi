`timescale 1ps/1ps
module mux2_tb;
	logic [31:0] imme_gen;
	logic [31:0] rs2_data;
	bit opb_sel;
	
	//Output
	logic [31:0] operand_b;

	mux2 dut(
		.imme_gen(imme_gen),
		.rs2_data(rs2_data),
		.opb_sel(opb_sel),
		.operand_b(operand_b)
	);
	initial begin
		$display("Time \t\t Imme_gen \t\t rs2_data \t\t opb_sel \t\t operand_b");
		$display ("--------------------------------------------------------------------------------------");
		
		//case 1 opb_sel = 0
		opb_sel = 0;
		imme_gen = 32'd6;
		rs2_data = 32'hfffffabc;
		#10;
		$display("%t\t %b\t %b\t %b\t %b\t ",$time, imme_gen, rs2_data,operand_b,opb_sel);
		
		//case 2 opb_Sel = 1
		opb_sel = 1;
		imme_gen = 32'd6;
		rs2_data = 32'hfffffabc;
		#10;
		$display("%t\t %b\t %b\t %b\t %b\t ",$time, imme_gen, rs2_data,operand_b,opb_sel);
		$stop;
	end

endmodule 
