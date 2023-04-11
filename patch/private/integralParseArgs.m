function s = integralParseArgs(nvArgs)
%INTEGRALPARSEARGS  Parse optional arguments to INTEGRAL.

%   Copyright 2007-2020 The MathWorks, Inc.
arguments
    nvArgs.AbsTol (1,1) {validateAbsTol} = 1e-10
    nvArgs.RelTol (1,1) {validateRelTol} = 1e-6
    nvArgs.Waypoints {validateWaypoints} = []
    nvArgs.ArrayValued (1,1) {validateArrayValued} = false
end

s = nvArgs;
s.ArrayValued = logical(s.ArrayValued);
s.Rule = Gauss7Kronrod15;
s.InitialIntervalCount = 10;
s.Persistence = 1;
s.ThrowOnFail = false;

%--------------------------------------------------------------------------
function validateAbsTol(x)
if ~(isfloat(x) && isreal(x) && x >= 0)
    error(message('MATLAB:integral:invalidAbsTol'));
end

%--------------------------------------------------------------------------
function validateRelTol(x)
if ~(isfloat(x) && isreal(x) && x >= 0)
    error(message('MATLAB:integral:invalidRelTol'));
end

%--------------------------------------------------------------------------
function validateWaypoints(x)
if ~(isvector(x) || isequal(x,[])) || any(~isfinite(x))
    error(message('MATLAB:integral:invalidWaypoints'));
end

%--------------------------------------------------------------------------
function validateArrayValued(x)
if ~(islogical(x) || (isnumeric(x) && (x == 0 || x == 1)))
    error(message('MATLAB:integral:invalidArrayValued'));
end
