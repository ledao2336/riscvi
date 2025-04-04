`timescale 1ps/1ps
module imme_gen_tb;
    logic [31:0] ins;         
    logic [31:0] out_ins;     
    imme_gen dut (
        .ins(ins),
        .out_ins(out_ins)
    );
    initial begin
        $display("Time\t\tInstruction\t\t\tImmediate Output");
        $display("--------------------------------------------------------------------");

        // Case I-type instruction
        ins = 32'b00000000000100000000000110010011; //0010011
        #10;
        $display("%0t\t%b\t%b", $time, ins, out_ins);

        // Case S-type instruction
        ins = 32'b11111110000100001000001010100011; //0100011
        #10;
        $display("%0t\t%b\t%b", $time, ins, out_ins); 

        // Case B-type instruction
        ins = 32'b11111110000000001111011001100011; //1100011
        #10;
        $display("%0t\t%b\t%b", $time, ins, out_ins);

        // Case U-type instruction (lui)
        ins = 32'b00000000111111110000000010110111; //0110111
        #10;
        $display("%0t\t%b\t%b", $time, ins, out_ins);

        // Case U-type instruction (auipc)
        ins = 32'b00000000111111110000000010010111; //0010111
        #10;
        $display("%0t\t%b\t%b", $time, ins, out_ins);

        // Case J-type instruction
        ins = 32'b00000000111111111111000111101111; //1101111
        #10;
        $display("%0t\t%b\t%b", $time, ins, out_ins);

        // Test Default (unsupported opcode)
        ins = 32'h00000033; // Default case
        #10;
        $display("%0t\t%b\t%b", $time, ins, out_ins);
        $stop;
    end

endmodule
