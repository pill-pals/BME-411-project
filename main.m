width = 10;
height = 10;
delta = 0.1;
n = 4;

lights = getOptimalLightLocations(width, height, delta, n);
%lights = getOptimalLightLocationsAlt(width, height, n);
bri = calculateBrightnessArray(width, height, delta, lights, 1);
%syms x y k

%exlights = [2 3; 4 6];
%luminosity = 5;
%f = luminosity/(4 * pi * ((x - exlights(1,k))^2 + (y - exlights(2,k))^2)^(1/2))
%lightsurface = sum(f,k,1:2)

%fsurf(lightsurface,[0 width 0 height])
% get optimal locations for light sources n = x
  % minimize the largest square distance from light 
  % return that distance
% calculate minimum luminance required to light room
  % inputs: distance, lux threshold
% calculate cost = x * lightCost(luminosity)
%[X,Y] = meshgrid(0:delta:width,0:delta:height)
%Z = luminosity/(4 * pi * ((X - 2)^2 + (Y - 2)^2)^(1/2))
%surf(X,Y,Z)
h = imagesc(bri,[0 0.5])
colorbar