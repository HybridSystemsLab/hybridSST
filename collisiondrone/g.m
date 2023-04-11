function xplus = g(x, u)
%--------------------------------------------------------------------------
% Matlab M-file Project: HyEQ Toolbox @  Hybrid Systems Laboratory (HSL),
% https://hybrid.soe.ucsc.edu/software
% http://hybridsimulator.wordpress.com/
% Filename: g_ex1_2.m
%--------------------------------------------------------------------------
% Project: Simulation of a hybrid system (bouncing ball)
% Description: Jump map
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%   See also HYEQSOLVER, PLOTARC, PLOTARC3, PLOTFLOWS, PLOTHARC,
%   PLOTHARCCOLOR, PLOTHARCCOLOR3D, PLOTHYBRIDARC, PLOTJUMPS.
%   Copyright @ Hybrid Systems Laboratory (HSL),
%   Revision: 0.0.0.3 Date: 05/20/2015 3:42:00

% state
x1 = x(1);
x2 = x(2);
x3 = x(3);
x4 = x(4);
x5 = x(5);
x6 = x(6);

e = 0.43;
kappa = 0.20;

if collisionregion1(x, 0) || collisionregion2(x, 0) ...
        || collisionregion3(x, 0) || collisionregion4(x, 0)
    vn = x4;
    vt = x3;
    vnplus = -e*vn;
    vtplus = vt + kappa * (- e - 1)*atan(vt/vn)*vn;
    
    xplus = [x1; x2; vtplus; vnplus; 0; 0];
else
    vn = x3;
    vt = x4;
    
    vnplus = -e*vn;
    vtplus = vt + kappa * (- e - 1)*atan(vt/vn)*vn;
    
    xplus = [x1; x2; vnplus; vtplus; 0; 0];
end






end