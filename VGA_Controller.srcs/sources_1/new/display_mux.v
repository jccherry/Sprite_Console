`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2020 08:22:41 PM
// Design Name: 
// Module Name: display_mux
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


module display_mux(
    input [11:0] in_0,
    input [11:0] in_1,
    input s,
    output [11:0] out
    );
    
    assign out = s ? in_1 : in_0;

endmodule
