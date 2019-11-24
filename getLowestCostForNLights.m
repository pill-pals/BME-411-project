function [cost, lights] = getLowestCostForNLights(width, height, n, luxThresh, delta, costFunc)
    % get optimal locations for light sources n = x
      %lights = getOptimalLightLocations(width, height, delta, n);
      lights = getOptimalLightLocationsAlt(width, height, n);
    % get lowest light point in the room with optimal lights
      lowestPoint = getLowestLightCoords(width, height, lights, delta);
    % calculate minimum luminance required to light lowest point to threshold
      minimumLum = determineMinimumLum(lights, lowestPoint, luxThresh);
    % calculate cost = x * lightCost(luminosity)
      cost = costFunc(n,minimumLum);
end

