
levels = [1 2 3 4];
computeTime = [38.2 22.3 17.8 17.6];

computeTime = computeTime(1)./computeTime;


fs = 18;
lw = 2;
ms = 10;

plot(levels, computeTime, '*-b', 'MarkerSize', ms, 'LineWidth', lw);
xlabel('Number of multi-rate levels');
ylabel('Speed up');

aX = gca;
aX.XTick = [1, 2, 3, 4];
set(gca, 'FontSize', fs);
set(gcf, 'color', 'white');
print -dpdf timeVsLevels
