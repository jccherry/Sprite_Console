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
    reg sw;
    reg snes_data_in;
    wire cathode_data_out;
    wire enabled_segment;
    wire snes_clk;
    wire snes_latch;
    wire snes_data_out;
    wire hsync;
    wire vsync;
    wire R;
    wire G;
    wire B;
    
    
    top atop(
    sys_clk,
    sw,
    snes_data_in,
    cathode_data_out,
    enabled_segment,
    snes_clk,
    snes_latch,
    snes_data_out,
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
    
    initial begin
        sw = 0;
        snes_data_in = 0;
    end


endmodule
