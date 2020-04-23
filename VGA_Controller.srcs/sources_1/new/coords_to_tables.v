`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2020 01:31:08 PM
// Design Name: 
// Module Name: coords_to_tables
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

module within_bounds(
    input [9:0] hcounter,
    input [9:0] vcounter,
    output within_bounds);
    
    assign within_bounds = hcounter >= 143 && hcounter < 783 && vcounter >= 34 && vcounter < 514;
    
endmodule

module counter_to_tables(
    input [9:0] hcounter,
    input [9:0] vcounter,
    input within_bounds,
    input [10:0] offset,
    output [7:0] tile_x,
    output [4:0] tile_y,
    output [3:0] pixel_x,
    output [3:0] pixel_y
    );
    
    reg [10:0] offset_limited;
    
    initial begin
        offset_limited = 0;
    end
    
    
    always @(*)
    begin
        offset_limited = (offset > 1920) ? 1920 : offset;
    end
    
    //right shift 4 is equivalent to divide by 16
    assign tile_x = (within_bounds) ? ((hcounter - 143 + offset_limited) >> 4) : 0;
    assign tile_y = (within_bounds) ? ((vcounter - 34) >> 4) : 0;
    
    assign pixel_x = (within_bounds) ? (hcounter - 143 + offset_limited) % 16 : 0;
    assign pixel_y = (within_bounds) ? (vcounter - 34) % 16 : 0;
    
endmodule
