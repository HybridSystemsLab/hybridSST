clc
clear all
close all

%% set the maximal number of iterations as infinite
K = inf;

%% set the argument of the switch command to run different examples.

switch(1)
    case 1 
        loadfilepath = 'bouncingball';
    case 2 
        loadfilepath = 'collisiondrone';
end
addpath(loadfilepath);

%% initialize the model parameters

initialization;

%% algorithm parameters

AlgorithmInit;

pn = 0.5;

%% HySST exploration process
tic
for k = 1:K
    n = rand;
    if (n < pn)
        x_rand = sampleInC(N);
        [T, I_new, isextended, edge_map, reachedset, S, x_new, psi_new, V_active, V_inactive, I_map] = extend(T, x_rand, edge_map, reachedset, 0, S, delta_bn, delta_s, V_active, V_inactive, I_map);
    else
        x_rand = sampleInD(N);
        [T, I_new, isextended, edge_map, reachedset, S, x_new, psi_new, V_active, V_inactive, I_map] = extend(T, x_rand, edge_map, reachedset, 1, S, delta_bn, delta_s, V_active, V_inactive, I_map);
    end
    if isextended && Xf(x_new)
        t = toc
        fprintf('Find the solution!\n')
        postprocess;
        return;
    end
end

fprintf('Fail to find the solution!\n')