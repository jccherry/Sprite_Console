module pixel_coords_to_addr(
    input [3:0] pixel_x,
    input [3:0] pixel_y,
    output [7:0] pixel_addr
    );
    
    assign pixel_addr = pixel_y*16+pixel_x;
endmodule
