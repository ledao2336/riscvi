`timescale 1ps/1ps

module tb_Reg_file;
    bit clk;
    bit reset_n;
    logic [4:0] rs1, rs2, rd;
    bit write_enable;
    logic [31:0] rs1_data, rs2_data, rd_data;

    Reg_file dut (
        .clk(clk),
        .reset_n(reset_n),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .write_enable(write_enable),
        .rs1_data(rs1_data),
        .rs2_data(rs2_data),
        .rd_data(rd_data)
    );

	 initial begin
		  clk = 0;
        write_enable = 0;
        rd = 5'b0;
        rs1 = 5'b0;
        rs2 = 5'b0;
        rd_data = 32'b0;
        reset_n = 0;
		  #5 reset_n = 1;
	 end
    always #5 clk = ~clk;


    initial begin
        $display("Writing");
        write_enable = 1;

        rd = 5'd1; // Ghi vào thanh ghi x1
        rd_data = 32'h12345678;
        @(posedge clk);

        rd = 5'd2; // Ghi vào thanh ghi x2
        rd_data = 32'h87654321;
        @(posedge clk);

        rd = 5'd0; // Thử ghi vào x0 
        rd_data = 32'hDEADBEEF;
        @(posedge clk);

        write_enable = 0;

        //Đọc thanh ghi x1 và x2
        $display("Reading values from registers...");
        rs1 = 5'd1;
        rs2 = 5'd2;
        @(posedge clk);
        #1; // Đợi dữ liệu ổn định
        $display("Read rs1_data (x1): %h", rs1_data);
        $display("Read rs2_data (x2): %h", rs2_data);

        //Kiểm tra x0
        rs1 = 5'd0;
        @(posedge clk);
        #1;
        $display("Read rs1_data (x0 - must be 0): %h", rs1_data);

        $display("Testbench completed.");
		  
        $stop;
    end
endmodule
