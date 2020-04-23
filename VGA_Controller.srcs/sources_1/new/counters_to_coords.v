`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2020 12:30:31 PM
// Design Name: 
// Module Name: counters_to_coords
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


module counters_to_coords(
    input [9:0] hcounter,
    input [9:0] vcounter,
    input within_bounds,
    //input [10:0] offset,
    //output [7:0] tile_x,
    //output [4:0] tile_y,
    output [9:0] pixel_x,
    output [8:0] pixel_y
    );
    
    
    assign pixel_x = (within_bounds) ? (hcounter - 143) : 0;
    assign pixel_y = (within_bounds) ? (vcounter - 34) : 0;
    
endmodule