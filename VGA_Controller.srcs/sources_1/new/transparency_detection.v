`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2020 01:02:49 PM
// Design Name: 
// Module Name: transparency_detection
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


module transparency_detection(
    input [11:0] background_rgb,
    input [11:0] foreground_rgb,
    input [11:0] overlay_rgb,
    output [11:0] rgb_out
    );
    
    wire [12:0] overlay_vs_foreground;
    assign overlay_vs_foreground = (overlay_rgb == 12'h0f0) ? foreground_rgb : overlay_rgb;
    assign rgb_out = (overlay_vs_foreground == 12'h0f0) ? background_rgb : overlay_vs_foreground;
    
endmodule
