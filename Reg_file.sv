module Reg_file(
    input bit clk, reset_n,
    input logic [4:0] rs1, rs2, rd,
    input bit write_enable,
    output logic [31:0] rs1_data, rs2_data,
    input logic [31:0] rd_data
);
    logic [31:0] mem [31:0];

    always_ff @(negedge reset_n or posedge clk) begin
        if (!reset_n) begin
            mem[0] <= 32'b0;
            for (int i = 1; i < 32; i++) begin
                mem[i] <= 32'b0;
            end
        end else if (write_enable && rd != 5'b00000) begin
            mem[rd] <= rd_data;
        end
    end

    always_comb begin
        if (rs1 == 5'b00000)
            rs1_data = 32'b0;
        else
            rs1_data = mem[rs1];

        if (rs2 == 5'b00000)
            rs2_data = 32'b0;
        else
            rs2_data = mem[rs2];
    end
endmodule
