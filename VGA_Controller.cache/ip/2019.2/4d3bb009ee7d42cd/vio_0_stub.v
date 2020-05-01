// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Fri May  1 14:20:13 2020
// Host        : DESKTOP-6IO763U running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ vio_0_stub.v
// Design      : vio_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2019.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, probe_in0, probe_in1, probe_in2, probe_in3, 
  probe_in4, probe_in5, probe_in6, probe_in7, probe_in8, probe_in9, probe_out0, probe_out1)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_in0[16:0],probe_in1[16:0],probe_in2[16:0],probe_in3[15:0],probe_in4[15:0],probe_in5[0:0],probe_in6[0:0],probe_in7[15:0],probe_in8[16:0],probe_in9[5:0],probe_out0[31:0],probe_out1[0:0]" */;
  input clk;
  input [16:0]probe_in0;
  input [16:0]probe_in1;
  input [16:0]probe_in2;
  input [15:0]probe_in3;
  input [15:0]probe_in4;
  input [0:0]probe_in5;
  input [0:0]probe_in6;
  input [15:0]probe_in7;
  input [16:0]probe_in8;
  input [5:0]probe_in9;
  output [31:0]probe_out0;
  output [0:0]probe_out1;
endmodule
