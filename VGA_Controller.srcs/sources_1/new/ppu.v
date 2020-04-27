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
    input clk,
    input [4:0] write_addr,
    input [4:0] read_addr,
    input [15:0] write_data,
    input wr_en,
    output [15:0] read_data,
    output hsync,
    output vsync,
    output vblank,
    output [3:0] R,
    output [3:0] G,
    output [3:0] B
    );
    
    wire [10:0] bg_offset;
    wire [10:0] fg_offset;
    wire [10:0] ov_offset;
    
    wire [9:0] sprite_1_x;
    wire [8:0] sprite_1_y;
    wire [2:0] sprite_1_addr;
    wire       sprite_1_enabled;
    
    wire [9:0] sprite_2_x;
    wire [8:0] sprite_2_y;
    wire [2:0] sprite_2_addr;
    wire       sprite_2_enabled;
    
    wire [9:0] sprite_3_x;
    wire [8:0] sprite_3_y;
    wire [2:0] sprite_3_addr;
    wire       sprite_3_enabled;
    
    wire [9:0] sprite_4_x;
    wire [8:0] sprite_4_y;
    wire [2:0] sprite_4_addr;
    wire       sprite_4_enabled;
    
    wire [9:0] sprite_5_x;
    wire [8:0] sprite_5_y;
    wire [2:0] sprite_5_addr;
    wire       sprite_5_enabled;
    
    wire [9:0] sprite_6_x;
    wire [8:0] sprite_6_y;
    wire [2:0] sprite_6_addr;
    wire       sprite_6_enabled;
    
    wire [9:0] sprite_7_x;
    wire [8:0] sprite_7_y;
    wire [2:0] sprite_7_addr;
    wire       sprite_7_enabled;
    
    ppu_regfile regfile(
    clk,
    write_addr,
    write_data,
    wr_en,
    read_addr,
    read_data,
    bg_offset,
    fg_offset,
    ov_offset,
    sprite_1_enabled,
    sprite_1_addr,
    sprite_1_x,
    sprite_1_y,
    sprite_2_enabled,
    sprite_2_addr,
    sprite_2_x,
    sprite_2_y,
    sprite_3_enabled,
    sprite_3_addr,
    sprite_3_x,
    sprite_3_y,
    sprite_4_enabled,
    sprite_4_addr,
    sprite_4_x,
    sprite_4_y,
    sprite_5_enabled,
    sprite_5_addr,
    sprite_5_x,
    sprite_5_y,
    sprite_6_enabled,
    sprite_6_addr,
    sprite_6_x,
    sprite_6_y,
    sprite_7_enabled,
    sprite_7_addr,
    sprite_7_x,
    sprite_7_y
    );
    
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
    wire [11:0] sprite2_rgb;
    wire [11:0] sprite3_rgb;
    wire [11:0] sprite4_rgb;
    wire [11:0] sprite5_rgb;
    wire [11:0] sprite6_rgb;
    wire [11:0] sprite7_rgb;
    
    
    //output of sprite memory muxes
    wire [11:0] sprite_rgb;
    
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
    bg_offset,
    tile_x,
    tile_y,
    pixel_x,
    pixel_y
    );
    
    counter_to_tables counter_convert_fg(
    hcounter,
    vcounter,
    within_bounds_wire,
    fg_offset,
    tile_x_fg,
    tile_y_fg,
    pixel_x_fg,
    pixel_y_fg
    );
    
    counter_to_tables counter_convert_overlay(
    hcounter,
    vcounter,
    within_bounds_wire,
    ov_offset, //offset is 0
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
    sprite_1_x, //x position
    sprite_1_y, //y position
    sprite_1_addr,  //loaded sprite
    sprite_1_enabled,
    0,  //write address
    0,  //write data
    sprite1_rgb
    //sprite1_active
    );
    
    sprite_memory  #("sprite1.mem") sprite2(
    clk,
    0, //wr_en is 0
    screen_x_pixel_coord,
    screen_y_pixel_coord,
    sprite_2_x, //x position
    sprite_2_y, //y position
    sprite_2_addr,  //loaded sprite
    sprite_2_enabled,
    0,  //write address
    0,  //write data
    sprite2_rgb
    //sprite1_active
    );
    
    sprite_memory  #("sprite1.mem") sprite3(
    clk,
    0, //wr_en is 0
    screen_x_pixel_coord,
    screen_y_pixel_coord,
    sprite_3_x, //x position
    sprite_3_y, //y position
    sprite_3_addr,  //loaded sprite
    sprite_3_enabled,
    0,  //write address
    0,  //write data
    sprite3_rgb
    //sprite1_active
    );
    
    sprite_memory  #("sprite1.mem") sprite4(
    clk,
    0, //wr_en is 0
    screen_x_pixel_coord,
    screen_y_pixel_coord,
    sprite_4_x, //x position
    sprite_4_y, //y position
    sprite_4_addr,  //loaded sprite
    sprite_4_enabled,
    0,  //write address
    0,  //write data
    sprite4_rgb
    //sprite1_active
    );
    
    sprite_memory  #("sprite1.mem") sprite5(
    clk,
    0, //wr_en is 0
    screen_x_pixel_coord,
    screen_y_pixel_coord,
    sprite_5_x, //x position
    sprite_5_y, //y position
    sprite_5_addr,  //loaded sprite
    sprite_5_enabled,
    0,  //write address
    0,  //write data
    sprite5_rgb
    //sprite1_active
    );
    
    sprite_memory  #("sprite1.mem") sprite6(
    clk,
    0, //wr_en is 0
    screen_x_pixel_coord,
    screen_y_pixel_coord,
    sprite_6_x, //x position
    sprite_6_y, //y position
    sprite_6_addr,  //loaded sprite
    sprite_6_enabled,
    0,  //write address
    0,  //write data
    sprite6_rgb
    //sprite1_active
    );
    
    sprite_memory  #("sprite1.mem") sprite7(
    clk,
    0, //wr_en is 0
    screen_x_pixel_coord,
    screen_y_pixel_coord,
    sprite_7_x, //x position
    sprite_7_y, //y position
    sprite_7_addr,  //loaded sprite
    sprite_7_enabled,
    0,  //write address
    0,  //write data
    sprite7_rgb
    //sprite1_active
    );
    
    
    sprite_rgb_combinator sprite_combinator(
    sprite1_rgb,
    sprite2_rgb,
    sprite3_rgb,
    sprite4_rgb,
    sprite5_rgb,
    sprite6_rgb,
    sprite7_rgb,
    sprite_rgb
    );
    
    
    /*
    display_mux sprite_enabled_mux(
    12'h0f0,
    sprite1_rgb,
    sprite1_enabled,
    sprite_rgb
    );*/
    
    
    
    
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
