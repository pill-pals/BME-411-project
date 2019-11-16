function lights = getOptimalLightLocationsAlt(width, height, n)
    newLights = rand(n,2)*10;%[1 6; 6 6; 7 8; 2 4];
    %newLights = [2 2; 5 5; 8 8; 2 5; 2 8; 5 2; 5 8; 8 2; 8 5]
    %newLights = [6 6];
    %newLights = [2 3; 2 6; 2 9; 2 12; 2 15; 2 18; 2 21; 2 24; 2 27; 2 29; 5 3; 5 6; 5 9; 5 12; 5 15; 5 18; 5 21; 5 24; 5 27; 5 29; 8 3; 8 6; 8 9; 8 12; 8 15; 8 18; 8 21; 8 24; 8 27; 8 29]
    for i = 1:5000
        lights = newLights;
        disp(lights)
        for j = 1:n
            moveVec = [0 0];
            for k = 1:n
                %moveVec = moveVec + [1 1]/((n+2)*(lights(j,:) - lights(k,:) + [1 1]));
               
                if (getDistance(lights(j,1),lights(k,1),lights(j,2),lights(k,2)) ~= 0)
                    mul = 1; %~8 for n=4
                    moveVec = moveVec + mul*(lights(j,:)-lights(k,:))/getDistance(lights(j,1),lights(k,1),lights(j,2),lights(k,2))^3;
                else
                    moveVec = moveVec + [rand(1)*width/10000 rand(1)*height/10000];
                end
                %if ((lights(j,1)-lights(k,1)) ~= 0 && (lights(j,2)-lights(k,2)) ~= 0)
                %    moveVec(1) = moveVec(1) + 1/((n+2)*(lights(j,1)-lights(k,1)));
                %    moveVec(2) = moveVec(2) + 1/((n+2)*(lights(j,2)-lights(k,2)));
                %end
                disp(moveVec)
            end
            moveVec(1) = moveVec(1) + ((lights(j,1)-0)/abs(lights(j,1)-0))/((lights(j,1)-0)^2);
            moveVec(1) = moveVec(1) + ((lights(j,1)-width)/abs(lights(j,1)-width))/((lights(j,1)-width)^2);
            moveVec(2) = moveVec(2) + ((lights(j,2)-0)/abs(lights(j,2)-0))/((lights(j,2)-0)^2);
            moveVec(2) = moveVec(2) + ((lights(j,2)-height)/abs(lights(j,2)-height))/((lights(j,2)-height)^2);
            %moveVec(1) = moveVec(1) + 1/((n+2)*(lights(j,1)-0));
            %moveVec(2) = moveVec(2) + 1/((n+2)*(lights(j,2)-width));
            %moveVec(1) = moveVec(1) + 1/((n+2)*(lights(j,1)-0));
            %moveVec(2) = moveVec(2) + 1/((n+2)*(lights(j,2)-height));
            %moveVec = moveVec + [1 1]/((n+2)*(lights(j,:) - [0 lights(j,2)]));
            %moveVec = moveVec + [1 1]/((n+2)*(lights(j,:) - [width lights(j,2)]));
            %moveVec = moveVec + [1 1]/((n+2)*(lights(j,:) - [lights(j,1) 0]));
            %moveVec = moveVec + [1 1]/((n+2)*(lights(j,:) - [lights(j,1) height]));
            disp(moveVec)
            newLights(j,:) = lights(j,:) + moveVec;
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
        end
    end
end

