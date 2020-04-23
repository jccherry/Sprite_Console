`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2020 02:31:57 PM
// Design Name: 
// Module Name: rgb_slicer
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


module rgb_slicer(
    input [11:0] RGB,
    output [3:0] R,
    output [3:0] G,
    output [3:0] B
    );
    
    assign R = RGB[11:8];
    assign G = RGB[7:4];
    assign B = RGB[3:0];
endmodule
