% model prameters
global TSPAN_f
global JSPAN_f
global TSPAN_g
global JSPAN_g
global options
global tol
global U_D;
global U_C;
global Tm;
global xf;

%% hybrid model parameters
% barx2 = 0.5;
tol = 0.1;

% HyEQ simulator parameters
Tm = 1;
DeltaJ = 1;

options = odeset('RelTol',1e-6,'MaxStep',.01);

TSPAN_f=[0 Tm];
JSPAN_f = [0 1];


TSPAN_g=[0 20];
JSPAN_g = [0 1];

%% Motion planning problem data

x0 = [14; 0];
xf = [10; 0];

%% input library

U_D = -4:.1:4;

U_C = 0;

%% SST
delta_bn = 0.4;
delta_s = 1;
