package shift_function;
    function logic [31:0] sll (
        input logic [31:0] operand_a,
        input logic [4:0] shift_amount
    );
        logic [31:0] shift_result;

        case (shift_amount)
            5'd0:  shift_result = operand_a;
            5'd1:  shift_result = {operand_a[30:0], 1'b0};
            5'd2:  shift_result = {operand_a[29:0], 2'b00};
            5'd3:  shift_result = {operand_a[28:0], 3'b000};
            5'd4:  shift_result = {operand_a[27:0], 4'b0000};
            5'd5:  shift_result = {operand_a[26:0], 5'b00000};
            5'd6:  shift_result = {operand_a[25:0], 6'b000000};
            5'd7:  shift_result = {operand_a[24:0], 7'b0000000};
            5'd8:  shift_result = {operand_a[23:0], 8'b00000000};
            5'd9:  shift_result = {operand_a[22:0], 9'b000000000};
            5'd10: shift_result = {operand_a[21:0], 10'b0000000000};
            5'd11: shift_result = {operand_a[20:0], 11'b00000000000};
            5'd12: shift_result = {operand_a[19:0], 12'b000000000000};
            5'd13: shift_result = {operand_a[18:0], 13'b0000000000000};
            5'd14: shift_result = {operand_a[17:0], 14'b00000000000000};
            5'd15: shift_result = {operand_a[16:0], 15'b000000000000000};
            5'd16: shift_result = {operand_a[15:0], 16'b0000000000000000};
            5'd17: shift_result = {operand_a[14:0], 17'b00000000000000000};
            5'd18: shift_result = {operand_a[13:0], 18'b000000000000000000};
            5'd19: shift_result = {operand_a[12:0], 19'b0000000000000000000};
            5'd20: shift_result = {operand_a[11:0], 20'b00000000000000000000};
            5'd21: shift_result = {operand_a[10:0], 21'b000000000000000000000};
            5'd22: shift_result = {operand_a[9:0], 22'b0000000000000000000000};
            5'd23: shift_result = {operand_a[8:0], 23'b00000000000000000000000};
            5'd24: shift_result = {operand_a[7:0], 24'b000000000000000000000000};
            5'd25: shift_result = {operand_a[6:0], 25'b0000000000000000000000000};
            5'd26: shift_result = {operand_a[5:0], 26'b00000000000000000000000000};
            5'd27: shift_result = {operand_a[4:0], 27'b000000000000000000000000000};
            5'd28: shift_result = {operand_a[3:0], 28'b0000000000000000000000000000};
            5'd29: shift_result = {operand_a[2:0], 29'b00000000000000000000000000000};
            5'd30: shift_result = {operand_a[1:0], 30'b000000000000000000000000000000};
            5'd31: shift_result = {operand_a[0],   31'b0000000000000000000000000000000};
            default: shift_result = 32'b0;
        endcase

        return shift_result;
    endfunction

		 function logic [31:0] srl (
        input logic [31:0] operand_a,
        input logic [4:0] shift_amount
    );
        logic [31:0] shift_result;
        case (shift_amount)
            5'd0:  shift_result = operand_a;
            5'd1:  shift_result = {1'b0, operand_a[31:1]};
            5'd2:  shift_result = {2'b00, operand_a[31:2]};
            5'd3:  shift_result = {3'b000, operand_a[31:3]};
            5'd4:  shift_result = {4'b0000, operand_a[31:4]};
            5'd5:  shift_result = {5'b00000, operand_a[31:5]};
            5'd6:  shift_result = {6'b000000, operand_a[31:6]};
            5'd7:  shift_result = {7'b0000000, operand_a[31:7]};
            5'd8:  shift_result = {8'b00000000, operand_a[31:8]};
            5'd9:  shift_result = {9'b000000000, operand_a[31:9]};
            5'd10: shift_result = {10'b0000000000, operand_a[31:10]};
            5'd11: shift_result = {11'b00000000000, operand_a[31:11]};
            5'd12: shift_result = {12'b000000000000, operand_a[31:12]};
            5'd13: shift_result = {13'b0000000000000, operand_a[31:13]};
            5'd14: shift_result = {14'b00000000000000, operand_a[31:14]};
            5'd15: shift_result = {15'b000000000000000, operand_a[31:15]};
            5'd16: shift_result = {16'b0000000000000000, operand_a[31:16]};
            5'd17: shift_result = {17'b00000000000000000, operand_a[31:17]};
            5'd18: shift_result = {18'b000000000000000000, operand_a[31:18]};
            5'd19: shift_result = {19'b0000000000000000000, operand_a[31:19]};
            5'd20: shift_result = {20'b00000000000000000000, operand_a[31:20]};
            5'd21: shift_result = {21'b000000000000000000000, operand_a[31:21]};
            5'd22: shift_result = {22'b0000000000000000000000, operand_a[31:22]};
            5'd23: shift_result = {23'b00000000000000000000000, operand_a[31:23]};
            5'd24: shift_result = {24'b000000000000000000000000, operand_a[31:24]};
            5'd25: shift_result = {25'b0000000000000000000000000, operand_a[31:25]};
            5'd26: shift_result = {26'b00000000000000000000000000, operand_a[31:26]};
            5'd27: shift_result = {27'b000000000000000000000000000, operand_a[31:27]};
            5'd28: shift_result = {28'b0000000000000000000000000000, operand_a[31:28]};
            5'd29: shift_result = {29'b00000000000000000000000000000, operand_a[31:29]};
            5'd30: shift_result = {30'b000000000000000000000000000000, operand_a[31:30]};
            5'd31: shift_result = {31'b0000000000000000000000000000000, operand_a[31]};
            default: shift_result = 32'b0;
        endcase
        return shift_result;
    endfunction
	 
		 function logic [31:0] sra (
        input logic [31:0] operand_a,
        input logic [4:0] shift_amount
    );
        logic [31:0] shift_result;
        if (operand_a[31]) begin
            case (shift_amount)
                5'd0:  shift_result = operand_a;
                5'd1:  shift_result = {1'b1, operand_a[31:1]};
                5'd2:  shift_result = {2'b11, operand_a[31:2]};
                5'd3:  shift_result = {3'b111, operand_a[31:3]};
                5'd4:  shift_result = {4'b1111, operand_a[31:4]};
                5'd5:  shift_result = {5'b11111, operand_a[31:5]};
                5'd6:  shift_result = {6'b111111, operand_a[31:6]};
                5'd7:  shift_result = {7'b1111111, operand_a[31:7]};
                5'd8:  shift_result = {8'b11111111, operand_a[31:8]};
                5'd9:  shift_result = {9'b111111111, operand_a[31:9]};
                5'd10: shift_result = {10'b1111111111, operand_a[31:10]};
                5'd11: shift_result = {11'b11111111111, operand_a[31:11]};
                5'd12: shift_result = {12'b111111111111, operand_a[31:12]};
                5'd13: shift_result = {13'b1111111111111, operand_a[31:13]};
                5'd14: shift_result = {14'b11111111111111, operand_a[31:14]};
                5'd15: shift_result = {15'b111111111111111, operand_a[31:15]};
                5'd16: shift_result = {16'b1111111111111111, operand_a[31:16]};
                5'd17: shift_result = {17'b11111111111111111, operand_a[31:17]};
                5'd18: shift_result = {18'b111111111111111111, operand_a[31:18]};
                5'd19: shift_result = {19'b1111111111111111111, operand_a[31:19]};
                5'd20: shift_result = {20'b11111111111111111111, operand_a[31:20]};
                5'd21: shift_result = {21'b111111111111111111111, operand_a[31:21]};
                5'd22: shift_result = {22'b1111111111111111111111, operand_a[31:22]};
                5'd23: shift_result = {23'b11111111111111111111111, operand_a[31:23]};
                5'd24: shift_result = {24'b111111111111111111111111, operand_a[31:24]};
                5'd25: shift_result = {25'b1111111111111111111111111, operand_a[31:25]};
                5'd26: shift_result = {26'b11111111111111111111111111, operand_a[31:26]};
                5'd27: shift_result = {27'b111111111111111111111111111, operand_a[31:27]};
                5'd28: shift_result = {28'b1111111111111111111111111111, operand_a[31:28]};
                5'd29: shift_result = {29'b11111111111111111111111111111, operand_a[31:29]};
                5'd30: shift_result = {30'b111111111111111111111111111111, operand_a[31:30]};
                5'd31: shift_result = {31'b1111111111111111111111111111111, operand_a[31]};
                default: shift_result = 32'b0;
            endcase
        end else begin
            case (shift_amount)
                5'd0:  shift_result = operand_a;
                5'd1:  shift_result = {1'b0, operand_a[31:1]};
                5'd2:  shift_result = {2'b00, operand_a[31:2]};
                5'd3:  shift_result = {3'b000, operand_a[31:3]};
                5'd4:  shift_result = {4'b0000, operand_a[31:4]};
                5'd5:  shift_result = {5'b00000, operand_a[31:5]};
                5'd6:  shift_result = {6'b000000, operand_a[31:6]};
                5'd7:  shift_result = {7'b0000000, operand_a[31:7]};
                5'd8:  shift_result = {8'b00000000, operand_a[31:8]};
                5'd9:  shift_result = {9'b000000000, operand_a[31:9]};
                5'd10: shift_result = {10'b0000000000, operand_a[31:10]};
                5'd11: shift_result = {11'b00000000000, operand_a[31:11]};
                5'd12: shift_result = {12'b000000000000, operand_a[31:12]};
                5'd13: shift_result = {13'b0000000000000, operand_a[31:13]};
                5'd14: shift_result = {14'b00000000000000, operand_a[31:14]};
                5'd15: shift_result = {15'b000000000000000, operand_a[31:15]};
                5'd16: shift_result = {16'b0000000000000000, operand_a[31:16]};
                5'd17: shift_result = {17'b00000000000000000, operand_a[31:17]};
                5'd18: shift_result = {18'b000000000000000000, operand_a[31:18]};
                5'd19: shift_result = {19'b0000000000000000000, operand_a[31:19]};
                5'd20: shift_result = {20'b00000000000000000000, operand_a[31:20]};
                5'd21: shift_result = {21'b000000000000000000000, operand_a[31:21]};
                5'd22: shift_result = {22'b0000000000000000000000, operand_a[31:22]};
                5'd23: shift_result = {23'b00000000000000000000000, operand_a[31:23]};
                5'd24: shift_result = {24'b000000000000000000000000, operand_a[31:24]};
                5'd25: shift_result = {25'b0000000000000000000000000, operand_a[31:25]};
                5'd26: shift_result = {26'b00000000000000000000000000, operand_a[31:26]};
                5'd27: shift_result = {27'b000000000000000000000000000, operand_a[31:27]};
                5'd28: shift_result = {28'b0000000000000000000000000000, operand_a[31:28]};
                5'd29: shift_result = {29'b00000000000000000000000000000, operand_a[31:29]};
                5'd30: shift_result = {30'b000000000000000000000000000000, operand_a[31:30]};
                5'd31: shift_result = {31'b0000000000000000000000000000000, operand_a[31]};
                default: shift_result = 32'b0;
            endcase
        end
		  return shift_result;
    endfunction
endpackage
