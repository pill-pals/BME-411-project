function brightness = getBrightnessAtPoint(lights, lum, point)
    brightness = 0;
    for k = 1:size(lights,1)
        distance = getDistance(point(1),lights(k,1),point(2),lights(k,2));
        brightness = brightness + getBrightness(distance, lum);
    end
end

