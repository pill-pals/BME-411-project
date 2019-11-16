function localMins = getLocalMins(width,height,delta,array)
    localMins = [];
    localMinCounter = 1;
    for i = 1:ceil(width/delta)
        for j = 1:ceil(height/delta)
            isMin = 1;
            if(i ~= 1)
                if(array(i,j)>=array(i-1,j))
                    isMin = 0;
                end
            end
            
            if(i ~= ceil(width/delta))
                if(array(i,j)>=array(i+1,j))
                    isMin = 0;
                end
            end
                
            if(j ~= 1)
                if(array(i,j)>=array(i,j-1))
                    isMin = 0;
                end
            end
            
            if(j ~= ceil(height/delta))
                if(array(i,j)>=array(i,j+1))
                    isMin = 0;
                end
            end
            
            if (isMin == 1)
                localMins(localMinCounter,1) = i*delta;
                localMins(localMinCounter,2) = j*delta;
                localMins(localMinCounter,3) = array(i,j);
                localMinCounter = localMinCounter + 1;  
            end
        end
    end
    
    
    
    
    
    %borderedBri = zeros(((width/delta) + 2),((height/delta) + 2));
%     for i = 1:((width/delta) + 2)
%         for j = 1:((height/delta) + 2)
%             if i == 1 || i == ((width/delta) + 2) || j == 1 || j == ((width/delta) + 2) 
%                 borderedBri(i,j) = 9999999;
%             else
%                 borderedBri(i,j) = array(i-1,j-1);
%             end
%         end
%     end
%     isMinColArray = islocalmin(borderedBri,1);
%     columnMins = borderedBri .* isMinColArray;
%     for j = 1:((height/delta) + 2)
%         columnMins(j,1) = 9999999;
%         columnMins(j,(height/delta) + 2) = 9999999;
%     end
%     isMinArray = islocalmin(columnMins,2);
%     %borderedBriMins = columnMins .* isMinArray;
%     localMinCounter = 1;
%     for i = 1:((width/delta) + 2)
%         for j = 1:((height/delta) + 2)
%             if (isMinArray(i,j)==1)
%                 localMins(localMinCounter,1) = i-1;
%                 localMins(localMinCounter,2) = j-1;
%                 localMinCounter = localMinCounter + 1;
%             end
%         end
%     end
%   %briMins = borderedBriMins(2:(width/delta) + 1,2:(height/delta) + 1)

end

