`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/29/2020 05:03:30 PM
// Design Name: 
// Module Name: alu_regfile
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

module reg_file(
    input wr_en,
    input [16:0] wr_data,
    input [4:0] wr_addr,
    input rst,
    input clk,
    input [4:0] rd0_addr,
    input [4:0] rd1_addr,
    output [16:0] rd0_data,
    output [16:0] rd1_data);
    
    
    reg [17:0] registers[31:0];
    
    integer i;

    
    always @(negedge clk) //register write on enable and negedge of clock
    begin
        if (wr_en)
        begin
            registers[wr_addr] = wr_data;
        end
        if (rst)
        begin
            for (i = 0; i < 32; i=i+1) 
                begin
                    registers[i] = 0;
                end
        end
    end
    
    assign rd0_data = registers[rd0_addr];
	assign rd1_data = registers[rd1_addr];
    
endmodule

module sprite_alu(
    input [15:0] a,
    input [15:0] b,
    input [3:0] alu_op,
    output reg [15:0] out,
    output reg ovf,
    output reg take_branch
    );
    
    reg [16:0] sum;
    
    always @(*)
    begin
    case (alu_op)
        4'b0000 :   begin //add
                    sum = a + b;
                    out = sum[15:0];
                    ovf = sum[16];
                    take_branch = 1'b0;
                    end
        4'b0001 :   begin //subtract
                    out = a - b;
                    ovf <= (a[15] == b[15]) && (a[15] != out[15]);
                    take_branch = 1'b0;
                    end
        4'b0010 :   begin //multiply
                    out = a * b;
                    ovf = 1'b0;
                    take_branch = 1'b0;
                    end
        4'b0011 :   begin //divide
                    if (b == 0)
                        begin
                        out = 0;
                        ovf = 1'b1;
                        take_branch = 1'b0;
                        end
                    else 
                        begin
                        out = a / b;
                        ovf = 1'b0;
                        take_branch = 1'b0;
                        end
                    end
        4'b0100 :   begin //modulo
                    out = a % b;
                    ovf = 1'b0;
                    take_branch = 1'b0;
                    end
        4'b0101 :   begin //left logical shift
                    out = a << b;
                    ovf = 1'b0;
                    take_branch = 1'b0;
                    end
        4'b0110 :   begin //right arithmetic shift
                    out = a >>> b;
                    ovf = 1'b0;
                    take_branch = 1'b0;
                    end
        4'b0111 :   begin //bitwise not
                    out = ~b;
                    ovf = 1'b0;
                    take_branch = 1'b0;
                    end
        4'b1000 :   begin //bitwise and
                    out = a & b;
                    ovf = 1'b0;
                    take_branch = 1'b0;
                    end
        4'b1001 :   begin //bitwise or
                    out = a | b;
                    ovf = 1'b0;
                    take_branch = 1'b0;
                    end
        4'b1010 :   begin //jump if equal
                    out = 0;
                    ovf = 1'b0;
                    take_branch = a == b;
                    end
        4'b1011 :   begin //jump if not equal
                    out = 0;
                    ovf = 1'b0;
                    take_branch = a != b;
                    end
        4'b1100 :   begin //jump if less than
                    out = 0;
                    ovf = 1'b0;
                    take_branch = a < b;
                    end
        4'b1101 :   begin //jump is less than or equal
                    out = 0;
                    ovf = 1'b0;
                    take_branch = a <= b;
                    end
        4'b1110 :   begin //jump if greater than
                    out = 0;
                    ovf = 1'b0;
                    take_branch = a > b;
                    end
        4'b1111 :   begin //jump if greater than or equal
                    out = 0;
                    ovf = 1'b0;
                    take_branch = a >= b;
                    end
    endcase
    end
    
endmodule

module mux_16x2to1(
    input [15:0] a,
    input [15:0] b,
	input sel,
	output [15:0] y);
	
	
	assign y = sel ? b : a;
endmodule


module mux_17x2to1(
    input [16:0] a,
    input [16:0] b,
	input sel,
	output [16:0] y);
	
	
	assign y = sel ? b : a;
endmodule

module datapath_top(
    input sys_clk,
    output hsync,
    output vsync,
    output [3:0] R,
    output [3:0] G,
    output [3:0] B
    //input reg_rst,
    //input reg_write,
    //input [15:0] instr_i,
    //input alu_src_1,
    //input alu_src_2,
    //input [3:0] alu_op,
    //input mem_write,
    //input mem_to_reg,
    //input [4:0] reg_read_addr1,
    //input [4:0] reg_read_addr2,
    //input [4:0] reg_write_addr
    );
    
    /*
    .probe_out0(reg_write),
.probe_out1(instr_i),
.probe_out2(alu_src_1),
.probe_out3(alu_src_2),
.probe_out4(alu_op),
.probe_out5(mem_write),
.probe_out6(mem_to_reg),
.probe_out7(reg_read_addr1),
.probe_out8(reg_read_addr2),
.probe_out9(reg_write_addr)
    */
    
    
    wire clk;
    
    clock_divider clk_div(
    sys_clk,
    clk
    );
    
    wire reg_write;
    wire [16:0] reg_write_data;
    wire [4:0] reg_write_addr;
    //wire reg_rst;
    wire [4:0] reg_read_addr1;
    wire [4:0] reg_read_addr2;
    wire [16:0] reg_read_data1;
    wire [16:0] reg_read_data2;
    wire write_loc;
    
    wire [31:0] instruction;
    wire step_clk;
    
    mux_16x2to1 reg_write_addr_mux(
        reg_read_addr1,
        reg_read_addr2,
        write_loc,
        reg_write_addr
    );
    
    reg_file regfile(
    reg_write,
    reg_write_data,
    reg_write_addr,
    reg_rst,
    step_clk,
    reg_read_addr1,
    reg_read_addr2,
    reg_read_data1,
    reg_read_data2);
    
    wire alu_src_1;
    wire [15:0] alu_input_1;
    
    mux_16x2to1 alu_mux_1(
    reg_read_data1[15:0],
    0,
	alu_src_1,
	alu_input_1
	);
	
	wire alu_src_2;
    wire [15:0] alu_input_2;
    wire [15:0] instr_i;
    
    mux_16x2to1 alu_mux_2(
    reg_read_data2[15:0],
    instr_i,
	alu_src_2,
	alu_input_2
	);
	
	wire [3:0] alu_op;
	wire [15:0] alu_out;
	wire alu_ovf;
	wire alu_take_branch;
    
    sprite_alu alu(
    alu_input_1,
    alu_input_2,
    alu_op,
    alu_out,
    alu_ovf,
    alu_take_branch
    );
    
    wire [16:0] data_mem_out;
    wire mem_write;
    wire mem_to_reg;
    
    wire [16:0] alu_reg_wire;
    assign alu_reg_wire[15:0] = alu_out;
    assign alu_reg_wire[16] = alu_ovf;
    
    mux_17x2to1 data_mem_mux(
    alu_reg_wire,
    data_mem_out,
	mem_to_reg,
	reg_write_data
	);
    
    
    
    /*
    vio_0 VIO(
.clk(clk),
.probe_in0(reg_write_data),
.probe_in1(reg_read_data1),
.probe_in2(reg_read_data2),
.probe_in3(alu_input_1),
.probe_in4(alu_input_2),
.probe_in5(alu_take_branch),
.probe_in6(alu_ovf),
.probe_in7(alu_out),
.probe_in8(data_mem_out),
.probe_out0(instruction),
.probe_out1(step_clk),
);*/

wire [5:0] opcode;

vio_0 VIO(
clk,
reg_write_data,
reg_read_data1,
reg_read_data2,
alu_input_1,
alu_input_2,
alu_take_branch,
alu_ovf,
alu_out,
data_mem_out,
opcode,
instruction,
step_clk
);


instruction_decoder inst_dec(
    instruction,
    //register read addresses (and write with control signal)
    reg_read_addr1,
    reg_read_addr2,
    //immediate instruction
    instr_i,
    //control signals
    alu_op,
    alu_src_1,
    alu_src_2,
    reg_write,
    mem_write,
    write_loc,
    mem_to_reg,
    //debug output
    opcode
    );
    
    

blk_mem_gen_0 data_ram(
    step_clk,
    mem_write,
    alu_out,
    reg_read_data2,
    data_mem_out
  );
  
  wire vblank;
  
  ppu console_ppu(
    clk,
    alu_out,
    alu_out,
    reg_read_data2,
    mem_write,
    ,
    hsync,
    vsync,
    vblank,
    R,
    G,
    B
    );

    
    
    
    
endmodule
