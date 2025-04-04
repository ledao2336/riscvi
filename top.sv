module top(
	input bit clk,
	input bit reset_n,
	output logic [31:0] LEDR,
	output logic [31:0] o_io_ledg, 
	output logic [31:0] o_io_hex0_7, 
	output logic [31:0] o_io_lcd,
   input logic [31:0] i_io_sw, 
	input logic [31:0] i_io_btn
);
	wire [31:0] instruction;
	wire [31:0] pcnext;
	//PC
	wire [31:0] pc_out;
	
	//Adder 4
	//wire [31:0] pc_out
	wire [31:0] pcfour;
	
	//Instruction_mem
	//wire [31:0] instruction;
	
	//Reg_file
	wire [31:0] rs1data,rs2data;
	
	
	//Immgen
	//wire [31:0] instruction,
	wire [31:0] outimm;
	
	//BRC
	wire brun;//*
	wire brless;//*
	wire brequal;//*
	
	//mux1
	//wire [31:0] pc_out,
	//wire [31:0] rs1data,
	wire [31:0] operanda;//*
	
	//mux2
	//wire [31:0]rs1dada,	
	//wire [31:0]outimm,
	wire [31:0] operandb;//*
	
	//alu
	//wire [31:0] operanda,
	//wire [31:0] operandb,
	wire	[3:0] aluop;//*
	wire	[31:0] aludata;

	
	//mux3
	//wire [31:0] pcfour,
	//wire [31:0] aludata;
	wire [31:0] wbdata;
	wire [31:0] lddata;
	wire [1:0] wbsel;//*
	
	//lsu
	
	
	//Control unit
	wire psel;
	wire rdwren;
	wire insnvld;
	//wire brun;
	//wire brless;
	//wire brequal;
	//wire opasel;
	//wire opbsel;
	//wire [3:0] aluop;
	//wire memwren;
	//wire [1:0] wbsel;
	
	//lsu
	wire [31:0] i_ls_addr;
	wire [31:0] i_st_data;
	wire [31:0] o_ld_data;
//PC	
PC PC(
	.clk(clk),
	.reset_n(reset_n),
	.in(pcnext),
	.out(pc_out)
);
pc_add_4 pc_add_4(
	.clk(clk),
	.reset_n(reset_n),
	.pc(pc_out),
	.pc_four(pcfour)
);
//Instruction_mem
Instruction_mem Instrucion_mem(
	.clk(clk),
	.reset_n(reset_n),
	.pc_in(pc_out),
	.ins_out(instruction)
);
//Regfile
Reg_file Reg_file(
	.clk(clk),
	.reset_n(reset_n),
	.rs1(instruction[19:15]),
	.rs2(instruction[24:20]),
	.rd( instruction[11:7]),
	.write_enable(rdwren),
	.rs1_data(rs1data),
	.rs2_data(rs2data),
	.rd_data(wbdata)
);
//ImmGen
imme_gen imme_gen(
	.ins(instruction),
	.out_ins(outimm)
);
//BRC
branch branch(
	.rs1_data(rs1data),
	.rs2_data(rs2data),
	.br_un(brun),
	.br_less(brless),
	.br_equal(brequal)
);
//mux1
mux1 mux1(
	.pc(pc_out),
	.rs1_data(rs1data),
	.opa_sel(opasel),
	.operand_a(operanda)
);
//mux2
mux2 mux2(
	.imme_gen(outimm),
	.rs2_data(rs2data),
	.opb_sel(opbsel),
	.operand_b(operandb)
);
//alu
alu alu(
    .operand_a(operanda),  
    .operand_b(operandb),   
    .alu_op(aluop),      
    .alu_result(aludata)   
);
//mux3
mux3 mux3(
    .pc_four(pcfour),
    .alu_data(aludata),
    .ld_data(o_ld_data),//*
    .wb_sel(wbsel),
    .wb_data(wbdata)//*
);
//mux4
mux4 mux4(
	.alu_data(aludata),
	.pc_four(pcfour),
	.pc_sel(psel),
	.pc_next(pcnext)
);
//lsu
lsu lsu(
    .i_clk(clk),          // Clock signal
    .i_rst(reset_n),          // Reset signal
    .i_ls_addr(aludata),      // Load/store address
    .i_st_data(rs2data),      // Data to be stored     
    .o_ld_data(o_ld_data),      // Data read from memory
    .LEDR(LEDR),      // Output for red LEDs
    .o_io_ledg(o_io_ledg),      // Output for green LEDs
    .o_io_hex0_7(o_io_hex0_7),    // Output for 7-segment displays
    .o_io_lcd(o_io_lcd),       // Output for LCD register
    .i_io_sw(i_io_sw),        // Input for switches
    .i_io_btn(i_io_btn),        // Input for buttons
	 .i_lsu_wren(memwren),
	 .ins(instruction)
);
//control_unit
control_unit control_unit(
	.psel(psel),
	.clk(clk),
	.reset_n(reset_n),
	.ins(instruction),
	.rd_wren(rdwren),
	.isns_vld(insnvld),
	.br_un(brun),
	.br_less(brless),
	.br_equal(brequal),
	.opa_sel(opasel),
	.opb_sel(opbsel),
	.alu_op(aluop),
	.mem_wren(memwren),
	.wb_sel(wbsel)
);
endmodule 
