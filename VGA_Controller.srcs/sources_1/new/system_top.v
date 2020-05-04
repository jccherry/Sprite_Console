`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2020 08:47:30 PM
// Design Name: 
// Module Name: system_top
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

module system_top(
    input sys_clk,
    input sw,
    input snes_data_in,
    //output reg led_out,
    output snes_clk,
    output snes_latch,
    output [11:0] snes_data_out,
    output hsync,
    output vsync,
    output [3:0] R,
    output [3:0] G,
    output [3:0] B
    );
    
    
    wire clk;
    
    clock_divider clk_div(
    sys_clk,
    clk
    );
    
    wire wvb;
    wire vblank;
    
    wire [11:0] snes_data;
    reg [11:0] snes_data_reg;
    
    snes_controller ctrl(
    clk,
    sw,
    snes_data_in,
    snes_clk,
    snes_latch,
    snes_data
    );
    
    assign snes_data_out = snes_data_reg;
    
    always@(posedge vblank)
    begin
        snes_data_reg = snes_data;
    end
    
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
wire [11:0] program_line;
/*
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
program_line,
instruction,
step_clk
);*/


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
    opcode,
    wvb
    );
    
    wire data_ram_write;
    wire ppu_ram_write;
    
    demux_1_to_2 demux(
    mem_write,
    alu_out[14],
    data_ram_write,
    ppu_ram_write
    );


    blk_mem_gen_0 data_ram(
    step_clk,
    data_ram_write,
    alu_out,
    reg_read_data2,
    data_mem_out
    );
  
  
  
  ppu console_ppu(
    clk,
    step_clk,
    alu_out,
    alu_out,
    reg_read_data2,
    ppu_ram_write,
    ,
    hsync,
    vsync,
    vblank,
    R,
    G,
    B
    );
    
    wait_vb_interrupt wvb_int(
    clk,
    vblank,
    wvb,
    step_clk
    );
    
    
    program_memory #("program.mem") program_mem
    (
    program_line,
    instruction
    );
    
    program_counter program_counter(
    step_clk,
    instr_i,
    alu_take_branch,
    program_line
    );
    
    
    
    
    
    
endmodule
