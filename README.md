# Homebew Console
Homebrew Game Console Written in Verilog for Basys 3 FPGA
Alot of inspiration taken from the NES to learn how a console like this functions

 CPU
 -
 - Yet to be created
 - Plans:
   - 16 Registers
   - custom 16 bit RISC CPU derived from NEU DLD lab's (EECE2323) CPU
   - 50kB dedicated addressable RAM
   - Memory mapped VRAM display tables and other PPU registers
   - Memory mapped I/O for controllers
   - Memory mapped APU (Audio processing unit) registers

PPU (Picture Processing Unit)
-
 - Tile based ppu with ~150kB graphics ROM organized into 3 50k tilesets for overlaying layers
 - Each tile is 16x16 pixels with 12 bits of color (4 each R,G,B)
 - 128 addressible tiles per tileset per layer
 - screen displays via VGA in 40x30 tile configuration
 - each display layer is 160x30 tiles total (4800 addressible tiles), with ability to offset each layer 0-120 for display (4 "total screens")
 - ability for transparency between layers is predefined in hardware overlay > foreground > background
 - Plans
	  - Add sprite support
	  - create registers to hold all main input values
		  - allow these registers to be memory mapped from the CPU
	  -	Make Display memory addressable by CPU

APU (Audio Processing Unit)
-
- yet to be created
 - Last priority
 - Plans:
	 - ROM with certain number of tracks of background music
		 - playable, pausable, and switchable by the CPU
	 - memory addressable registers or something to play certain amount of sound effects which overpower the music
	 - FPGA is digital device, so either all music will have to be generated with buzzer-style sound via PWM like playTone() on arduino or I'll have to research how to both generate digital music with an FPGA and convert back to analog (which i think involves a low pass filter, meaning i really should have paid more attention in Circuits)

Additional plans
-
- Compatible with NES controllers (need to source ports from EBAY)
	- possibly easier to use arduino to process the input and feed back into fpga
	- 2 players at least possible via hardware
-  3d print/lasercut a case when i get back to campus
- have fun

Resources I've used
-
- [Great video explaining NES Architecture by Michael Chiaramonte (No relation)](https://www.youtube.com/watch?v=XwGj1ciSAtw)
- [Basys 3 Manual by Digilent](https://reference.digilentinc.com/_media/basys3:basys3_rm.pdf)
- [VGA Reference by Digilent](https://learn.digilentinc.com/Documents/269)
- [Awesome intro FPGA/Verilog Blog by Will Green](https://timetoexplore.net/)
- [NES Documentation by Patrick Diskin](http://nesdev.com/NESDoc.pdf)
