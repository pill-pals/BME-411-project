function lights = getOptimalLightLocations(width, height, delta, n)
   % place inital guess
   lights = [2 3; 7 6; 4 7; 6 2];
   flag = 1;
   prevMin = -1;
   counter = 1;
   while (flag == 1)
       disp("iteration:" + counter)
       disp(lights)
       % calculate brightness value of each location
       bri = calculateBrightnessArray(width, height, delta, lights, 1);

       % get all local mins
       localMins = getLocalMins(width, height, delta, bri);
        
       disp(localMins)
       % move all lights pulled by local min
       newLights = moveLights(lights,localMins);
       % if minimum birightness < old minimum birhgtness end and use previous lights else loop
       min = getMinValue(bri);
       if(counter > 200)%min < prevMin)
           flag = 0
       else
          lights = newLights;
          prevMin = min;
          counter = counter + 1;
       end
   end
end

