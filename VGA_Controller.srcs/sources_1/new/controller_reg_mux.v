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
    input[11:0] controller3_data,
    input[11:0] controller4_data,
    input[16:0] data_reg_mux_in,
    output reg [15:0] reg_write_data
    );
    
    always @(*)
    begin
        case (addr)
            16'h7864    :   reg_write_data = controller1_data;
            16'h7865    :   reg_write_data = controller2_data;
            16'h7866    :   reg_write_data = controller3_data;
            16'h7867    :   reg_write_data = controller4_data;
            default     :   reg_write_data = data_reg_mux_in;
        endcase
    end
endmodule
