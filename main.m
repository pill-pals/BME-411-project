%PROBELM INPUT PARAMETERS
width = 10;
height = 10;
delta = 0.1;
%n = 4;
luxThresh = 1;
lumFunc = @(lum)20+1.2^lum;
costFunc = @(n,lum)n*lumFunc(lum);

%[cost, lights] = getLowestCostForNLights(width, height, n, luxThresh, delta, costFunc);

costs = [];
startN = 12;
endN = 40;
for i = startN:endN
    costs(i) = getLowestCostForNLights(width, height, i, luxThresh, delta, costFunc);
    i
end

plot(costs)
xlim([startN endN])
%bri = calculateBrightnessArray(width, height, delta, lights, 1);
%h = imagesc(bri,[0 0.5])
%colorbar


%EXPERIMENT USING A SYMS EQUATION
%syms x y k

%exlights = [2 3; 4 6];
%luminosity = 5;
%f = luminosity/(4 * pi * ((x - exlights(1,k))^2 + (y - exlights(2,k))^2)^(1/2))
%lightsurface = sum(f,k,1:2)
%[X,Y] = meshgrid(0:delta:width,0:delta:height)
%Z = luminosity/(4 * pi * ((X - 2)^2 + (Y - 2)^2)^(1/2))
%surf(X,Y,Z)

%fsurf(lightsurface,[0 width 0 height])
