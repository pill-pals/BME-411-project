function lightsGuess = createInitialLightsGuess(width, height, n)
    grid = [0 0];
    gridIncrement = [floor(width/min(width,height)) floor(height/min(width,height))];
    
    lightsGuess = zeros(n,2);
    
    while( grid(1)*grid(2) < n )
        grid = grid + gridIncrement;
    end
    
    count = 1;
    for i = 1:grid(1)
        for j = 1:grid(2)
            lightsGuess(count,1) = i * width/grid(1) - width/(2*grid(1));
            lightsGuess(count,2) = j * height/grid(2) - height/(2*grid(2));
            
            count = count + 1;
            if (count > n)
                break
            end
        end
        if (count > n)
            break
        end
    end
end

