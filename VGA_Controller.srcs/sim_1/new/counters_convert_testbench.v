`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2020 01:46:54 PM
// Design Name: 
// Module Name: counters_convert_testbench
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


module counters_convert_testbench();



    reg [9:0] hcounter;
    reg [9:0] vcounter;
    wire [5:0] tile_x;
    wire [4:0] tile_y;
    wire [7:0] pixel_x;
    wire [7:0] pixel_y;
    wire within_bounds;
    
    within_bounds within(
        hcounter,
        vcounter,
        within_bounds);


    counter_to_tables convert(
    hcounter,
    vcounter,
    within_bounds,
    tile_x,
    tile_y,
    pixel_x,
    pixel_y
    );
    
    initial begin
        hcounter = 100;
        vcounter = 45;
        #10
        hcounter = 143;
        vcounter = 34;
        #10
        hcounter = 124;
        vcounter = 34;
        #10
        hcounter = 750;
        vcounter = 450;
        #10
        hcounter = 750;
        vcounter = 449;
        #10
        hcounter = 750;
        vcounter = 447;
        #10
        hcounter = 783;
        vcounter = 514;
        #10
        hcounter = 782;
        vcounter = 513;
        
        
    end

    
endmodule
