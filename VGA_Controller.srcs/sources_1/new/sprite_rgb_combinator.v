`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2020 01:26:21 PM
// Design Name: 
// Module Name: sprite_rgb_combinator
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


module sprite_rgb_combinator(
    input [11:0] sprite1_rgb,
    input [11:0] sprite2_rgb,
    input [11:0] sprite3_rgb,
    input [11:0] sprite4_rgb,
    input [11:0] sprite5_rgb,
    input [11:0] sprite6_rgb,
    input [11:0] sprite7_rgb,
    output [11:0] sprite_rgb_out
    );
    
    wire [11:0] combo_1_2;
    wire [11:0] combo_3_4;
    wire [11:0] combo_5_6;
    wire [11:0] combo_1234;
    wire [11:0] combo_567;
    
    assign combo_1_2 = (sprite1_rgb == 12'h0f0) ? sprite2_rgb : sprite1_rgb;
    assign combo_3_4 = (sprite3_rgb == 12'h0f0) ? sprite4_rgb : sprite3_rgb;
    assign combo_5_6 = (sprite5_rgb == 12'h0f0) ? sprite6_rgb : sprite5_rgb;
    
    assign combo_1234 = (combo_1_2 == 12'h0f0) ? combo_3_4 : combo_1_2;
    assign combo_567 = (combo_5_6 == 12'h0f0) ? sprite7_rgb : combo_5_6;
    
    assign sprite_rgb_out = (combo_1234 == 12'h0f0) ? combo_567 : combo_1234;
    
endmodule
