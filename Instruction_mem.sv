module Instruction_mem(
	input bit clk,
	input bit reset_n,
	input logic [31:0] pc_in,
	output logic [31:0] ins_out
);
	logic [31:0] mem [255:0];
initial begin
		
end
always_ff@(posedge clk or negedge reset_n)begin
	if(!reset_n)
//		for(int i = 0;i<256;i++)begin
//			mem[i]<=32'b0;
//		end
		$readmemh("mem_test.txt",mem);
end

always_comb begin
		ins_out = mem[pc_in[31:2]];
end
endmodule
//