`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2020 04:33:46 PM
// Design Name: 
// Module Name: vga_controller_testbench
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


module vga_controller_testbench( );


    reg sys_clk;
    wire [3:0] R;
    wire [3:0] G;
    wire [3:0] B;
    wire hsync, vsync;
    
    
    top VGAController(
    sys_clk,
    hsync,
    vsync,
    R,
    G,
    B
    );
    
    initial begin
        sys_clk = 0;
        forever #1.25
        sys_clk = ~sys_clk;
    end


endmodule
