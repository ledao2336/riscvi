`timescale 1ps / 1ps

module tb_top;

    logic clk;
    logic reset_n;

//    logic [31:0] instruction;
//    logic [31:0] pcnext;
//    logic [31:0] pc_out;
//    logic [31:0] pcfour;
//    logic [31:0] rs1data, rs2data;
//    logic [31:0] outimm;
//    logic brun, brless, brequal;
//    logic [31:0] operanda, operandb;
//    logic [3:0] aluop;
//    logic [31:0] aludata;
//    logic [31:0] wbdata;
//    logic [31:0] lddata;
//    logic [1:0] wbsel;
//    logic psel, rdwren, insnvld;
//    logic [31:0] i_ls_addr, i_st_data;
//    logic i_lsu_wren;
//    logic [31:0] o_ld_data;
    logic [31:0] LEDR, o_io_ledg, o_io_hex0_7, o_io_lcd;
    logic [31:0] i_io_sw, i_io_btn;

    top uut (
        .clk(clk),
        .reset_n(reset_n),
//		  .instruction(instruction),
//		  .pcnext(pcnext),
//		  .pc_out(pc_out),
//		  .pcfour(pcfour),
//		  .rs1data(rs1data),
//		  .rs2data(rs2data),
//		  .outimm(outimm),
//		  .brun(brun),
//		  .brless(brless),
//		  .brequal(brequal),
//		  .operanda(operanda),
//		  .operandb(operandb),
//		  .aluop(aluop),
//		  .aludata(aludata),
//		  .wbdata(wbdata),
//		  .lddata(lddata),
//		  .wbsel(wbsel),
//		  .psel(psel),
//		  .rdwren(rdwren),
//		  .insnvld(insnvld),
//		  .i_ls_addr(i_ls_addr),
//		  .i_st_data(i_st_data),
//		  .i_lsu_wren(i_lsu_wren),
//		  .o_ld_data( o_ld_data),
		  .LEDR(LEDR),
		  .o_io_lcd(o_io_lcd),
		  .o_io_hex0_7(o_io_hex0_7),
		  .o_io_ledg(o_io_ledg),
		  .i_io_sw(i_io_sw),
		  .i_io_btn(i_io_btn)
    );


    always #5 clk = ~clk; 

  
    initial begin
        clk = 0;
        reset_n = 0;


        #10 reset_n = 1;


        #1000 $stop;
    end



endmodule
