`timescale 1ps/1ps
module mux3_tb;
	logic [31:0] pc_four;
	logic [31:0] alu_data;
	logic [31:0] ld_data;
	bit 	[1:0]  wb_sel;
	
	//ouput 
	logic [31:0] wb_data;
	mux3 dut(
		.pc_four(pc_four),
		.alu_data(alu_data),
		.ld_data(ld_data),
		.wb_sel(wb_sel),
		.wb_data(wb_data)
	);
	initial begin 
		$display("Time \t\t pc_four \t\t alu_data \t\t ld_data \t\t wb_sel \t\t wb_data");
		$display("---------------------------------------------------------------------");
		
		//case 1 wb_sel = 0 
		pc_four = 32'd7;
		alu_data = 32'hfffffabd;
		ld_data = 32'hfffaabcd;
		wb_sel = 0;
		#10;
		$display("%t\t %b\t %b\t %b\t %b\t %b\t",$time,pc_four,alu_data,ld_data,wb_sel,wb_data);
		
		//case 2 wb_sel = 1
		pc_four = 32'd7;
		alu_data = 32'hfffffabd;
		ld_data = 32'hfffaabcd;
		wb_sel = 1;
		#10;
		$display("%t\t %b\t %b\t %b\t %b\t %b\t",$time,pc_four,alu_data,ld_data,wb_sel,wb_data);
		
		//case 3 wb_sel = 2
		pc_four = 32'd7;
		alu_data = 32'hfffffabd;
		ld_data = 32'hfffaabcd;
		wb_sel = 2;
		#10;
		$display("%t\t %b\t %b\t %b\t %b\t %b\t",$time,pc_four,alu_data,ld_data,wb_sel,wb_data);
		
		//case 4 default
		pc_four = 32'd7;
		alu_data = 32'hfffffabd;
		ld_data = 32'hfffaabcd;
		wb_sel = 3;
		#10;
		$display("%t\t %b\t %b\t %b\t %b\t %b\t",$time,pc_four,alu_data,ld_data,wb_sel,wb_data);
		$stop;
	end
endmodule 