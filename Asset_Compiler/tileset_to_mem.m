function valid = tileset_to_mem(input_path, output_path, width, height)
   if (isfile(input_path))

        valid = 1;
        tileset = imread(input_path);
        
        tileset = uint16(tileset);
        %imshow(tileset);
        
        sidelength = 16;
        %width = 256;
        %height = 128;
        
        horz_slices = ceil(width/sidelength);
        vert_slices = ceil(height/sidelength);
        
        %mkdir('testdir');
        %cd(folder_name);
        %{
        fprintf('Slicing Images....');
        fprintf('%d x %d => %d x %d\n',width,height,horz_slices,vert_slices);
        fprintf('Side Length: %d', sidelength);
        %}
        
        fid = fopen(output_path,'w');
        fprintf(fid, '');
        fclose('all');
        data_index = 0;
        for row = 1:vert_slices
            for col = 1:horz_slices
                
                maxRow = row*sidelength;
                maxCol = col*sidelength;
                
                tile = tileset((maxRow-sidelength+1):maxRow,(maxCol-sidelength+1):maxCol,1:3);
                %backup = tile;
                tile = (tile*15/255);
                tile = ceil(tile);
                tile = uint8(tile);
                
                %{
                for x = 1:16
                    for y = 1:16
                        for color = 1:3
                            if (tile(x,y,color) == 16)
                                tile(x,y,color) = 15;
                            end
                        end
                    end
                end
                %}
                pic_to_mem(tile, data_index, output_path);
                data_index = data_index + 256;
                %file_name = "testdir/" + row + "_" + col + ".jpg";
               % fprintf("%s\n", file_name);
                %imwrite(backup, file_name);
                
                
            end
        end

    else
        if (~isfile(input_path))
            disp 'File not found'
        end
        valid = 0;
   end
   %fclose('all');
end