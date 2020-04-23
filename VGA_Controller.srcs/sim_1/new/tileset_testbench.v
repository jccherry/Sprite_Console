`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2020 10:34:40 PM
// Design Name: 
// Module Name: tileset_testbench
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


module tileset_testbench();

    reg clk;
    reg wr_en;
    reg [6:0] tile_address;
    reg [7:0] pixel_address;
    reg [11:0] color_in;
    wire [11:0] rgb_out;

    tileset_memory mem(
    clk,
    wr_en,
    tile_address,
    pixel_address,
    color_in,
    rgb_out);
    
    initial begin
        clk = 1;
        forever #5
        clk = ~clk;
    end
    
    initial begin
        tile_address = 3;
        pixel_address = 1;
        wr_en = 0;
        color_in = 0;
        #10
        pixel_address = 255;
        #10
        pixel_address = 35;
        #10
        pixel_address = 128;
        #10
        tile_address = 23;
        pixel_address = 255;
        #10
        pixel_address = 35;
        #10
        pixel_address = 128;
    end

endmodule
