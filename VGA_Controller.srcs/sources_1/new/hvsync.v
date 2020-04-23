`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2020 08:06:51 PM
// Design Name: 
// Module Name: hvsync
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


module hvsync(
    input [9:0] hcounter,
    input [9:0] vcounter,
    output hsync,
    output vsync
    );
    
    assign hsync = (hcounter <= 95) ? 1 : 0;
    assign vsync = (vcounter <= 1) ? 1 : 0;

endmodule
