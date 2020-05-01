-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
-- Date        : Fri May  1 11:27:46 2020
-- Host        : DESKTOP-6IO763U running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub {c:/Users/jc170/Documents/Vivado
--               Projects/Homebew_Console/VGA_Controller.srcs/sources_1/ip/vio_0/vio_0_stub.vhdl}
-- Design      : vio_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vio_0 is
  Port ( 
    clk : in STD_LOGIC;
    probe_in0 : in STD_LOGIC_VECTOR ( 16 downto 0 );
    probe_in1 : in STD_LOGIC_VECTOR ( 16 downto 0 );
    probe_in2 : in STD_LOGIC_VECTOR ( 16 downto 0 );
    probe_in3 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe_in4 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe_in5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe_in6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe_in7 : in STD_LOGIC_VECTOR ( 15 downto 0 );
    probe_in8 : in STD_LOGIC_VECTOR ( 16 downto 0 );
    probe_out0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out1 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    probe_out2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out3 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out4 : out STD_LOGIC_VECTOR ( 3 downto 0 );
    probe_out5 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out6 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out7 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    probe_out8 : out STD_LOGIC_VECTOR ( 4 downto 0 );
    probe_out9 : out STD_LOGIC_VECTOR ( 4 downto 0 )
  );

end vio_0;

architecture stub of vio_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe_in0[16:0],probe_in1[16:0],probe_in2[16:0],probe_in3[15:0],probe_in4[15:0],probe_in5[0:0],probe_in6[0:0],probe_in7[15:0],probe_in8[16:0],probe_out0[0:0],probe_out1[15:0],probe_out2[0:0],probe_out3[0:0],probe_out4[3:0],probe_out5[0:0],probe_out6[0:0],probe_out7[4:0],probe_out8[4:0],probe_out9[4:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "vio,Vivado 2019.2";
begin
end;
