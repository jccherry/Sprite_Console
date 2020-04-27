`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2020 03:50:22 PM
// Design Name: 
// Module Name: snes_controller
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


module snes_controller(
    input sys_clk,
    input read_en,
    input snes_data_in,
    output snes_clk,
    output snes_latch_out,
    output [11:0] snes_data_out
    );
    
     //SNES CONTROLLER HANDLER=========================================================
    reg snes_latch;
    wire slow_clk;
    reg [4:0] counter;
    wire snes_clk_started;
    reg [11:0] snes_data;
    reg enable_snes_clk_output;
    wire [11:0] controller_1_inputs;
    
    //assign controller_1_inputs = snes_data;
    assign snes_latch_out = snes_latch;
    
    
    snes_clock_divider clkdiv(
    sys_clk,
    slow_clk
    );
    
    //assign slow_clk = sys_clk;
    
    initial begin
        enable_snes_clk_output = 0;
        snes_latch = 0;
        snes_data = 0;
        counter = 0;
    end

    //when read is enabled, this clock starts, otherwise its high    
    assign snes_clk_started = (read_en) ? slow_clk : 1'b0;
    //assign snes_clk_started = slow_clk;
    
    
    //when output is enabled, controller will start getting clock
    //(12us after latch is high, clock signal is enabled)
    assign snes_clk = (enable_snes_clk_output) ? snes_clk_started : 1'b1;
    //assign snes_clk = (enable_snes_clk_output) ? slow_clk : 1'b1;


    always@(posedge snes_clk_started)
    begin
        case (counter)
            0   :   begin
                        snes_latch = 1'b1;
                        counter = counter + 1;
                    end
            1   :   begin
                        snes_latch = 1'b0;
                        enable_snes_clk_output = 1;
                        counter = counter + 1;
                    end
            17  :   begin
                        enable_snes_clk_output = 0;
                        counter = 0;
                    end
            default : counter = counter + 1;    
        endcase 
    end
    
    always @(negedge snes_clk)
    begin
        case (counter)
            
            2 : snes_data[0] = ~snes_data_in; //b button
            3 : snes_data[1] = ~snes_data_in; //y buton
            4 : snes_data[2] = ~snes_data_in; //sel
            5 : snes_data[3] = ~snes_data_in; //  start
            6 : snes_data[4] = ~snes_data_in; // up
            7 : snes_data[5] = ~snes_data_in; // down
            8 : snes_data[6] = ~snes_data_in; // left
            9 : snes_data[7] = ~snes_data_in; //rigjht
            10: snes_data[8] = ~snes_data_in; //a
            11: snes_data[9] = ~snes_data_in; //x
            12: snes_data[10] = ~snes_data_in; //L
            13: snes_data[11] = ~snes_data_in; //R
        endcase
    end
    
    
    //mapping reg to wires for ease of use later
    assign snes_data_out[0] = snes_data[4]; //up
    assign snes_data_out[1] = snes_data[5]; //down
    assign snes_data_out[2] = snes_data[6]; //left
    assign snes_data_out[3] = snes_data[7]; //right
    assign snes_data_out[4] = snes_data[8]; //a
    assign snes_data_out[5] = snes_data[0]; //b
    assign snes_data_out[6] = snes_data[9]; //x
    assign snes_data_out[7] = snes_data[1]; //y
    assign snes_data_out[8] = snes_data[3]; //start
    assign snes_data_out[9] = snes_data[2]; //sel
    assign snes_data_out[10] = snes_data[10]; //L
    assign snes_data_out[11] = snes_data[11]; //R
    
    //SNES CONTROLLER HANDLER=========================================================
endmodule


module snes_clock_divider(clock_in,clock_out
    );
input clock_in; // input clock on FPGA
output clock_out; // output clock after dividing the input clock by divisor
reg[27:0] counter=28'd0;
parameter DIVISOR = 28'd400;
//parameter DIVISOR = 28'd1;
// The frequency of the output clk_out
//  = The frequency of the input clk_in divided by DIVISOR
// For example: Fclk_in = 50Mhz, if you want to get 1Hz signal to blink LEDs
// You will modify the DIVISOR parameter value to 28'd50.000.000
// Then the frequency of the output clk_out = 50Mhz/50.000.000 = 1Hz
always @(posedge clock_in)
begin
 counter <= counter + 28'd1;
 if(counter>=(DIVISOR-1))
  counter <= 28'd0;
end
assign clock_out = (counter<DIVISOR/2)?1'b0:1'b1;
endmodule