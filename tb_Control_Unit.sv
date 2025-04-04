`timescale 1ps/1ps

module tb_control_unit;
    bit clk;
    bit reset_n;
    logic [31:0] ins;
    bit rd_wren, isns_vld, br_un, br_less, br_equal;
    bit opa_sel, opb_sel, mem_wren, psel;
    logic [3:0] alu_op;
    logic [1:0] wb_sel;

    // Instantiation of DUT (Device Under Test)
    control_unit dut (
        .clk(clk),
        .reset_n(reset_n),
        .ins(ins),
        .rd_wren(rd_wren),
        .isns_vld(isns_vld),
        .br_un(br_un),
        .br_less(br_less),
        .br_equal(br_equal),
        .opa_sel(opa_sel),
        .opb_sel(opb_sel),
        .alu_op(alu_op),
        .mem_wren(mem_wren),
        .wb_sel(wb_sel),
        .psel(psel)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Testcase logic
    initial begin
        clk = 0;
        reset_n = 0;
        ins = 32'b0;
        br_less = 0;
        br_equal = 0;
        #10 reset_n = 1; // Release reset

        $display("Starting Testbench...");
        
        // Test R-Type Instruction (ADD, SUB, AND, OR)
        ins = 32'b00000000000100010000000110110011; // ADD x3, x1, x2
        @(posedge clk);
        #1;
        $display("R-Type: ins=0x%h, rd_wren=%b, alu_op=%b, wb_sel=%b", ins, rd_wren, alu_op, wb_sel);

        // Test I-Type Instruction (ADDI)
        ins = 32'b00000000010100010000000110010011; // ADDI x3, x2, 5
        @(posedge clk);
        #1;
        $display("I-Type: ins=0x%h, rd_wren=%b, alu_op=%b, wb_sel=%b", ins, rd_wren, alu_op, wb_sel);

        // Test Load Instruction (LW)
        ins = 32'b00000000010000010010000110000011; // LW x3, 4(x2)
        @(posedge clk);
        #1;
        $display("Load: ins=0x%h, rd_wren=%b, mem_wren=%b, wb_sel=%b", ins, rd_wren, mem_wren, wb_sel);

        // Test Store Instruction (SW)
        ins = 32'b00000000001100010010000110100011; // SW x3, 4(x2)
        @(posedge clk);
        #1;
        $display("Store: ins=0x%h, rd_wren=%b, mem_wren=%b, wb_sel=%b", ins, rd_wren, mem_wren, wb_sel);

        // Test Branch Instruction (BEQ)
        ins = 32'b00000000001100010000000111100011; // BEQ x3, x2, label
        @(posedge clk);
        #1;
        $display("Branch: ins=0x%h, br_un=%b, alu_op=%b", ins, br_un, alu_op);

        // Test Jump Instruction (JAL) (nếu module hỗ trợ)
        ins = 32'b00000000000000000000000011101111; // JAL x1, label
        @(posedge clk);
        #1;
        $display("Jump (JAL): ins=0x%h, rd_wren=%b, wb_sel=%b", ins, rd_wren, wb_sel);

        // Test Upper Immediate (LUI)
        ins = 32'b00000000000000000000000010110111; // LUI x1, 0x00000
        @(posedge clk);
        #1;
        $display("LUI: ins=0x%h, rd_wren=%b, wb_sel=%b", ins, rd_wren, wb_sel);

        $display("Testbench completed.");
        $stop;
    end
endmodule
