function min = getMinValue(array)
    min = array(1,1);
    for i = size(array,1)
        for j = size(array,2)
            if(array(i,j) < min)
                min = array(i,j);
            end
        end
    end
end

