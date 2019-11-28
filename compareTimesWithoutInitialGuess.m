width = 60;
height = 60;
startN = 1;
endN = 100;

guessTimes = [];
guessLocs = {};
for i = startN:endN
    tic;
    guessLocs{i} = getOptimalLightLocationsAlt(width, height, i);
    guessTimes(i) = toc;
    i
end

noGuessTimes = [];
noGuessLocs = {};
for i = startN:endN
    tic;
    noGuessLocs{i} = getOptimalLightLocationsWithoutGuess(width, height, i);
    noGuessTimes(i) = toc;
    i
end

figure
plot(guessTimes)
hold on
plot(noGuessTimes)
hold off
title('Convergence times with different initial guesses in 60m by 60m room')
ylabel('Convergence Time (s)')
xlabel('Number of lights')
xlim([startN endN])
