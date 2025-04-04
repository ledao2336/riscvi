module lsu(
    input  logic        i_clk,          
    input  logic        i_rst,          
    input  logic [31:0] i_ls_addr, 
    input  logic [31:0] i_st_data, 
    input  logic        i_lsu_wren,      
    input  logic [31:0] ins, // Instruction
    input  logic [31:0] i_io_sw,      
    input  logic [31:0] i_io_btn,

    output logic [31:0] o_ld_data, 
    output logic [31:0] LEDR,   
    output logic [31:0] o_io_ledg,   
    output logic [31:0] o_io_hex0_7, 
    output logic [31:0] o_io_lcd
);
    logic [31:0] data_memory [0:2047];
    logic [31:0] addr;
	 
    always_comb begin
        addr = i_ls_addr - 32'h2000;
    end

    always_ff @(posedge i_clk or negedge i_rst) begin
        if (!i_rst) begin
            for (int i = 0; i < 2048; i++) 
                data_memory[i] <= 32'b0;
            LEDR   <= 32'b0;
            o_io_ledg   <= 32'b0;
            o_io_hex0_7 <= 32'b0;
            o_io_lcd    <= 32'b0;
        end 
        else if (i_lsu_wren) begin
            case (i_ls_addr[31:12])
                20'b000000000010, // 0x2000
                20'b000000000011: // 0x3000
                begin
                    case (ins[6:0])
                        7'b0100011: begin // STORE
                            case (ins[14:12])
                                3'b010: // SW
                                    data_memory[addr[12:2]] <= i_st_data;
                                3'b000: // SB
                                    case (i_ls_addr[1:0])
                                        2'b00: data_memory[addr[12:2]][7:0]   <= i_st_data[7:0];
                                        2'b01: data_memory[addr[12:2]][15:8]  <= i_st_data[7:0];
                                        2'b10: data_memory[addr[12:2]][23:16] <= i_st_data[7:0];
                                        2'b11: data_memory[addr[12:2]][31:24] <= i_st_data[7:0];
                                        default: ; 
                                    endcase
                                3'b001: // SH
                                    case (i_ls_addr[1])
                                        1'b0: data_memory[addr[12:2]][15:0]  <= i_st_data[15:0];
                                        1'b1: data_memory[addr[12:2]][31:16] <= i_st_data[15:0];
                                        default: ; 
                                    endcase
                                default: ; 
                            endcase
                        end
                        default: ; 
                    endcase
                end
                default: ; 
            endcase

            case (i_ls_addr)
                // Red LED (0x7000 - 0x700F)
                32'h00007000, 32'h00007004, 32'h00007008, 32'h0000700C: 
                    LEDR = i_st_data;
                // Green LED (0x7010 - 0x701F)
                32'h00007010, 32'h00007014, 32'h00007018, 32'h0000701C: 
                    o_io_ledg = i_st_data;
                // LED - 7 Seg (0x7020 - 0x7027)
                32'h00007020, 32'h00007024: 
                    o_io_hex0_7 = i_st_data;
                // LCD (0x7030 - 0x703F)
                32'h00007030, 32'h00007034, 32'h00007038, 32'h0000703C: 
                    o_io_lcd = i_st_data;
                default: ; 
            endcase
        end
    end

    always_comb begin
        o_ld_data = 32'b0; 

        case (i_ls_addr[31:12])  
            20'b000000000010,  // 0x2000
            20'b000000000011:  // 0x3000 
            begin
                case (ins[6:0])
                    7'b0000011: begin // LOAD
                        case (ins[14:12])
                            3'b010: // LW 
                                o_ld_data = data_memory[addr[12:2]];
                            3'b000: // LB
                                case (i_ls_addr[1:0])
                                    2'b00: o_ld_data = {{24{data_memory[addr[12:2]][7]}}, data_memory[addr[12:2]][7:0]};
                                    2'b01: o_ld_data = {{24{data_memory[addr[12:2]][15]}}, data_memory[addr[12:2]][15:8]};
                                    2'b10: o_ld_data = {{24{data_memory[addr[12:2]][23]}}, data_memory[addr[12:2]][23:16]};
                                    2'b11: o_ld_data = {{24{data_memory[addr[12:2]][31]}}, data_memory[addr[12:2]][31:24]};
                                    default: o_ld_data = 32'b0; // Trường hợp không hợp lệ
                                endcase
                            3'b100: // LBU
                                case (i_ls_addr[1:0])
                                    2'b00: o_ld_data = {24'b0, data_memory[addr[12:2]][7:0]};
                                    2'b01: o_ld_data = {24'b0, data_memory[addr[12:2]][15:8]};
                                    2'b10: o_ld_data = {24'b0, data_memory[addr[12:2]][23:16]};
                                    2'b11: o_ld_data = {24'b0, data_memory[addr[12:2]][31:24]};
                                    default: o_ld_data = 32'b0; // Trường hợp không hợp lệ
                                endcase
                            3'b001: // LH
                                case (i_ls_addr[1])
                                    1'b0: o_ld_data = {{16{data_memory[addr[12:2]][15]}}, data_memory[addr[12:2]][15:0]};
                                    1'b1: o_ld_data = {{16{data_memory[addr[12:2]][31]}}, data_memory[addr[12:2]][31:16]};
                                    default: o_ld_data = 32'b0; 
                                endcase
                            default: o_ld_data = 32'b0; 
                        endcase
                    end
                    default: o_ld_data = 32'b0; 
                endcase
            end
            default: o_ld_data = 32'b0; 
        endcase

        // SW-READ
        case (i_ls_addr)
            32'h00007800, 32'h00007804, 32'h00007808, 32'h0000780C: 
                o_ld_data = i_io_sw;
            default:  o_ld_data = 0; 
        endcase

        // BTN_READ
        case (i_ls_addr)
            32'h00007810, 32'h00007814, 32'h00007818, 32'h0000781C: 
                o_ld_data = i_io_btn;
            default: o_ld_data = 0; 
        endcase
    end
endmodule