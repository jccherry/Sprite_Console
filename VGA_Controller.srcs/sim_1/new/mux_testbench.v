`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2020 08:31:04 PM
// Design Name: 
// Module Name: mux_testbench
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


module mux_testbench();

    reg [11:0] in0;
    reg [11:0] in1;
    reg s;
    wire [11:0] out;

    display_mux mux(
    in0,
    in1,
    s,
    out
    );
    
    initial begin
        s = 1;
        #10
        in0 = 10;
        in1 = 100;
        s = 0;
        #10
        s = 1;
        #10
        in1 = 123;
        in0 = 50;
        #10 
        s = 0;
    end
    

endmodule
