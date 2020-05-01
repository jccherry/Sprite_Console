vlib work
vlib activehdl

vlib activehdl/xpm
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../../VGA_Controller.srcs/sources_1/ip/vio_0/hdl/verilog" "+incdir+../../../../VGA_Controller.srcs/sources_1/ip/vio_0/hdl" \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../VGA_Controller.srcs/sources_1/ip/vio_0/hdl/verilog" "+incdir+../../../../VGA_Controller.srcs/sources_1/ip/vio_0/hdl" \
"../../../../VGA_Controller.srcs/sources_1/ip/vio_0/sim/vio_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

