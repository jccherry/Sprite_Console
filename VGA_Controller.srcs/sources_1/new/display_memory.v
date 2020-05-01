`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2020 11:28:40 AM
// Design Name: 
// Module Name: display_memory
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


module display_memory 
    #(parameter data_file = "")
    (
    input clk,
    input write_clk,
    input wr_en,
    input [6:0] write_tile,
    input [12:0] write_addr,
    input [12:0] read_addr,
    output reg [6:0] tile_addr
    );
    
    reg [6:0] address_table [4799:0];
    integer i;
    
    initial begin
        tile_addr = 0;
        $readmemb(data_file, address_table);      
    end
    
    always @(posedge clk)
    begin
        tile_addr = address_table[read_addr];
    end
    
    always @(posedge write_clk)
    begin
        if (wr_en)
            address_table[write_addr] = write_tile;
    end
    
endmodule
