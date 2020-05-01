vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm -64 -incr -sv "+incdir+../../../../VGA_Controller.srcs/sources_1/ip/vio_0/hdl/verilog" "+incdir+../../../../VGA_Controller.srcs/sources_1/ip/vio_0/hdl" \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2019.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../VGA_Controller.srcs/sources_1/ip/vio_0/hdl/verilog" "+incdir+../../../../VGA_Controller.srcs/sources_1/ip/vio_0/hdl" \
"../../../../VGA_Controller.srcs/sources_1/ip/vio_0/sim/vio_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

