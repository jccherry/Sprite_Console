%compiles all visual assets into machine code to be imported into block RAM

path = '../VGA_Controller.srcs/sources_1/imports/';

%tilesets
tileset_to_mem('background_tileset.jpg',[path 'background_tileset.mem'],256,128);
tileset_to_mem('minecraft_tileset_transparent.jpg',[path 'foreground_tileset.mem'],256,128);
tileset_to_mem('minecraft_tileset_transparent.jpg',[path 'overlay_tileset.mem'],256,128);

%spritesets
tileset_to_mem('spriteset.jpg',[path 'sprite1.mem'],128,16);

%display maps
display_map_to_mem('background_map.xlsx',[path 'bg_display_map.mem']);
display_map_to_mem('foreground_map.xlsx',[path 'foreground_display_map.mem']);
display_map_to_mem('overlay_map.xlsx',[path 'overlay_display_map.mem']);
