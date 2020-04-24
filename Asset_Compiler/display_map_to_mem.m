function success = display_map_to_mem(path, output_path)
    success = 1;
    
    display_map = importdata(path);
    fid = fopen(output_path,'w');
    dims = size(display_map);
    count = 0;
    
    for row = 1:dims(1)
        for column = 1:dims(2)
            fprintf(fid,'%s\n',dec2bin(display_map(row,column), 7));
            count = count + 1;
        end
    end
    fclose('all');
end