module mux3(
    input logic [31:0] pc_four,
    input logic [31:0] alu_data,
    input logic [31:0] ld_data,
    input bit [1:0] wb_sel,
    output logic [31:0] wb_data
);
    assign wb_data = (wb_sel == 2'b00) ? ld_data:
                     (wb_sel == 2'b01) ? alu_data :
                     (wb_sel == 2'b10) ? pc_four :
                                         32'h00000000; 

endmodule
