module SNES_FSM(
				input clk_50,
				input start,
				input data_in_snes,
				input data_in_snes2,
				output [11:0] snes_data_out,
				output [11:0] snes_data_out2,
				output finish,
				output idle,
				output latch_snes,
				output clk_snes
				);
							  //LATCH______CLOCK_____FINISH____IDLE______STATE
localparam   IDLE  =  10'b0_____________1_________0________1______000001;
localparam   STATE1=  10'b1_____________1_________0________0______000010;
localparam   STATE2=  10'b0_____________1_________0________0______000100;
localparam   STATE3=  10'b0_____________0_________0________0______001000;
localparam   STATE4=  10'b0_____________1_________0________0______010000;
localparam   FINISH=  10'b0_____________1_________1________0______100000;
							//numero de clocks del relog base de 50 Mhz
localparam   TIME6u	= 10'd300;
localparam   TIME12u	= 10'd600;

reg [11:0]buttons_snes;
reg [11:0]buttons_snes2;
reg [9:0]state=IDLE;
reg [9:0]delay=TIME12u;
reg [3:0]num_clks=4'd0;
reg [14:0]buttons_temp=15'd0;
reg [14:0]buttons_temp2=15'd0;
wire pre_finish=(state[9:0]==STATE4)?1'b1:0;
assign latch_snes=state[9];
assign clk_snes=state[8];
assign finish=state[7];
assign idle=state[6];


always@(posedge pre_finish)
begin
	buttons_snes[11:0]<=buttons_temp[11:0];
	buttons_snes2[11:0]<=buttons_temp2[11:0];
end

always@(negedge clk_snes)
begin							
	buttons_temp[14:0]<={data_in_snes,buttons_temp[14:1]};
	buttons_temp2[14:0]<={data_in_snes2,buttons_temp2[14:1]};
end

always@(posedge clk_50)
begin
	case(state[9:0])
	IDLE  :begin
				state[9:0]<=IDLE;
				delay[9:0]<=TIME12u;
				num_clks[3:0]<=4'd0;
				if(start==1)
				begin
					state[9:0]<=STATE1;
				end
			 end
   STATE1:begin
				state[9:0]<=STATE1;
				delay[9:0]<=delay[9:0]-1'b1;
				num_clks[3:0]<=4'd1;
				if(delay[9:0]==10'd0)
				begin
					delay[9:0]<=TIME6u;
					state[9:0]<=STATE2;
				end
			 end
	STATE2:begin
				state[9:0]<=STATE2;
				delay[9:0]<=delay[9:0]-1'b1;
				num_clks[3:0]<=num_clks[3:0];
				if(delay[9:0]==10'd0)
				begin
					delay[9:0]<=TIME6u;
					state[9:0]<=STATE3;
				end
			 end
   STATE3:begin
				state[9:0]<=STATE3;
				delay[9:0]<=delay[9:0]-1'b1;
				num_clks[3:0]<=num_clks[3:0];
				if(delay[9:0]==10'd0)
				begin
					num_clks[3:0]<=num_clks[3:0]+1'b1;
					if(num_clks[3:0]<4'd15)
					begin	
						delay[9:0]<=TIME6u;
						state[9:0]<=STATE2;
					end
					else
					begin
						delay[9:0]<=TIME12u;
						state[9:0]<=STATE4;
					end
				end
			 end
   STATE4:begin
				state[9:0]<=STATE4;
				delay[9:0]<=delay[9:0]-1'b1;
				num_clks[3:0]<=4'd0;
				if(delay[9:0]==10'd0)
				begin
					state[9:0]<=FINISH;
				end
			 end
   FINISH:begin
				state[9:0]<=IDLE;
				delay[9:0]<=10'd0;
				num_clks[3:0]<=4'd0;
			 end
	default:begin
				state[9:0]<=IDLE;
				delay[9:0]<=10'd0;
				num_clks[3:0]<=4'd0;
			 end
	endcase
end

assign snes_data_out[0] = ~buttons_snes[4]; //up
assign snes_data_out[1] = ~buttons_snes[5]; //down
assign snes_data_out[2] = ~buttons_snes[6]; //left
assign snes_data_out[3] = ~buttons_snes[7]; //right
assign snes_data_out[4] = ~buttons_snes[8]; //a
assign snes_data_out[5] = ~buttons_snes[0]; //b
assign snes_data_out[6] = ~buttons_snes[9]; //x
assign snes_data_out[7] = ~buttons_snes[1]; //y
assign snes_data_out[8] = ~buttons_snes[10]; //L
assign snes_data_out[9] = ~buttons_snes[11]; //R
assign snes_data_out[10] = ~buttons_snes[2]; //sel
assign snes_data_out[11] = ~buttons_snes[3]; //start

assign snes_data_out2[0] = ~buttons_snes2[4]; //up
assign snes_data_out2[1] = ~buttons_snes2[5]; //down
assign snes_data_out2[2] = ~buttons_snes2[6]; //left
assign snes_data_out2[3] = ~buttons_snes2[7]; //right
assign snes_data_out2[4] = ~buttons_snes2[8]; //a
assign snes_data_out2[5] = ~buttons_snes2[0]; //b
assign snes_data_out2[6] = ~buttons_snes2[9]; //x
assign snes_data_out2[7] = ~buttons_snes2[1]; //y
assign snes_data_out2[8] = ~buttons_snes2[10]; //L
assign snes_data_out2[9] = ~buttons_snes2[11]; //R
assign snes_data_out2[10] = ~buttons_snes2[2]; //sel
assign snes_data_out2[11] = ~buttons_snes2[3]; //start

endmodule