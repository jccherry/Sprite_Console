# Sprite
The Sprite is a homebrew game console written in Verilog for a Basys 3 FPGA

 CPU
 -
  - 16 bit RISC cpu based on MIPS architecture
  - 32 registers
  - Memory mapped VRAM and Controller Registers
  - 32 bit instruction word size
  - 16kB instruction memory in 4096 maximum lines for one program

PPU (Picture Processing Unit)
-
 - Tile based ppu with ~150kB graphics ROM organized into 3 ~50kB tilesets for overlaying layers
 - Each tile is 16x16 pixels with 12 bits of color (4 each R,G,B)
 - 128 unique tiles per tileset per layer
 - screen displays via VGA in 40x30 tile configuration
 - 7 individual sprites can be rendered at a time, can hold 8 unique sprites per slot
 - 32 registers control offsets of overlaying backgrounds and sprite positions/enabled status/enabled sprite texture address
 - all PPU memory and registers are memory mapped from the CPU from address (decimal) 16384 -> 30819

Todo (listed mostly in order of importance but hey who knows what order its gonna get done):
-
 - figure out audio processing unit and audio output
 - finish assembler for custom ISA assembly language
 - get SD card working to load game into memory so i don't have to regenerate the bitstream with initialized memory values
 - create custom enclosure with two controller ports, VGA and HDMI Output (get better vga-hdmi converter), and lcd screen controlled by embedded arduino
 - <b>CREATE DOCUMENTATION FOR EVERYTHING FROM THE HARDWARE DESIGN TO THE ISA</b>
 - get arduino to emulate snes controller inputs to allow for bluetooth controller support OR barebones internet connectivity in the future (something like two consoles send controller inputs and basic data from player one to player two, and theoretically both games would see the exact same thing in something basic like pong



Resources I've used
-
- [SNES Controller Core by Fabio Andres (the one i designed was super buggy lol)](http://www.fpgalover.com/ip-cores/snes-controller-core)
- [Great video explaining NES Architecture by Michael Chiaramonte (No relation)](https://www.youtube.com/watch?v=XwGj1ciSAtw)
- [Basys 3 Manual by Digilent](https://reference.digilentinc.com/_media/basys3:basys3_rm.pdf)
- [VGA Reference by Digilent](https://learn.digilentinc.com/Documents/269)
- [Awesome intro FPGA/Verilog Blog by Will Green](https://timetoexplore.net/)
- [NES Documentation by Patrick Diskin](http://nesdev.com/NESDoc.pdf)
- [Tiled Map editor for creating game maps](https://www.mapeditor.org/)
- Northeastern University EECE2323's MIPS CPU (didn't get to complete the lab bc of corona but i recreated it, modified to suit my needs)
- [Northeastern University CS3650 for learning assembly and reference](http://www.ccs.neu.edu/home/ntuck/courses/2020/01/cs3650/)
