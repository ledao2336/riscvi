`timescale 1ps/1ps
module mux1_tb;
	logic [31:0] rs1_data;
	logic [31:0] pc;
	bit opa_sel;
	
	//ouput
	logic [31:0] operand_a;
	
	mux1 dut(
		.rs1_data(rs1_data),
		.operand_a(operand_a),
		.pc(pc),
		.opa_sel(opa_sel)
	);
	
	initial begin
		$display("Time \t\t rs1_data \t\t pc \t\t opa_sel \t\t operand_a");
		$display("------------------------------------------------------");
		
		//Test case 1 opa_sel = 1
		rs1_data = 32'hffffffaa;
		pc = 32'h00000005;
		opa_sel = 1;
		#10;
		$display("%t\t %b\t %b\t %b\t %b\t",$time, rs1_data,pc,opa_sel, operand_a);
		
		
		//Test case 2 opa_sel = 0
		rs1_data = 32'hffffffaa;
		pc = 32'h00000005;
		opa_sel = 0	;
		#10;
		$display("%t\t %b\t %b\t %b\t %b\t",$time, rs1_data,pc,opa_sel, operand_a);
		
		$stop;
	end
	
endmodule 
