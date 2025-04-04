module imme_gen(
	input logic [31:0] ins,
	output logic[31:0] out_ins
);
	always_comb begin
		case(ins[6:0])
			7'b0010011://I-type
				out_ins = {{20{ins[31]}},ins[31:20]};
			7'b0100011://S-type
				out_ins = {{20{ins[31]}},ins[31:25],ins[11:7]};
			7'b1100011://B-type
				out_ins = {{19{ins[31]}}, ins[31], ins[7], ins[30:25], ins[11:8], 1'b0};
			7'b0110111,7'b0010111:// U-type lui & auipc
				out_ins = {ins[31:12],12'b0};
			7'b1101111://J-type
				out_ins = {{11{ins[31]}}, ins[31], ins[19:12], ins[20], ins[30:21], 1'b0};
			default:
				out_ins = 32'b0;
		endcase
	end
endmodule
 