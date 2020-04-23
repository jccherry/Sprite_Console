`timescale 1ns / 1ps

module tff(
    input clk,
    output reg Q);
    
    initial begin
        Q = 0;
    end
    
    always @(posedge clk)
    begin
        Q = ~Q;
    end
endmodule


module clock_divider(
    input clk_input,
    //input [3:0] scale_factor,
    output clk_output
    );
    
    wire inbetween;
    
    tff tff1(clk_input, inbetween);
    tff tff2(inbetween, clk_output);
    
endmodule
