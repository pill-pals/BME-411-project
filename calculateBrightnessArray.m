function array = calculateBrightnessArray(width, height, delta, lights, lum)
    array = createEmptyArray(width, height, delta);
    
    for i = 1:(ceil(width/delta))
        for j = 1:(ceil(height/delta))
            for k = 1:size(lights,1)
                distance = getDistance(i*delta,lights(k,1),j*delta,lights(k,2));
                array(i,j) = array(i,j) + getBrightness(distance, lum);
            end
        end
    end
end

