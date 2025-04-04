`timescale 1ps/1ps

module tb_pc_add_4;
    bit clk;
    bit reset_n;
    logic [31:0] pc;
    logic [31:0] pc_four;

    pc_add_4 dut (
        .clk(clk),
        .reset_n(reset_n),
        .pc(pc),
        .pc_four(pc_four)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset_n = 0;
        pc = 32'b0;
        
        #10 reset_n = 1;

        @(posedge clk);
        #1;
        $display("At time %t, PC = %h, PC_FOUR = %h", $time, pc, pc_four);

        pc = 32'h00000000;
        @(posedge clk);
        #1;
        $display("At time %t, PC = %h, PC_FOUR = %h", $time, pc, pc_four);

        pc = 32'h00000004;
        @(posedge clk);
        #1;
        $display("At time %t, PC = %h, PC_FOUR = %h", $time, pc, pc_four);

        pc = 32'h00000010;
        @(posedge clk);
        #1;
        $display("At time %t, PC = %h, PC_FOUR = %h", $time, pc, pc_four);

        pc = 32'hFFFFFFFC;
        @(posedge clk);
        #1;
        $display("At time %t, PC = %h, PC_FOUR = %h", $time, pc, pc_four);

        $stop;
    end
endmodule
