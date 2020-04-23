`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2020 04:11:06 PM
// Design Name: 
// Module Name: vblank
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


module vblank(
    input [9:0] vcounter,
    output vblank
    );
    
    assign vblank = (vcounter < 34 || vcounter >= 514) ? 1 : 0;
endmodule
