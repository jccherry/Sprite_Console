`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2020 11:53:29 AM
// Design Name: 
// Module Name: sprite_memory
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


module sprite_memory
    #(parameter data_file = "")
    (
    input clk,
    input wr_en,
    input [9:0] screen_x,
    input [8:0] screen_y,
    input [9:0] sprite_x,
    input [8:0] sprite_y,
    input [2:0] loaded_sprite,
    input       sprite_en,
    input [10:0] write_addr,
    input [11:0] write_data,
    output reg [11:0] rgb
    //output reg active
    );
    
    reg [11:0] sprite_data [2047:0];
    
    initial begin
        $readmemh(data_file, sprite_data);
    end
    
    always @(posedge clk)
    begin
        if (wr_en)
            sprite_data[write_addr] = write_data;
        else begin
            //if the screen is drawing a pixel within range of the sprite's 16x6 dimensions
            if (sprite_en && (screen_x >= sprite_x) && (screen_x < (sprite_x + 16)) && (screen_y >= sprite_y) && (screen_y < (sprite_y + 16)))
                begin
                //active = 1;
                rgb = sprite_data[loaded_sprite*256 + (screen_x - sprite_x) + (screen_y - sprite_y)*16];
                end
            else
                //active = 0;
                rgb = 12'h0f0;
        end
    end
    
    
    
    
    
    
    
endmodule
