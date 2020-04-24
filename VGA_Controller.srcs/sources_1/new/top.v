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
    
    reg [10:0] bg_offset;
    reg [10:0] foreground_offset;
   
    wire vblank;
    
    clock_divider div(
    sys_clk,
    clk_25MHz
    );
    
    initial begin
        sprite_x = 320;
        sprite_y = 240;
        bg_offset = 0;
        foreground_offset = 0;
    end
    
    always@(posedge vblank)
    begin
        if(btnU && ~btnD)
            sprite_y = sprite_y - 1;
        else if (btnD)
            sprite_y  = sprite_y + 1;
        
        if(btnR && ~btnL)
        begin
            if (sprite_x >= 515)
            begin
                foreground_offset = foreground_offset + 1;
                //if fg_offset is even (lsb), add 1 to bg offset
                if (foreground_offset[0] == 0)
                    bg_offset = bg_offset + 1;
            end
            else
                sprite_x = sprite_x + 1;
        end
        else if (btnL)
        begin
            if (sprite_x <= 128)
            begin
                foreground_offset = foreground_offset - 1;
                //if fg_offset is even (lsb), add 1 to bg offset
                if (foreground_offset[0] == 0 && foreground_offset > 0)
                    bg_offset = bg_offset - 1;
            end
            else
                sprite_x = sprite_x - 1;
        end
        
    end
    
    wire [15:0] seven_seg_input;
    //assign seven_seg_input[15:8] = bg_offset;
    assign seven_seg_input[10:0] = foreground_offset;
    assign seven_seg_input[11] = 0;
    assign seven_seg_input[15:12] = sw[2:0];
    
    wire vga_clk;

    ppu ppu(
    clk_25MHz,
    bg_offset,
    foreground_offset,
    0, // overlay_x_offset
    sprite_x, //sprite x
    sprite_y, // sprite y
    1,
    sw[2:0],
    //0,
    hsync,
    vsync,
    vblank,
    R,
    G,
    B
    );
    /*
    seven_segment_scanner seg(
    vblank,
    seven_seg_input,
    4'b0000,
    cathode_data_out,
    enabled_segment
    );*/
    
endmodule
