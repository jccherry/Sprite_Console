`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/19/2020 07:20:41 PM
// Design Name: 
// Module Name: hvcounter
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


module hvcounter(
    input clk,
    output reg [9:0] hcounter,
    output reg [9:0] vcounter
    );
    
    initial begin
        hcounter = 0;
        vcounter = 0;
    end
    
    always @(posedge clk)
    begin
        if (hcounter < 799)
            hcounter = hcounter + 1;
        else 
        if (hcounter == 799 && vcounter < 524)
            begin
            hcounter = 0;
            vcounter = vcounter + 1;
            end
        else 
            begin
            hcounter = 0;
            vcounter = 0;
            end
            
    end
    
    
    
endmodule
