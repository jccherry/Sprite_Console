`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2020 07:23:49 PM
// Design Name: 
// Module Name: hvcounter_testbench
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


module hvcounter_testbench();

    reg clk;
    wire hcounter;
    wire vcounter;
    
    hvcounter counter(clk, hcounter, vcounter);
    
    initial begin
        clk = 0;
        forever #1
        clk = ~clk;
    end

endmodule
