`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2020 12:18:28 PM
// Design Name: 
// Module Name: ppu_regfile
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


module ppu_regfile(
    input clk,
    input [4:0] write_addr,
    input [15:0] write_data,
    input wr_en,
    input [4:0] read_addr,
    output [15:0] read_data,
    output [15:0] bg_offset,
    output [15:0] fg_offset,
    output [15:0] ov_offset,
    output [15:0] sprite_1_enabled,
    output [15:0] sprite_1_addr,
    output [15:0] sprite_1_x,
    output [15:0] sprite_1_y,
    output [15:0] sprite_2_enabled,
    output [15:0] sprite_2_addr,
    output [15:0] sprite_2_x,
    output [15:0] sprite_2_y,
    output [15:0] sprite_3_enabled,
    output [15:0] sprite_3_addr,
    output [15:0] sprite_3_x,
    output [15:0] sprite_3_y,
    output [15:0] sprite_4_enabled,
    output [15:0] sprite_4_addr,
    output [15:0] sprite_4_x,
    output [15:0] sprite_4_y,
    output [15:0] sprite_5_enabled,
    output [15:0] sprite_5_addr,
    output [15:0] sprite_5_x,
    output [15:0] sprite_5_y,
    output [15:0] sprite_6_enabled,
    output [15:0] sprite_6_addr,
    output [15:0] sprite_6_x,
    output [15:0] sprite_6_y,
    output [15:0] sprite_7_enabled,
    output [15:0] sprite_7_addr,
    output [15:0] sprite_7_x,
    output [15:0] sprite_7_y
    );
    
    reg [15:0] data [31:0]; //stores the data
    integer i;
    initial begin
        for (i = 0; i < 32; i=i+1)
            data[i] = 0;
    end
    
    always @(posedge clk)
    begin
        if (wr_en)
            data[write_addr] = write_data;
    end
    
    assign read_data = data[read_addr];
    
    assign bg_offset = data[0];
    assign fg_offset = data[1];
    assign ov_offset = data[2];
    assign sprite_1_enabled = data[3];
    assign sprite_1_addr = data[4];
    assign sprite_1_x = data[5];
    assign sprite_1_y = data[6];
    assign sprite_2_enabled = data[7];
    assign sprite_2_addr = data[8];
    assign sprite_2_x = data[9];
    assign sprite_2_y = data[10];
    assign sprite_3_enabled = data[11];
    assign sprite_3_addr = data[12];
    assign sprite_3_x = data[13];
    assign sprite_3_y = data[14];
    assign sprite_4_enabled = data[15];
    assign sprite_4_addr = data[16];
    assign sprite_4_x = data[17];
    assign sprite_4_y = data[18];
    assign sprite_5_enabled = data[19];
    assign sprite_5_addr = data[20];
    assign sprite_5_x = data[21];
    assign sprite_5_y = data[22];
    assign sprite_6_enabled = data[23];
    assign sprite_6_addr = data[24];
    assign sprite_6_x = data[25];
    assign sprite_6_y = data[26];
    assign sprite_7_enabled = data[27];
    assign sprite_7_addr = data[28];
    assign sprite_7_x = data[29];
    assign sprite_7_y = data[30];
    
endmodule
