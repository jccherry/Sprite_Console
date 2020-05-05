`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2020 05:03:30 PM
// Design Name: 
// Module Name: alu_regfile
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

module reg_file(
    input wr_en,
    input [16:0] wr_data,
    input [4:0] wr_addr,
    input rst,
    input clk,
    input [4:0] rd0_addr,
    input [4:0] rd1_addr,
    output [16:0] rd0_data,
    output [16:0] rd1_data);
    
    
    reg [17:0] registers[31:0];
    
    integer i;

    initial begin
    
        for (i = 0; i < 27; i=i+1) 
                begin
                    registers[i] = 0;
                end
                
        registers[27] = 16'h7864; //controller 0 mem offset
        registers[28] = 16'h4000; //start of PPU Register offset
        registers[29] = 16'h4021; //start of BG Display Table
        registers[30] = 16'h52e2; //start of FG Display Table
        registers[31] = 16'h65a3; //start of ov display Table
    end
    
    
    always @(negedge clk) //register write on enable and negedge of clock
    begin
        if (wr_en)
        begin
            registers[wr_addr] = wr_data;
        end
        if (rst)
        begin
            for (i = 0; i < 32; i=i+1) 
                begin
                    registers[i] = 0;
                end
        end
    end
    
    assign rd0_data = registers[rd0_addr];
	assign rd1_data = registers[rd1_addr];
    
endmodule

module sprite_alu(
    input [15:0] a,
    input [15:0] b,
    input [3:0] alu_op,
    output reg [15:0] out,
    output reg ovf,
    output reg take_branch
    );
    
    reg [16:0] sum;
    
    always @(*)
    begin
    case (alu_op)
        4'b0000 :   begin //add
                    sum = a + b;
                    out = sum[15:0];
                    ovf = sum[16];
                    take_branch = 1'b0;
                    end
        4'b0001 :   begin //subtract
                    out = a - b;
                    ovf <= (a[15] == b[15]) && (a[15] != out[15]);
                    take_branch = 1'b0;
                    end
        4'b0010 :   begin //multiply
                    out = a * b;
                    ovf = 1'b0;
                    take_branch = 1'b0;
                    end
        4'b0011 :   begin //divide
                    if (b == 0)
                        begin
                        out = 0;
                        ovf = 1'b1;
                        take_branch = 1'b0;
                        end
                    else 
                        begin
                        out = a / b;
                        ovf = 1'b0;
                        take_branch = 1'b0;
                        end
                    end
        4'b0100 :   begin //modulo
                    out = a % b;
                    ovf = 1'b0;
                    take_branch = 1'b0;
                    end
        4'b0101 :   begin //left logical shift
                    out = a << b;
                    ovf = 1'b0;
                    take_branch = 1'b0;
                    end
        4'b0110 :   begin //right arithmetic shift
                    out = a >>> b;
                    ovf = 1'b0;
                    take_branch = 1'b0;
                    end
        4'b0111 :   begin //bitwise not
                    out = ~b;
                    ovf = 1'b0;
                    take_branch = 1'b0;
                    end
        4'b1000 :   begin //bitwise and
                    out = a & b;
                    ovf = 1'b0;
                    take_branch = 1'b0;
                    end
        4'b1001 :   begin //bitwise or
                    out = a | b;
                    ovf = 1'b0;
                    take_branch = 1'b0;
                    end
        4'b1010 :   begin //jump if equal
                    out = 0;
                    ovf = 1'b0;
                    take_branch = a == b;
                    end
        4'b1011 :   begin //jump if not equal
                    out = 0;
                    ovf = 1'b0;
                    take_branch = a != b;
                    end
        4'b1100 :   begin //jump if less than
                    out = 0;
                    ovf = 1'b0;
                    take_branch = a < b;
                    end
        4'b1101 :   begin //jump is less than or equal
                    out = 0;
                    ovf = 1'b0;
                    take_branch = a <= b;
                    end
        4'b1110 :   begin //jump if greater than
                    out = 0;
                    ovf = 1'b0;
                    take_branch = a > b;
                    end
        4'b1111 :   begin //jump if greater than or equal
                    out = 0;
                    ovf = 1'b0;
                    take_branch = a >= b;
                    end
    endcase
    end
    
endmodule

module mux_16x2to1(
    input [15:0] a,
    input [15:0] b,
	input sel,
	output [15:0] y);
	
	
	assign y = sel ? b : a;
endmodule


module mux_17x2to1(
    input [16:0] a,
    input [16:0] b,
	input sel,
	output [16:0] y);
	
	
	assign y = sel ? b : a;
endmodule


