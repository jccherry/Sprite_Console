`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2020 01:13:03 PM
// Design Name: 
// Module Name: instruction_decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module instruction_decoder(
    input [31:0] instruction,
    //register read addresses (and write with control signal)
    output [4:0] read_addr1,
    output [4:0] read_addr2,
    //immediate instruction
    output [15:0] instr_i,
    //control signals
    output reg [3:0] alu_op,
    output reg alu_src_1,
    output reg alu_src_2,
    output reg reg_write,
    output reg mem_write,
    output reg write_loc,
    output reg mem_to_reg,
    //debug output
    output [5:0] opcode,
    output reg wvb
    );
    
    assign opcode = instruction[31:26];
    assign read_addr1 = instruction[25:21];
    assign read_addr2 = instruction[20:16];
    assign instr_i = instruction[15:0];
    
    always @(*)
    begin
        alu_op = 0;
        alu_src_1 = 0;
        alu_src_2 = 0;
        reg_write = 0;
        mem_write = 0;
        write_loc = 0;
        mem_to_reg = 0;
        wvb = 0;
        case (opcode)
        6'b000000   :   begin //add
                            alu_op = 0;
                            alu_src_1 = 0;
                            alu_src_2 = 0;
                            reg_write = 1;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        6'b000001   :   begin //sub
                            alu_op = 1;
                            alu_src_1 = 0;
                            alu_src_2 = 0;
                            reg_write = 1;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        6'b000010   :   begin //mul
                            alu_op = 2;
                            alu_src_1 = 0;
                            alu_src_2 = 0;
                            reg_write = 1;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
		6'b000011   :   begin //div
		                    alu_op = 3;
                            alu_src_1 = 0;
                            alu_src_2 = 0;
                            reg_write = 1;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        6'b000100   :   begin //mod
                            alu_op = 4;
                            alu_src_1 = 0;
                            alu_src_2 = 0;
                            reg_write = 1;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        6'b000101   :   begin //and
                            alu_op = 8;
                            alu_src_1 = 0;
                            alu_src_2 = 0;
                            reg_write = 1;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
		6'b000110   :   begin //or
		                    alu_op = 9;
                            alu_src_1 = 0;
                            alu_src_2 = 0;
                            reg_write = 1;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        6'b000111   :   begin //addi
                            alu_op = 0;
                            alu_src_1 = 0;
                            alu_src_2 = 1;
                            reg_write = 1;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        6'b001000   :   begin //subi
                            alu_op = 1;
                            alu_src_1 = 0;
                            alu_src_2 = 1;
                            reg_write = 1;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
		6'b001001   :   begin //muli
		                    alu_op = 2;
                            alu_src_1 = 0;
                            alu_src_2 = 1;
                            reg_write = 1;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        6'b001010   :   begin //divi
                            alu_op = 3;
                            alu_src_1 = 0;
                            alu_src_2 = 1;
                            reg_write = 1;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        6'b001011   :   begin //modi
                            alu_op = 4;
                            alu_src_1 = 0;
                            alu_src_2 = 1;
                            reg_write = 1;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
		6'b001100   :   begin //andi
		                    alu_op = 8;
                            alu_src_1 = 0;
                            alu_src_2 = 1;
                            reg_write = 1;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        6'b001101   :   begin //ori
                            alu_op = 9;
                            alu_src_1 = 0;
                            alu_src_2 = 1;
                            reg_write = 1;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        6'b001110   :   begin //load
                            alu_op = 0;
                            alu_src_1 = 0;
                            alu_src_2 = 1;
                            reg_write = 1;
                            mem_write = 0;
                            write_loc = 1;
                            mem_to_reg = 1;
                            wvb = 0;
                        end
		6'b001111   :   begin //store
		                    alu_op = 0;
                            alu_src_1 = 0;
                            alu_src_2 = 1;
                            reg_write = 0;
                            mem_write = 1;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
		6'b010000   :   begin //mov
		                    alu_op = 0;
                            alu_src_1 = 1;
                            alu_src_2 = 0;
                            reg_write = 1;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        6'b010001   :   begin //movi
                            alu_op = 0;
                            alu_src_1 = 1;
                            alu_src_2 = 1;
                            reg_write = 1;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        6'b010010   :   begin //sra
                            alu_op = 6;
                            alu_src_1 = 0;
                            alu_src_2 = 0;
                            reg_write = 1;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
		6'b010011   :   begin //sll
		                    alu_op = 5;
                            alu_src_1 = 0;
                            alu_src_2 = 0;
                            reg_write = 1;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        6'b010100   :   begin //srai
                            alu_op = 6;
                            alu_src_1 = 0;
                            alu_src_2 = 1;
                            reg_write = 1;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        6'b010101   :   begin //slli
                            alu_op = 5;
                            alu_src_1 = 0;
                            alu_src_2 = 1;
                            reg_write = 1;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        6'b010110   :   begin //inv
                            alu_op = 7;
                            alu_src_1 = 1;
                            alu_src_2 = 0;
                            reg_write = 1;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        6'b010111   :   begin //invi
                            alu_op = 7;
                            alu_src_1 = 1;
                            alu_src_2 = 1;
                            reg_write = 1;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        6'b011000   :   begin //j (to accomplish, load identical register and je instruction)
                            alu_op = 10;
                            alu_src_1 = 0;
                            alu_src_2 = 0;
                            reg_write = 0;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        6'b011001   :   begin //je
                            alu_op = 10;
                            alu_src_1 = 0;
                            alu_src_2 = 0;
                            reg_write = 0;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        6'b011010   :   begin //jne
                            alu_op = 11;
                            alu_src_1 = 0;
                            alu_src_2 = 0;
                            reg_write = 0;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        6'b011011   :   begin //jl
                            alu_op = 12;
                            alu_src_1 = 0;
                            alu_src_2 = 0;
                            reg_write = 0;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        6'b011100   :   begin //jle
                            alu_op = 13;
                            alu_src_1 = 0;
                            alu_src_2 = 0;
                            reg_write = 0;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        6'b011101   :   begin //jg
                            alu_op = 14;
                            alu_src_1 = 0;
                            alu_src_2 = 0;
                            reg_write = 0;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        6'b011110   :   begin //jge
                            alu_op = 15;
                            alu_src_1 = 0;
                            alu_src_2 = 0;
                            reg_write = 0;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        6'b011111   :   begin //wvb
                            alu_op = 0;
                            alu_src_1 = 0;
                            alu_src_2 = 0;
                            reg_write = 0;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 1;
                        end
        default     :   begin
                            alu_op = 0;
                            alu_src_1 = 0;
                            alu_src_2 = 0;
                            reg_write = 0;
                            mem_write = 0;
                            write_loc = 0;
                            mem_to_reg = 0;
                            wvb = 0;
                        end
        
        endcase
        
    end
endmodule
