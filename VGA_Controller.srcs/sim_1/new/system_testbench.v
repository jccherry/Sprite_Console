`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2020 05:57:54 PM
// Design Name: 
// Module Name: system_testbench
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


module system_testbench();

    reg sys_clk;
    wire hsync;
    wire vsync;
    wire [3:0] R;
    wire [3:0] G;
    wire [3:0] B;
    

    system_top top(
    sys_clk,
    hsync,
    vsync,
    R,
    G,
    B
    );
    
    initial begin
    sys_clk = 1;
    forever #1.25
    sys_clk = ~sys_clk;
    end

endmodule
