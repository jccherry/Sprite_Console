`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2020 08:32:35 PM
// Design Name: 
// Module Name: program_memory
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


module program_memory
    #(parameter data_file = "")
    (
    input [11:0] addr,
    output [31:0] instruction
    );
    
    reg [31:0] data [4095:0];
    
    initial begin
        $readmemb(data_file, data);
    end
    
    assign instruction = data[addr];
    
endmodule

module program_counter(
    input clk,
    input [11:0] addr_in,
    input take_branch,
    output reg [11:0] program_addr
    );
    
    initial begin
        program_addr = 0;
    end 
    
    always @(negedge clk)
    begin
        if (take_branch)
            program_addr = addr_in;
        else
            program_addr = program_addr+1;
    end
    
    
endmodule

