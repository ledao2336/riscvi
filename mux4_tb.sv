`timescale 1ps/1ps
module mux4_tb;
	logic [31:0] alu_data;
	logic [31:0] pc_four;
	bit 			 pc_sel;
	
	//output
	logic [31:0] pc_next;
	
	mux4 dut(
		.alu_data(alu_data),
		.pc_four(pc_four),
		.pc_sel(pc_sel),
		.pc_next(pc_next)
	);
	
	initial begin
		$display("Time \t\t alu_data \t\t pc_four \t\t pc_sel \t\t pc_next");
		$display("----------------------------------------------------------");
		
		//case 1 pc_sel = 0
		pc_sel = 0;
		alu_data = 32'hffffffff;
		pc_four = 32'h00000004;
		#10;
		$display("%t\t %b\t %b\t %b\t %b\t",$time,alu_data,pc_four,pc_sel,pc_next);
		
		//case 1 pc_sel = 1
		pc_sel = 1;
		alu_data = 32'hffffffff;
		pc_four = 32'h00000004;
		#10;
		$display("%t\t %b\t %b\t %b\t %b\t",$time,alu_data,pc_four,pc_sel,pc_next);
		
		//case 1 pc_sel = default
		pc_sel = 2;
		alu_data = 32'hffffffff;
		pc_four = 32'h00000004;
		#10;
		$display("%t\t %b\t %b\t %b\t %b\t",$time,alu_data,pc_four,pc_sel,pc_next);
		$stop;
	end
endmodule 
