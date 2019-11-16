function newLights = moveLights(lights,mins)
    newLights = lights;
    %loop n times for each light
    for n = 1:size(lights,1)
        %loop m times for each light
        moveVec = [0 0];
        for m = 1:size(mins,1)
            %move light inverse square for x and y towards light
            dist=getDistance(lights(n,1),mins(m,1),lights(n,2),mins(m,2));
            moveVec = moveVec - 0.01*dist*(lights(n,:)-(mins(m,1:2)))./(size(mins,1)*mins(m,3)^2*500000);
              disp("min:   "+mins(m,3))
              disp("moveVec")
              %disp(- 0.01*dist*(lights(n,:)-(mins(m,1:2)))./size(mins,1))
%             if (lights(n,1) < mins(m,1))
%                 newLights(n,1) = newLights(n,1) + (mins(m,1) - lights(n,1))/size(mins,1);%+ 0.5/size(mins,1)*(abs(mins(m,1) - lights(n,1)) + 1);%^(2);
%             else
%                 newLights(n,1) = newLights(n,1) + (mins(m,1) - lights(n,1))/size(mins,1);%- 0.5/size(mins,1)*(abs(mins(m,1) - lights(n,1)) + 1);%^(2);
%             end
%              
%             if (lights(n,2) < mins(m,2))
%                 newLights(n,2) = newLights(n,2) + (mins(m,2) - lights(n,2))/size(mins,1);%+ 0.5/size(mins,1)*(abs(mins(m,2) - lights(n,2)) + 1);%^(2);
%             else
%                 newLights(n,2) = newLights(n,2) + (mins(m,2) - lights(n,2))/size(mins,1);%- 0.5/size(mins,1)*(abs(mins(m,2) - lights(n,2)) + 1);%^(2);
%             end
        end
        newLights(n,:) = newLights(n,:) + moveVec;
    end
end

