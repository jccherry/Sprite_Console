`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2020 07:44:11 PM
// Design Name: 
// Module Name: controller_reg_mux
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


module controller_reg_mux(
    input[15:0] addr,
    input[11:0] controller1_data,
    input[11:0] controller2_data,
    input[16:0] data_reg_mux_in,
    output reg [15:0] reg_write_data
    );
    
    always @(*)
    begin
        if(addr == 16'h7864)
            reg_write_data = controller1_data;
        else if (addr == 16'h7865)
            reg_write_data = controller2_data;
        else
            reg_write_data = data_reg_mux_in;
    end
endmodule
