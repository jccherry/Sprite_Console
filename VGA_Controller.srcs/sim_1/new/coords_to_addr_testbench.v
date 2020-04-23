`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2020 01:17:42 PM
// Design Name: 
// Module Name: coords_to_addr_testbench
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


module coords_to_addr_testbench();
 
    reg [5:0] tile_x;
    reg [4:0] tile_y;
    wire [10:0] disp_addr;
    
    reg [3:0] pixel_x;
    reg [3:0] pixel_y;
    wire [7:0] pixel_addr;
    

    tile_coords_to_addr tile(
    tile_x,
    tile_y,
    disp_addr
    );

    pixel_coords_to_addr pixel(
    pixel_x,
    pixel_y,
    pixel_addr
    );

    initial begin
        tile_x = 0;
        tile_y = 0;
        pixel_x = 0;
        pixel_y = 0;
        #10
        tile_x = 1;
        pixel_x = 1;
        #10
        tile_y = 29;
        tile_x = 39;
        pixel_x = 15;
        pixel_y = 15;
        #10
        tile_x = 12;
        tile_y = 10;
        pixel_x = 4;
        pixel_y = 10;
        #10
        pixel_x = 8;
        pixel_y = 0;
        tile_x = 23;
        tile_y = 23;
    end

endmodule
