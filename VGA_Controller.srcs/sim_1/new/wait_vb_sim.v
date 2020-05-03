`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2020 10:36:02 AM
// Design Name: 
// Module Name: wait_vb_sim
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


module wait_vb_sim();

    reg clk_in;
    reg vb;
    reg wait_cpu;
    wire clk_out;

    wait_vb_interrupt wvb(
    clk_in,
    vb,
    wait_cpu,
    clk_out
    );
    
    initial begin
    clk_in = 1;
    forever #5
    clk_in = ~clk_in;
    end
    
    initial begin
    vb = 1;
    wait_cpu = 0;
    #10
    wait_cpu = 1;
    #50
    vb = 0;
    #50
    vb = 1;
    #5
    wait_cpu = 0;
    #20
    wait_cpu = 1;
    #20
    vb = 0;
    #30
    vb = 1;
    #5
    wait_cpu = 0;
    end
    


endmodule
