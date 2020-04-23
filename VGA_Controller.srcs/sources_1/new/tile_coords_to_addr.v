`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2020 01:08:33 PM
// Design Name: 
// Module Name: tile_coords_to_addr
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


module tile_coords_to_addr(
    input [7:0] tile_x,
    input [4:0] tile_y,
    output [12:0] disp_addr
    );
    
    assign disp_addr = tile_y*160+tile_x;
endmodule
