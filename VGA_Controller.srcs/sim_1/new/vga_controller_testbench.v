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
    reg [15:0] sw;
    reg btnU;
    reg btnD;
    reg btnL;
    reg btnR;
    wire [3:0] R;
    wire [3:0] G;
    wire [3:0] B;
    wire hsync, vsync;
    wire [7:0] cathode_data_out;
    wire [3:0] enabled_segment;
    
    
    
    top atop(
    sys_clk,
    sw,
    btnU,
    btnD,
    btnL,
    btnR,
    cathode_data_out,
    enabled_segment,
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
        btnU = 1;
        btnR = 1;
        btnL = 0;
        btnD = 0;
    end


endmodule
