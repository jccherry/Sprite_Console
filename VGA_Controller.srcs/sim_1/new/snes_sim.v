`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2020 11:12:58 PM
// Design Name: 
// Module Name: snes_sim
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


module snes_sim();


    reg sys_clk;
    //reg read_en;
    reg snes_data_in;
    wire snes_clk;
    wire snes_latch;
    wire [11:0] snes_data;

snes_controller snes(
    sys_clk,
    //read_en,
    snes_data_in,
    snes_clk,
    snes_latch,
    snes_data
    );

initial begin
    sys_clk = 0;
    forever #5
    sys_clk = ~sys_clk;
end

initial begin
    //read_en = 0;
    snes_data_in = 0;
    #15
    //read_en = 1;
    snes_data_in = 0;
    #5
    snes_data_in = 0;
    #15
    #5
    snes_data_in = 0;
    #5
    snes_data_in = 1;
    #10
    snes_data_in = 0;
    #5
    snes_data_in = 0;
end


endmodule
