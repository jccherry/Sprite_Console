`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2020 04:21:35 PM
// Design Name: 
// Module Name: ppu_mem_map_sim
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


module ppu_mem_map_sim();

    reg[13:0] addr_in;
    reg wr_en;
    wire  [12:0] addr_out;
    wire wr_en_regfile;
    wire wr_en_bg_mem;
    wire wr_en_fg_mem;
    wire wr_en_ov_mem;

    

    ppu_memory_map mmap(
    addr_in,
    wr_en,
    addr_out,
    wr_en_regfile,
    wr_en_bg_mem,
    wr_en_fg_mem,
    wr_en_ov_mem
    );
    
    initial begin
    wr_en = 0;
    addr_in = 0;
    #5
    addr_in = 30;
    #5
    wr_en = 1;
    #5
    addr_in = 31;
    #5
    addr_in = 32;
    #5
    addr_in = 4831;
    #5
    addr_in = 4832;
    #5
    addr_in = 9631;
    #5
    addr_in = 9632;
    #5
    addr_in = 14431;
    #5
    addr_in = 14432;
    end

endmodule
