function status = pic_to_mem(pic, index_start, output_path)

    fid = fopen(output_path,'a');
    i = index_start;
    pic2(:,1,:) = pic(:,16,:);
    pic2(:,2,:) = pic(:,1,:);
    pic2(:,3,:) = pic(:,2,:);
    pic2(:,4,:) = pic(:,3,:);
    pic2(:,5,:) = pic(:,4,:);
    pic2(:,6,:) = pic(:,5,:);
    pic2(:,7,:) = pic(:,6,:);
    pic2(:,8,:) = pic(:,7,:);
    pic2(:,9,:) = pic(:,8,:);
    pic2(:,10,:) = pic(:,9,:);
    pic2(:,11,:) = pic(:,10,:);
    pic2(:,12,:) = pic(:,11,:);
    pic2(:,13,:) = pic(:,12,:);
    pic2(:,14,:) = pic(:,13,:);
    pic2(:,15,:) = pic(:,14,:);
    pic2(:,16,:) = pic(:,15,:);
    
    for x = 1:16
        for y = 1:16
            
            r = pic2(x,y,1);
            g = pic2(x,y,2);
            b = pic2(x,y,3);
            
            
            
            hex = [lower(dec2hex(r)),lower(dec2hex(g)),lower(dec2hex(b))];
            %fprintf('R: %d G: %d: B: %d  hex: %s\n', r, g, b, hex);
            fprintf(fid,'%s\n', hex);
            
            %fprintf('data[%d] = %s;\n', (y-1) * 16 + x);
            i = i+1;
        end
    end
    fclose('all');
    status = 1;
   % pic
end