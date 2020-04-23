`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2020 02:07:00 PM
// Design Name: 
// Module Name: dff_testbench
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


module dff_testbench();

    reg clk, D;
    wire Q;

    DFF flop(clk, D, Q);

    initial begin
        clk = 0;
        forever #5
        clk = ~clk;
    end
    
    initial begin
        D = 1;
        #10
        #10
        D = 0;
        #10
        D = 1;
        #10
        D = 0;
    end



endmodule
