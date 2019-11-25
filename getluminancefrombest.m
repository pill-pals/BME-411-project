width = 10;
height = 10;
delta = 0.1;
luxThresh = 400;

ledNum = 27;
cflNum = 19;
incandescentNum = 35;
halogenNum = 13;

ledLights = getOptimalLightLocationsAlt(width, height, ledNum);
ledLowestPoint = getLowestLightCoords(width, height, ledLights, delta);
ledMinimumLum = determineMinimumLum(ledLights, ledLowestPoint, luxThresh)


cflLights = getOptimalLightLocationsAlt(width, height, cflNum);
cflLowestPoint = getLowestLightCoords(width, height, cflLights, delta);
cflMinimumLum = determineMinimumLum(cflLights, cflLowestPoint, luxThresh)


incandescentLights = getOptimalLightLocationsAlt(width, height, incandescentNum);
incandescentLowestPoint = getLowestLightCoords(width, height, incandescentLights, delta);
incandescentMinimumLum = determineMinimumLum(incandescentLights, incandescentLowestPoint, luxThresh)


halogenLights = getOptimalLightLocationsAlt(width, height, halogenNum);
halogenLowestPoint = getLowestLightCoords(width, height, halogenLights, delta);
halogenMinimumLum = determineMinimumLum(halogenLights, halogenLowestPoint, luxThresh)

