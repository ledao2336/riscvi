`timescale 1ps/1ps

module alu_tb;
    // Inputs
    logic [31:0] operand_a;
    logic [31:0] operand_b;
    logic [3:0] alu_op;

    // Output
    logic [31:0] alu_result;

    // Instantiate the DUT (Device Under Test)
    alu dut (
        .operand_a(operand_a),
        .operand_b(operand_b),
        .alu_op(alu_op),
        .alu_result(alu_result)
    );

    // Testbench logic
    initial begin
        // Display header
        $display("Time\t ALU_OP\tOperand_A\tOperand_B\tALU_Result");
        $monitor("%0dns\t%b\t%h\t%h\t%h", $time, alu_op, operand_a, operand_b, alu_result);

        // Test Case 1: ADD
        alu_op = 4'b0000; // ADD
        operand_a = 32'd10;
        operand_b = 32'd15;
        #10; // Wait 10ns

        // Test Case 2: SUB
        alu_op = 4'b0001; // SUB
        operand_a = 32'd20;
        operand_b = 32'd15;
        #10;

        // Test Case 3: SLT (signed less than)
        alu_op = 4'b0010; // SLT
        operand_a = 32'hFFFFFFF8; // 10
        operand_b = 32'h00000008; // -7

        #10;

        // Test Case 4: SLTU (unsigned less than)
        alu_op = 4'b0011; // SLTU
        operand_a = 32'hFFFFFFF8; // 10
        operand_b = 32'h00000008; // -7

        #10;

        // Test Case 5: XOR
        alu_op = 4'b0100; // XOR
        operand_a = 32'hF0F0F0F0;
        operand_b = 32'h0F0F0F0F;
        #10;

        // Test Case 6: OR
        alu_op = 4'b0101; // OR
        operand_a = 32'hAAAA5555;
        operand_b = 32'h5555AAAA;
        #10;

        // Test Case 7: AND
        alu_op = 4'b0110; // AND
        operand_a = 32'hFFFF0000;
        operand_b = 32'h00FFFF00;
        #10;

        // Test Case 8: SLL (Shift Left Logical)
        alu_op = 4'b0111; // SLL
        operand_a = 32'h00000001;
        operand_b = 32'd5;
        #10;

        // Test Case 9: SRL (Shift Right Logical)
        alu_op = 4'b1000; // SRL
        operand_a = 32'h80000000;
        operand_b = 32'd4;
        #10;

        // Test Case 10: SRA (Shift Right Arithmetic)
        alu_op = 4'b1001; // SRA
        operand_a = 32'sh01000000; // -268435456 (in signed)
        operand_b = 32'd8;
        #10;

        // End simulation
        $stop;
    end
endmodule
