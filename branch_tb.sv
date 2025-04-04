`timescale 1ps/1ps
module branch_tb;

    // Inputs
    logic [31:0] rs1_data;
	 logic[31:0] rs2_data;
    bit br_un;

    // Outputs
    bit br_less;
    bit br_equal;

    // Instantiate the DUT (Device Under Test)
    branch dut (
        .rs1_data(rs1_data),
        .rs2_data(rs2_data),
        .br_un(br_un),
        .br_less(br_less),
        .br_equal(br_equal)
    );

    // Test Procedure
    initial begin
        // Display header for results
        $display("Time\t\t br_un\t rs1_data\t rs2_data\t br_less\t br_equal");
        $display("-----------------------------------------------------------");

        // Test Case 1: rs1_data == rs2_data
        rs1_data = 32'd10;
        rs2_data = 32'd10;
        br_un = 1'b0;
        #10;
        $display("%t\t %b\t %h\t %h\t %b\t %b", $time, br_un, rs1_data, rs2_data, br_less, br_equal);

        // Test Case 2: Unsigned comparison, rs1_data < rs2_data
        rs1_data = 32'd5;
        rs2_data = 32'd10;
        br_un = 1'b1;
        #10;
        $display("%t\t %b\t %h\t %h\t %b\t %b", $time, br_un, rs1_data, rs2_data, br_less, br_equal);

        // Test Case 3: Unsigned comparison, rs1_data > rs2_data
        rs1_data = 32'd20;
        rs2_data = 32'd10;
        br_un = 1'b1;
        #10;
        $display("%t\t %b\t %h\t %h\t %b\t %b", $time, br_un, rs1_data, rs2_data, br_less, br_equal);

        // Test Case 4: Signed comparison, rs1_data < rs2_data
        rs1_data = 32'hFFFFFFF5; // -11 in signed 32-bit
        rs2_data = 32'hFFFFFFFA; // -6 in signed 32-bit
        br_un = 1'b0;
        #10;
        $display("%t\t %b\t %h\t %h\t %b\t %b", $time, br_un, rs1_data, rs2_data, br_less, br_equal);

        // Test Case 5: Signed comparison, rs1_data > rs2_data
        rs1_data = 32'hFFFFFFFA; // -6 in signed 32-bit
        rs2_data = 32'hFFFFFFF5; // -11 in signed 32-bit
        br_un = 1'b0;
        #10;
        $display("%t\t %b\t %h\t %h\t %b\t %b", $time, br_un, rs1_data, rs2_data, br_less, br_equal);

        // Test Case 6: Unsigned comparison, rs1_data < rs2_data (different MSB)
        rs1_data = 32'hFFFFFFF4; // Max positive signed int
        rs2_data = 32'hFFFFFF9D; // Min negative signed int (MSB = 1)
        br_un = 1'b1;
        #10;
        $display("%t\t %b\t %h\t %h\t %b\t %b", $time, br_un, rs1_data, rs2_data, br_less, br_equal);

        // Test Case 7: Unsigned comparison, rs1_data > rs2_data (different MSB)
        rs1_data = 32'h80000000; // Min negative signed int (MSB = 1)
        rs2_data = 32'h7FFFFFFF; // Max positive signed int
        br_un = 1'b1;
        #10;
        $display("%t\t %b\t %h\t %h\t %b\t %b", $time, br_un, rs1_data, rs2_data, br_less, br_equal);

        // Finish simulation
        $stop;
    end

endmodule
