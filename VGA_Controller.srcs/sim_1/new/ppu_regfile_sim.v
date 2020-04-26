`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2020 12:50:47 PM
// Design Name: 
// Module Name: ppu_regfile_sim
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


module ppu_regfile_sim();

    reg clk;
    reg [4:0] write_addr;
    reg [15:0] write_data;
    reg wr_en;
    reg [4:0] read_addr;
    wire [15:0] read_data;
    wire [15:0] bg_offset;
    wire [15:0] fg_offset;
    wire [15:0] ov_offset;
    wire [15:0] sprite_1_enabled;
    wire [15:0] sprite_1_addr;
    wire [15:0] sprite_1_x;
    wire [15:0] sprite_1_y;
    wire [15:0] sprite_2_enabled;
    wire [15:0] sprite_2_addr;
    wire [15:0] sprite_2_x;
    wire [15:0] sprite_2_y;
    wire [15:0] sprite_3_enabled;
    wire [15:0] sprite_3_addr;
    wire [15:0] sprite_3_x;
    wire [15:0] sprite_3_y;
    wire [15:0] sprite_4_enabled;
    wire [15:0] sprite_4_addr;
    wire [15:0] sprite_4_x;
    wire [15:0] sprite_4_y;
    wire [15:0] sprite_5_enabled;
    wire [15:0] sprite_5_addr;
    wire [15:0] sprite_5_x;
    wire [15:0] sprite_5_y;
    wire [15:0] sprite_6_enabled;
    wire [15:0] sprite_6_addr;
    wire [15:0] sprite_6_x;
    wire [15:0] sprite_6_y;
    wire [15:0] sprite_7_enabled;
    wire [15:0] sprite_7_addr;
    wire [15:0] sprite_7_x;
    wire [15:0] sprite_7_y;
    
    
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
    
    
    initial begin
        clk = 0;
        forever #5
        clk = ~clk;
    end 
    
    initial begin
        read_addr = 0;
        write_addr = 0;
        wr_en = 0;
        write_data = 0;
        #10
        write_data = 10;
        wr_en = 1;
        #10
        wr_en = 0;
        write_addr = 11;
        write_data = 1;
        #10
        wr_en = 1;
        #10
        wr_en = 0;
        write_addr = 12;
        write_data = 7;
        read_addr = 12;
        #10
        wr_en = 1;
        #10
        wr_en = 0;
        
    end
    
    
    


endmodule
