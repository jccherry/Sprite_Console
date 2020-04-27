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
    output snes_clk,
    output snes_latch,
    output [11:0] snes_data_out,
    output hsync,
    output vsync,
    output [3:0] R,
    output [3:0] G,
    output [3:0] B
    );
    /*
    reg [9:0] sprite_x;
    reg [8:0] sprite_y;
    
    reg [10:0] bg_offset;
    reg [10:0] foreground_offset;
    
    reg [2:0] displayed_sprite;
    
    reg left_bumper_held;
    reg right_bumper_held;
   */
    wire vblank;
    
    clock_divider div(
    sys_clk,
    clk_25MHz
    );
    /*
    initial begin
        sprite_x = 320;
        sprite_y = 240;
        bg_offset = 0;
        foreground_offset = 0;
        displayed_sprite = 0;
        left_bumper_held = 0;
        right_bumper_held = 0;
    end
    */
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
    
    //reg [3:0] dir;
    
    assign snes_data_out = snes_data_reg;
    
    always@(posedge vblank)
    begin
        snes_data_reg = snes_data;
        //dir = snes_data[3:0];
        /*if (snes_data_reg[0] == 1'b1)
            sprite_y = sprite_y-1;
        else if (snes_data_reg[1] == 1'b1)
            sprite_y = sprite_y+1;
            
        if (snes_data_reg[2] == 1'b1)
            sprite_x = sprite_x-1;
        else if (snes_data_reg[3] == 1'b1)
            sprite_x = sprite_x+1;*/
   end
    
    /*
    wire bumper;
    or (bumper, snes_data_reg[10],snes_data_reg[11]);
    
    always @(posedge bumper)
    begin
        if (snes_data_reg[10])
            displayed_sprite = displayed_sprite - 1;
        else
            displayed_sprite = displayed_sprite + 1;
    end*/
    


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




