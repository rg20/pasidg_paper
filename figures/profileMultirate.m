% lev 1, 2, 3, 4
K = 130444;
ks = [130444 120484 60361 2920];
kids = [9960 60123 57441 2920];

% N1
global_rhs = 1.62;
local_rhs = [0 1.562 1.64 0.462];
local_update = [0.429 3.34 6.51 2.02];
local_gauss_update = [0 0.0531 0.092 0.164];

obtainLevelTime;
cudaK40N1 = levelTime;


global_rhs = 5.46;
local_rhs = [0 5.22 5.36 1.08];
local_update = [0.957 7.85 15.1 4.15];
local_gauss_update = [0 0.139 0.231 0.406];
obtainLevelTime;
cudaK40N2 = levelTime;


global_rhs = 14.8;
local_rhs = [0 14.1 14.3 2.29];
local_update = [1.82 15.8 31 7.71];
local_gauss_update = [0 0.301 0.476 0.862];
obtainLevelTime;
cudaK40N3 = levelTime;

global_rhs = 35.6;
local_rhs = [0 33.7 34.1 4.76];
local_update = [3.06 27.4 52.8 12.2];
local_gauss_update = [0 0.533 0.841 1.51];
obtainLevelTime;
cudaK40N4 = levelTime;

cudaK40N1 = cudaK40N1/sum(cudaK40N1);
cudaK40N2 = cudaK40N2/sum(cudaK40N2);
cudaK40N3 = cudaK40N3/sum(cudaK40N3);
cudaK40N4 = cudaK40N4/sum(cudaK40N4);


fs = 18;

str = {'L1: '; 'L2: '; 'L3: '; 'L4: '};

figure(1)
h = pie(cudaK40N1);
combinePerc(h, str);
set(gca, 'FontSize', fs);

print -dpdf profileMultirateCudaN1

figure(2)
h = pie(cudaK40N2);
combinePerc(h, str);
set(gca, 'FontSize', fs);

print -dpdf profileMultirateCudaN2

figure(3)
h = pie(cudaK40N3);
combinePerc(h, str);
set(gca, 'FontSize', fs);

print -dpdf profileMultirateCudaN3

figure(4)
h = pie(cudaK40N4);
combinePerc(h, str);
set(gca, 'FontSize', fs);

print -dpdf profileMultirateCudaN4