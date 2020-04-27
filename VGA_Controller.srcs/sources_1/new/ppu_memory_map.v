`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2020 04:05:11 PM
// Design Name: 
// Module Name: ppu_memory_map
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

//this module takes in a 14 bit memory address and maps the write data to the proper enable line, 
//while performing the correct arithmetic to ensure the proper memory module gets written to
//output line only needs to be 13 bits because of the display memories which are 0->4799

module ppu_memory_map(
    input[13:0] addr_in,
    input wr_en,
    output reg [12:0] addr_out,
    output wr_en_regfile,
    output wr_en_bg_mem,
    output wr_en_fg_mem,
    output wr_en_ov_mem
    );
    
    //0-31          => ppu regfile
    //32-4831       => bg memory
    //4832->9631    => fg memory
    //9632->14431   => ov memory
    
    assign wr_en_regfile = (addr_in <= 31) ? wr_en : 1'b0;
    assign wr_en_bg_mem = ((addr_in > 31) && (addr_in <=4831)) ? wr_en : 1'b0;
    assign wr_en_fg_mem = ((addr_in > 4831) && (addr_in <= 9631)) ? wr_en : 1'b0;
    assign wr_en_ov_mem = ((addr_in > 9631) && (addr_in <= 14431)) ? wr_en : 1'b0;
    
    always @(*)
    begin
        if (addr_in <= 31)
            addr_out = addr_in;
        else if (addr_in <= 4831)
            addr_out = addr_in - 32;
        else if (addr_in <= 9631)
            addr_out = addr_in - 4832;
        else if (addr_in <= 14431)
            addr_out = addr_in - 9632;
        else
            addr_out = 0;
    end
    
endmodule
