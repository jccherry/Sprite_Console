`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2020 10:31:02 AM
// Design Name: 
// Module Name: wait_vb_interrupt
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
module sr_latch(
    input S,
    input R,
    output Q
    );
 
wire Q_int, Qn_int;
 
assign Q_int = ~(S & Qn_int);
assign Qn_int = ~(R & Q_int);
assign Q = Q_int;
 
endmodule

module jk_ff ( input j,
               input k,
               input clk,
               output reg q);
 
    reg did_toggle;
 
   initial begin
    q = 0;
    did_toggle = 0;
   end
 
   always @ (posedge clk)
      case ({j,k})
         2'b00 :  q <= q;
         2'b01 :  q <= 0;
         2'b10 :  begin
                    q <= 1; 
                    did_toggle = 0;  
                  end
         2'b11 :  begin 
                    if (~did_toggle) begin
                        q <= ~q;
                        did_toggle = 1;
                    end
                  end
      endcase
endmodule

module wait_vb_interrupt(
    input clk_in,
    input vb,
    input wait_cpu,
    output clk_out
    );
    
    wire sel;
    
    //sr_latch sr(wait_cpu, vb, sel);
    jk_ff jk(wait_cpu, vb, clk_in, sel);
    
    assign clk_out = sel ? 1'b0 : clk_in;

endmodule
