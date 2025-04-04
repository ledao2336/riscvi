import shift_function::*;

module alu (
    input  logic [31:0] operand_a,  
    input  logic [31:0] operand_b,   
    input  logic [3:0]  alu_op,      
    output logic [31:0] alu_result   
);
    logic signed [31:0] signed_a, signed_b;
    logic [31:0] shift_result;       
    logic [31:0] subtract_result;   
    logic [31:0] comparison_result; 
    bit zero;

    assign signed_a = operand_a;
    assign signed_b = operand_b;

    always_comb begin
        shift_result = 32'd0;
        subtract_result = 32'd0;
        comparison_result = 32'd0;
        alu_result = 32'd0;
        zero = 0;

        subtract_result = operand_a + (~operand_b + 1);

        case (alu_op)
            4'b0010: begin // SLL (Shift Left Logical)
                shift_result = shift_function::sll(operand_a,operand_b[4:0]);
            end
				
            4'b1010: begin // SRL (Shift Right Logical)
                shift_result = shift_function::srl(operand_a,operand_b[4:0]);
            end

            4'b1011: begin; // SRA (Shift Right Arithmetic)
					shift_result  = shift_function::sra(operand_a,operand_b[4:0]);
				end
        endcase
		  
		  
		   case (alu_op)
            4'b0100: begin //SLT
					if(operand_a[31]==operand_b[31])begin
							comparison_result = operand_a + (~operand_b+1);
							comparison_result = comparison_result[31];
					end else if (operand_a[31]==1 && operand_b[31]==0)
						comparison_result = 1;
					else
						comparison_result = 0;
				end
				
            4'b0110: begin //SLTU
					if(operand_a[31]==operand_b[31])begin
						comparison_result = operand_a + (~operand_b+1);
						comparison_result = comparison_result[31];
					end else if (operand_a[31]==1 && operand_b[31]==0)
						comparison_result = 0;
					else
						comparison_result = 1;
				end
        endcase
		  
		  
        case (alu_op)
            4'b0000: alu_result = operand_a + operand_b;           // ADD
            4'b0001: alu_result = subtract_result;                // SUB 
            4'b0100, 4'b0110: alu_result = comparison_result[0]; // SLT or SLTU 
            4'b1000: alu_result = operand_a ^ operand_b;          // XOR
            4'b1100: alu_result = operand_a | operand_b;          // OR
            4'b1110: alu_result = operand_a & operand_b;          // AND
            4'b0010, 4'b1010, 4'b1011: alu_result = shift_result; // SLL, SRL, SRA
            default: alu_result = 32'd0;                          // Default 
        endcase
    end

endmodule
