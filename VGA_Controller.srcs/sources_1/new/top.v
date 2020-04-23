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
    input btnU,
    input btnD,
    input btnL,
    input btnR,
    output [7:0] cathode_data_out,
    output [3:0] enabled_segment,
    output hsync,
    output vsync,
    output [3:0] R,
    output [3:0] G,
    output [3:0] B
    );
    
    reg [9:0] sprite_x;
    reg [8:0] sprite_y;
   
    wire vblank;
    
    initial begin
        sprite_x = 0;
        sprite_y = 0;
    end
    
    always@(posedge vblank)
    begin
        if(btnU && ~btnD)
            sprite_y = sprite_y - 1;
        else if (btnD)
            sprite_y  = sprite_y + 1;
        
        if(btnR && ~btnL)
            sprite_x = sprite_x + 1;
        else if (btnL)
            sprite_x = sprite_x - 1;
        
    end
    
    
    seven_segment_scanner seg(
    sys_clk,
    sw,
    4'b0010,
    cathode_data_out,
    enabled_segment
    );
    
    ppu ppu(
    sys_clk,
    sw[15:8],
    sw[7:0],
    0, // overlay_x_offset
    sprite_x, //sprite x
    sprite_y, // sprite y
    1,
    hsync,
    vsync,
    vblank,
    R,
    G,
    B
    );
    
endmodule
