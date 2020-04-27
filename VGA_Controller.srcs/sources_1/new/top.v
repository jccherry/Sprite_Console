`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2020 02:38:50 PM
// Design Name: 
// Module Name: top
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


module top(
    input sys_clk,
    input [15:0] sw,
    input snes_data_in,
    output [7:0] cathode_data_out,
    output [3:0] enabled_segment,
    output snes_clk,
    output snes_latch,
    output [11:0] snes_data_out,
    output hsync,
    output vsync,
    output [3:0] R,
    output [3:0] G,
    output [3:0] B
    );

    wire vblank;
    
    clock_divider div(
    sys_clk,
    clk_25MHz
    );
    
    wire [11:0] snes_data;
    reg [11:0] snes_data_reg;
    
    snes_controller ctrl(
    sys_clk,
    sw[15],
    snes_data_in,
    snes_clk,
    snes_latch,
    snes_data
    );

    
    assign snes_data_out = snes_data_reg;
    
    always@(posedge vblank)
    begin
        snes_data_reg = snes_data;

   end
    
    reg [15:0] write_data;
    reg [15:0] seg_data;
    
    initial begin
        write_data = 0;
        seg_data = 0;
    end
    
    
    
    always@(posedge vblank)
    begin
        if (snes_data_out[0])
            write_data = write_data+1;
        else if (snes_data_out[1])
            write_data = write_data-1;
    end
    
    
    
    always @(posedge vblank)
    begin
        seg_data = write_data;
    end
    
    seven_segment_scanner seg(
    sys_clk,
    seg_data,
    4'b0000,
    cathode_data_out,
    enabled_segment
    );
    
    ppu ppu(
    clk_25MHz,
    sw[4:0],
    0,
    sw[12:5],
    sw[13],
    0,
    hsync,
    vsync,
    vblank,
    R,
    G,
    B
    );
    
endmodule




