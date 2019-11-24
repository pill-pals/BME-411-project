function coords = getLowestLightCoords(width, height, lights, delta)
    bri = calculateBrightnessArray(width, height, delta, lights, 1);
    mins = getLocalMins(width,height,delta,bri);
    coords = mins(1,:);
    for i = 1:size(mins,2)
        if mins(i,3) < coords(3)
            coords = mins(i,:);
        end
    end
end

