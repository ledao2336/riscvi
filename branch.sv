module branch(
	input logic [31:0] rs1_data,
	input logic [31:0] rs2_data,
	input bit          br_un,
	output bit         br_less,
	output bit         br_equal
);
	logic [31:0] result;
	always_comb begin
		br_less = 1'b0;
		br_equal = 1'b0;
		result = 32'b0;

		if(rs1_data == rs2_data)begin
			br_less = 32'b0;
			br_equal = 32'b1;
		end else begin
			if(br_un)begin
				if(rs1_data[31] == rs2_data[31])begin
					result = rs1_data + (~rs2_data + 1);
					br_less = result[31];
					br_equal = 32'b0;
				end else if (rs1_data[31]==0 && rs2_data[31]==1) begin
					br_less = 32'b1;
					br_equal = 32'b0;
				end else begin
					br_less = 32'b0;
					br_equal = 32'b0;
				end
			end else begin
				if(rs1_data[31] == rs2_data[31])begin
					result = rs1_data + (~rs2_data + 1);
					br_less = result[31];
					br_equal = 32'b0;
				end else if (rs1_data[31]==0 && rs2_data[31]==1) begin
					br_less = 32'b0;
					br_equal = 32'b0;
				end else begin
					br_less = 32'b1;
					br_equal = 32'b0;
				end
			end
		
		end
	end
endmodule
