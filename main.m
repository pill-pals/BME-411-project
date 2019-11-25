%PROBELM INPUT PARAMETERS
width = 20;
height = 50;
delta = 0.1;
%n = 4;
run('fits.m')
luxThresh = 400;
costFunc = @(n,lum)n*(30+led(lum));
%[cost, lights] = getLowestCostForNLights(width, height, n, luxThresh, delta, costFunc);

costs = [];
startN = 40;
endN = 60;
for i = startN:endN
    costs(i) = getLowestCostForNLights(width, height, i, luxThresh, delta, costFunc);
    i
end

figure
plot(costs)
title('LED cost vs number of lights at optimal luminance for 10m by 10m room')
ylabel('Cost ($)')
xlabel('Number of lights')
xlim([startN endN])
LEDcosts = costs


costFunc = @(n,lum)n*(30+cfl(lum));
%[cost, lights] = getLowestCostForNLights(width, height, n, luxThresh, delta, costFunc);

costs = [];
startN = 50;
endN = 70;
for i = startN:endN
    costs(i) = getLowestCostForNLights(width, height, i, luxThresh, delta, costFunc);
    i
end

figure
plot(costs)
title('CFL cost vs number of lights at optimal luminance for 10m by 10m room')
ylabel('Cost ($)')
xlabel('Number of lights')
xlim([startN endN])

CFLcosts = costs


costFunc = @(n,lum)n*(30+halogen(lum));
%[cost, lights] = getLowestCostForNLights(width, height, n, luxThresh, delta, costFunc);

costs = [];
startN = 50;
endN = 70;
for i = startN:endN
    costs(i) = getLowestCostForNLights(width, height, i, luxThresh, delta, costFunc);
    i
end

figure
plot(costs)
title('Halogen cost vs number of lights at optimal luminance for 10m by 10m room')
ylabel('Cost ($)')
xlabel('Number of lights')
xlim([startN endN])

Halogencosts = costs


costFunc = @(n,lum)n*(30+incandescent(lum));
%[cost, lights] = getLowestCostForNLights(width, height, n, luxThresh, delta, costFunc);

costs = [];
startN = 60;
endN = 80;
for i = startN:endN
    costs(i) = getLowestCostForNLights(width, height, i, luxThresh, delta, costFunc);
    i
end

figure
plot(costs)
title('Incandescent cost vs number of lights at optimal luminance for 10m by 10m room')
ylabel('Cost ($)')
xlabel('Number of lights')
xlim([startN endN])

Incandescentcosts = costs

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
