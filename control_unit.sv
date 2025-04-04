module control_unit(
	output bit psel,
	input  bit clk,
	input  bit reset_n,
	input  logic [31:0] ins,
	output bit rd_wren,
	output bit isns_vld,
	output bit br_un,
	input  bit br_less,
	input	 bit br_equal,
	output bit opa_sel,
	output bit opb_sel,
	output bit [3:0] alu_op,
	output bit mem_wren,
	output bit [1:0] wb_sel
);
	always_comb begin
	     psel = 0;
        rd_wren = 0;
        isns_vld = 0;
        opa_sel = 0;
        opb_sel = 0;
        wb_sel = 0;
        alu_op = 4'b0;
        mem_wren = 0;
        br_un = 0;
		case(ins[6:0])
		
		
			7'b0110011: begin//R	
				psel = 0;
				rd_wren = 1;
				isns_vld = 0;
				opa_sel = 0;
				opb_sel = 1;
				wb_sel = 1;
				alu_op = {ins[14:12],ins[30]};//R-Type
				mem_wren = 0;
				br_un = 0;//x
			end
			
			
			7'b0010011:begin//I
				psel = 0;
				rd_wren = 1;
				isns_vld = 0;
				opa_sel = 0;
				opb_sel = 0;
				wb_sel = 1;
			   if (ins[14:12] == 3'b001 || ins[14:12] == 3'b101) 
				  alu_op = {ins[14:12], ins[30]}; // I-type shift instructions
			   else 
				  alu_op = {ins[14:12], 1'b0}; // Other I-type operations
				mem_wren = 0;
				br_un = 0;//x
			end
			
			
			7'b0000011:begin//L
				psel = 0;
				rd_wren = 1;
				isns_vld = 0;
				opa_sel = 0;
				opb_sel = 0;
				wb_sel = 0;
				alu_op = 4'b0;//I-type
				mem_wren = 0;
				br_un = 0;//x
			end
			
			
			7'b0100011:begin//S
				psel = 0;
				rd_wren = 0;
				isns_vld = 0;
				opa_sel = 0;
				opb_sel = 0;
				wb_sel = 0;//x
				alu_op = 4'b0;
				mem_wren = 1;
				br_un = 0;//x

			end 
			7'b1100011:begin//B
				rd_wren = 0;
				isns_vld = 0;
				opa_sel = 1;
				opb_sel = 0;
				wb_sel = 0;//x
				alu_op = 4'b0;
				mem_wren = 0;
				
				case (ins[14:12])
					3'b000: br_un = 0; // beq 
					3'b001: br_un = 0; // bne 
					3'b100: br_un = 0; // blt 
					3'b101: br_un = 0; // bge 
					3'b110: br_un = 1; // bltu 
					3'b111: br_un = 1; // bgeu 
					default: br_un = 0;
				endcase
				
				 case (ins[14:12])
					  3'b000: if (br_equal) psel = 1; // beq
					  3'b001: if (~br_equal) psel = 1; // bne
					  3'b100: if (br_less) psel = 1; // blt
					  3'b101: if (~br_less) psel = 1; // bge
					  3'b110: if (br_less) psel = 1; // bltu
					  3'b111: if (~br_less) psel = 1; // bgeu
						default: psel = 0;
				endcase
			end
			
			
			7'b1101111:begin//Jal
				psel = 1;
				rd_wren = 1;
				isns_vld = 0;
				opa_sel = 1;
				opb_sel = 0;
				wb_sel = 2;
				alu_op = 4'b0;
				mem_wren = 0;
				br_un = 0;//x
			end


			//Special
			7'b1100111:begin//Jalr
				psel = 0;
				rd_wren = 1;
				isns_vld = 0;
				opa_sel = 0;
				opb_sel = 1;
				wb_sel = 2;
				alu_op = 4'b0;
				mem_wren = 0;
				br_un = 0;//x
			end




			7'b0110111:begin//lui
				psel = 0;
				rd_wren = 1;
				isns_vld = 0;
				opa_sel = 0;//x
				opb_sel = 0;
				alu_op = 4'b0;
				wb_sel = 1;
				mem_wren = 0;
				br_un = 0;//x
//				br_less = 0;//x
//				br_equal = 0;//x
			end

			7'b0010111:begin//auipc
				psel = 0;
				rd_wren = 1;
				isns_vld = 0;
				opa_sel = 1;
				opb_sel = 0;
				alu_op = 0;
				wb_sel = 1;
				mem_wren = 0;
				br_un = 0;//x
//				br_less = 0;//x
//				br_equal = 0;//x
			end
			
			default:;
		endcase
	end
endmodule 