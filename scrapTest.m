width = 100;
height = 100;
delta = 0.1;
n = 100;

[lights, lightsHist] = getOptimalLightLocationsAlt(width,height,n);
%lights = createInitialLightsGuess(width, height, n)
bri = calculateBrightnessArray(width, height, delta, lights, 1);
h = imagesc(bri,[0 0.5])
colorbar