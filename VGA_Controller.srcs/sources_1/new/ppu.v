`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2020 02:36:37 PM
// Design Name: 
// Module Name: ppu
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


module ppu(
    input sys_clk,
    input [10:0] background_x_offset,
    input [10:0] foreground_x_offset,
    input [10:0] overlay_x_offset,
    input [9:0] sprite_x,
    input [8:0] sprite_y,
    input sprite1_enabled,
    input [2:0] loaded_sprite,
    output hsync,
    output vsync,
    output vblank,
    output [3:0] R,
    output [3:0] G,
    output [3:0] B,
    output clk
    );
    
    //wire clk;
    wire within_bounds_wire;
    
    wire [7:0] tile_x;
    wire [4:0] tile_y;
    wire [7:0] tile_x_fg;
    wire [4:0] tile_y_fg;
    wire [7:0] tile_x_overlay;
    wire [4:0] tile_y_overlay;
    
    wire [3:0] pixel_x;
    wire [3:0] pixel_y;
    wire [3:0] pixel_x_fg;
    wire [3:0] pixel_y_fg;
    wire [3:0] pixel_x_overlay;
    wire [3:0] pixel_y_overlay;
    
    wire [12:0] disp_addr;
    wire [12:0] foreground_disp_addr;
    wire [12:0] overlay_disp_addr;
    
    wire [7:0] pixel_addr;
    wire [7:0] foreground_pixel_addr;
    wire [7:0] overlay_pixel_addr;
    
    wire [6:0] tileset_addr;
    wire [6:0] foreground_tileset_addr;
    wire [6:0] overlay_tileset_addr;
    
    
    wire [11:0] background_rgb_out;
    wire [11:0] foreground_rgb_out;
    wire [11:0] overlay_rgb_out;
    
    wire [11:0] final_rgb_out;
    
    wire [9:0] hcounter;
    wire [9:0] vcounter;
    
    wire hsyncdelay1;
    wire hsyncdelay2;
    wire vsyncdelay1;
    wire vsyncdelay2;
    
    wire within_bounds_delay1;
    wire within_bounds_delay2;
    
    wire [11:0] RGB;
    
    wire [5:0] screen_x_tile;
    wire [4:0] screen_x_pixel;
    
    wire [10:0] screen_x_pixel_coord;
    wire [9:0] screen_y_pixel_coord;
    
    //output of sprite1 memory
    wire [11:0] sprite1_rgb;
    
    //output of sprite memory muxes
    wire [11:0] sprite_rgb;
    
    clock_divider div(
    sys_clk,
    clk
    );
    
    hvcounter hvcount(
    clk,
    hcounter,
    vcounter
    );
    
    hvsync sync(
    hcounter,
    vcounter,
    hsyncdelay1,
    vsyncdelay1
    );
    
    vblank vb(
    vcounter,
    vblank
    );
    
    DFF hsyncflop1(clk, hsyncdelay1, hsyncdelay2);
    DFF hsyncflop2(clk, hsyncdelay2, hsync);
    
    DFF vsyncflop1(clk, vsyncdelay1, vsyncdelay2);
    DFF vsyncflop2(clk, vsyncdelay2, vsync);
    
    within_bounds within(hcounter,vcounter,within_bounds_wire);
    
    DFF within_flop1(clk, within_bounds_wire, within_bounds_delay1);
    DFF within_flop2(clk, within_bounds_delay1, within_bounds_delay2);
    
    counter_to_tables counter_convert_bg(
    hcounter,
    vcounter,
    within_bounds_wire,
    background_x_offset,
    tile_x,
    tile_y,
    pixel_x,
    pixel_y
    );
    
    counter_to_tables counter_convert_fg(
    hcounter,
    vcounter,
    within_bounds_wire,
    foreground_x_offset,
    tile_x_fg,
    tile_y_fg,
    pixel_x_fg,
    pixel_y_fg
    );
    
    counter_to_tables counter_convert_overlay(
    hcounter,
    vcounter,
    within_bounds_wire,
    overlay_x_offset, //offset is 0
    tile_x_overlay,
    tile_y_overlay,
    pixel_x_overlay,
    pixel_y_overlay
    );
    
    //this block outputs what x pixel and y pixel is being drawn at any time
    //while within_bounds_wire is HIGH, otherwise 0
    counters_to_coords counter_convert_sprites(
    hcounter,
    vcounter,
    within_bounds_wire,
    screen_x_pixel_coord,
    screen_y_pixel_coord
    );
    
    sprite_memory  #("sprite1.mem") sprite1(
    clk,
    0, //wr_en is 0
    screen_x_pixel_coord,
    screen_y_pixel_coord,
    sprite_x, //x position
    sprite_y, //y position
    loaded_sprite,  //loaded sprite
    0,  //write address
    0,  //write data
    sprite1_rgb
    //sprite1_active
    );
    
    display_mux sprite_enabled_mux(
    12'h0f0,
    sprite1_rgb,
    sprite1_enabled,
    sprite_rgb
    );
    
    
    
    
    /*
    x_offset xoff(
    screen_x_tile,
    screen_x_pixel,
    x_offset,
    tile_x,
    pixel_x
    );*/
    
    tile_coords_to_addr disp_addr_convert(
    tile_x,
    tile_y,
    disp_addr
    );
    
    tile_coords_to_addr disp_addr_convert_fg(
    tile_x_fg,
    tile_y_fg,
    foreground_disp_addr
    );
    
    tile_coords_to_addr disp_addr_convert_overlay(
    tile_x_overlay,
    tile_y_overlay,
    overlay_disp_addr
    );
    
    pixel_coords_to_addr pixel_addr_convert(
    pixel_x,
    pixel_y,
    pixel_addr
    );
    
    pixel_coords_to_addr pixel_addr_convert_fg(
    pixel_x_fg,
    pixel_y_fg,
    foreground_pixel_addr
    );
    
    pixel_coords_to_addr pixel_addr_convert_overlay(
    pixel_x_overlay,
    pixel_y_overlay,
    overlay_pixel_addr
    );
    
    
    display_memory #("overlay_display_map.mem") overlay_mem(
    clk,
    0,
    0,
    0,
    overlay_disp_addr,
    overlay_tileset_addr
    );

    //display_memory background_mem(
    display_memory #("bg_display_map.mem") bg_mem(
    clk,
    0,
    0,
    0,
    disp_addr,
    tileset_addr
    );
    
    //foreground_memory foreground_mem(
    display_memory #("foreground_display_map.mem") fg_mem (
    clk,
    0,
    0,
    0,
    foreground_disp_addr,
    foreground_tileset_addr
    );
    
    tileset_memory #("background_tileset.mem") bg_tileset_mem(
    clk,
    0,
    tileset_addr,
    pixel_addr,
    0,
    background_rgb_out
    );
    
    tileset_memory #("overlay_tileset.mem") tileset_mem_overlay(
    clk,
    0,
    overlay_tileset_addr,
    overlay_pixel_addr,
    0,
    overlay_rgb_out
    );
    
    //foreground_tileset_memory tileset_mem_fg(
    tileset_memory #("foreground_tileset.mem") tileset_mem_fg(
    clk,
    0,
    foreground_tileset_addr,
    foreground_pixel_addr,
    0,
    foreground_rgb_out
    );
    /*
    module tileset_memory(
    input clk,
    input wr_en,
    input [6:0] tile_address,
    input [7:0] pixel_address,
    input [11:0] color_in,
    output reg [11:0] rgb_out
    );*/
    
    transparency_detection transp(
    background_rgb_out,
    foreground_rgb_out,
    overlay_rgb_out,
    sprite_rgb,
    final_rgb_out
    );
    
    display_mux mux(
    .in_0(12'h000),
    .in_1(final_rgb_out),
    .s(within_bounds_delay2),
    .out(RGB)
    );
    
    rgb_slicer sliceyslice(
    RGB,
    R,
    G,
    B
    );
    
endmodule
