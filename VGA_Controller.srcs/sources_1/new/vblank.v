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
    input [9:0] hcounter,
    output vblank
    );
    
    assign vblank = (vcounter == 514 && hcounter == 783) ? 1 : 0;
endmodule
