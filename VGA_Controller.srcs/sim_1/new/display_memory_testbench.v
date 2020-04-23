`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2020 11:43:52 AM
// Design Name: 
// Module Name: display_memory_testbench
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


module display_memory_testbench();

    reg clk;
    reg wr_en;
    reg [6:0] write_tile;
    reg [10:0] write_addr;
    reg [10:0] read_addr;
    wire [6:0] tile_addr;

display_memory mem(
    clk,
    wr_en,
    write_tile,
    write_addr,
    read_addr,
    tile_addr
    );
    
    initial begin
        clk = 0;
        forever #5
        clk = ~clk;
    end
    
    initial begin
        #5
        wr_en = 0;
        write_tile = 0;
        write_addr = 0;
        read_addr = 0;
        #10
        read_addr = 1;
        #10
        read_addr = 2;
        #10
        read_addr = 35;
        #10
        read_addr = 511;
        #10
        read_addr = 512;
        #10
        wr_en = 1;
        write_tile = 12;
        write_addr = 89;
        read_addr = 0;
        #10
        wr_en = 0;
        read_addr = 89;
        #10
        wr_en = 1;
        write_tile = 90;
        write_addr = 1;
        #10
        wr_en = 0;
        read_addr = 1;
        #10
        read_addr = 89;
        #10
        read_addr = 0;
        write_addr = 0;
        write_tile = 50;
        #10
        wr_en = 1;
        #10
        wr_en = 0;
        
    end
endmodule
