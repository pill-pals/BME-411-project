function minimumLum = determineMinimumLum(lights, lowestPoint, luxThresh)
    %initial lum guess    
    lum = 10;
    %errorThresh = 0.01;
    %brightness = getBrightnessAtPoint(lights, lum, lowestPoint);

    %while (abs(brightness - luxThresh) > errorThresh)
    %    if()
    %    brightness = getBrightnessAtPoint(lights, lum, lowestPoint);
    %end 
    
    fun = @(x)abs(getBrightnessAtPoint(lights, x, lowestPoint)-luxThresh);
    
    minimumLum = fminsearch(fun, lum);
end

