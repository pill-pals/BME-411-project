function [lights lightsHist] = getOptimalLightLocationsAlt(width, height, n)
    %create inital guess for light locations
    newLights = createInitialLightsGuess(width, height, n);
    
    % movementSettlingPoint is where procedure terminates. Set based on room size
    movementSettlingPoint = min(width, height)/100000;
    % movementVal is the total movement in the system of all moving lights
    % set to > movementSettlingPoint to simulate a do while
    movementVal = movementSettlingPoint + 1;
    
    %experimental multiplier to repulsors, inverse scales with how many lights in room density
    mul = (width * height)/(10 * n);
    
    histCount = 1;
    movementValHistory = (1:50);
    while (movementVal >= movementSettlingPoint || range(movementValHistory(end-50+1:end)) >= movementSettlingPoint)
        lightsHist(:,:,histCount) = newLights;
        histCount = histCount + 1;
        lights = newLights;
        %disp(lights)
        movementVal = 0;
        for j = 1:n
            % moveVec is how much and what direction light j will move this step 
            moveVec = [0 0];
            for k = 1:n
                %TEMP IGNORE: moveVec = moveVec + [1 1]/((n+2)*(lights(j,:) - lights(k,:) + [1 1]));
              
                if (getDistance(lights(j,1),lights(k,1),lights(j,2),lights(k,2)) ~= 0)
                    % each light will contribute to the moveVec by repulsing the light
                    moveVec = moveVec + mul*(lights(j,:)-lights(k,:))/getDistance(lights(j,1),lights(k,1),lights(j,2),lights(k,2))^3;
                elseif (j ~= k)
                    % if two lights are on the same spot they are moved slightly apart randomly for this step
                    moveVec = moveVec + [rand(1)*width/10000 rand(1)*height/10000];
                end
            end
            % the walls of the room will also repulse the light
            moveVec(1) = moveVec(1) + mul*((lights(j,1)-0)/abs(lights(j,1)-0))/((lights(j,1)-0)^2);
            moveVec(1) = moveVec(1) + mul*((lights(j,1)-width)/abs(lights(j,1)-width))/((lights(j,1)-width)^2);
            moveVec(2) = moveVec(2) + mul*((lights(j,2)-0)/abs(lights(j,2)-0))/((lights(j,2)-0)^2);
            moveVec(2) = moveVec(2) + mul*((lights(j,2)-height)/abs(lights(j,2)-height))/((lights(j,2)-height)^2);
            
            %disp(moveVec)
            
            % move lights based on the moveVec
            newLights(j,:) = lights(j,:) + moveVec;
            
            % if a light is completely outside a wall, it is moved back within the walls
            if (newLights(j,1) < 0)
                newLights(j,1) = width/10;
            end
            if (newLights(j,1) > width)
                newLights(j,1) = width - width/10;
            end
            if (newLights(j,2) < 0)
                newLights(j,2) = height/10;
            end
            if (newLights(j,2) > height)
                newLights(j,2) = height - height/10;
            end
            
            % the movementVal is calculated for this step as the sum of all light movements 
            movementVal = movementVal + (moveVec(1)^2 + moveVec(2)^2)^0.5;
        end
        % normalize the movementVal by number of lights
        movementVal = movementVal / n;
        movementValHistory(end+1) = movementVal;
    end
end

