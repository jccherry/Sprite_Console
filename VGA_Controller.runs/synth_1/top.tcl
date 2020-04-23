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
set_param synth.incrementalSynthesisCache C:/Users/jc170/AppData/Roaming/Xilinx/Vivado/.Xil/Vivado-2872-DESKTOP-6IO763U/incrSyn
set_param xicom.use_bs_reader 1
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.cache/wt} [current_project]
set_property parent.project_path {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
set_property ip_output_repo {c:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_mem {
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/imports/VGA Matlab Programs/foreground_display_map.mem}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/imports/VGA Matlab Programs/bg_display_map.mem}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/imports/VGA Matlab Programs/background_tileset.mem}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/imports/VGA Matlab Programs/foreground_tileset.mem}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/imports/VGA Matlab Programs/sprite1.mem}
}
read_verilog -library xil_defaultlib {
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/DFF.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/clock_div.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/coords_to_tables.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/counters_to_coords.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/display_memory.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/display_mux.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/hvcounter.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/hvsync.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/pixel_coords_to_addr.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/ppu.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/rgb_slicer.v}
  {C:/Users/jc170/Documents/Vivado Projects/7seg_controller/7seg_controller.srcs/sources_1/new/seven_segment.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/sprite_memory.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/tile_coords_to_addr.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/tileset_memory.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/transparency_detection.v}
  {C:/Users/jc170/Documents/Vivado Projects/Homebew_Console/VGA_Controller.srcs/sources_1/new/top.v}
}
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

synth_design -top top -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef top.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file top_utilization_synth.rpt -pb top_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
