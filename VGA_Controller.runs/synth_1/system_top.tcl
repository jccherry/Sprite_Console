# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param chipscope.maxJobs 2
set_param synth.incrementalSynthesisCache C:/Users/jc170/AppData/Roaming/Xilinx/Vivado/.Xil/Vivado-12404-DESKTOP-6IO763U/incrSyn
set_param xicom.use_bs_reader 1
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.cache/wt} [current_project]
set_property parent.project_path {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.xpr} [current_project]
set_property XPM_LIBRARIES XPM_MEMORY [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
set_property ip_output_repo {c:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_mem {
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/imports/bg_display_map.mem}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/imports/foreground_display_map.mem}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/imports/overlay_tileset.mem}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/imports/foreground_tileset.mem}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/imports/sprite1.mem}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/imports/background_tileset.mem}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/imports/overlay_display_map.mem}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/imports/Desktop/program.mem}
}
read_verilog -library xil_defaultlib {
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/DFF.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/SNES_FSM.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/imports/new/alu_regfile.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/clock_div.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/controller_reg_mux.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/coords_to_tables.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/counters_to_coords.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/display_memory.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/display_mux.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/hvcounter.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/hvsync.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/instruction_decoder.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/mux_2_to_1.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/pixel_coords_to_addr.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/ppu.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/ppu_memory_map.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/ppu_regfile.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/program_memory.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/rgb_slicer.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/sprite_memory.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/sprite_rgb_combinator.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/tile_coords_to_addr.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/tileset_memory.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/transparency_detection.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/vblank.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/wait_vb_interrupt.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/system_top.v}
}
read_ip -quiet {{C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.xci}}
set_property used_in_implementation false [get_files -all {{c:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_ooc.xdc}}]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/constrs_1/new/vgaconstraints.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/constrs_1/new/vgaconstraints.xdc}}]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top system_top -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef system_top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file system_top_utilization_synth.rpt -pb system_top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
