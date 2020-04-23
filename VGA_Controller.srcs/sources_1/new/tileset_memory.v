`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2020 08:11:58 PM
// Design Name: 
// Module Name: tileset_memory
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


module tileset_memory
    #(parameter data_file = "")
    (
    input clk,
    input wr_en,
    input [6:0] tile_address,
    input [7:0] pixel_address,
    input [11:0] color_in,
    output reg [11:0] rgb_out
    );
    
    reg [11:0] data [32767:0];
    //integer i;
    reg [14:0] data_index;
    
    initial begin
        $readmemh(data_file, data);
    end
    
    always @(posedge clk)
    begin
    
        data_index = tile_address*256 + pixel_address;

        if (wr_en)
            data[data_index] = color_in;
        else
            rgb_out = data[data_index];  
    end
    
    
    
    
    
    
endmodule
