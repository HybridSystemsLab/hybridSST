function s = integral2ParseArgs(isImproper,nvArgs)
%INTEGRAL2PARSEARGS  Parse optional inputs to INTEGRAL2.

%   The first input, autoMethod, is the method to map 'auto' to. It is the
%   method to use by default or when the user-selected method is 'auto'.

%   Copyright 2008-2020 The MathWorks, Inc.

arguments
    isImproper (1,1) logical
    nvArgs.AbsTol (1,1) {validateAbsTol} = 1e-10
    nvArgs.RelTol (1,1) {validateRelTol} = 1e-6
    nvArgs.Method {validateMethod} = 'auto'
end

s = nvArgs;
s.Persistence = 1;
s.ThrowOnFail = false;
if strcmpi(s.Method,'auto')
    if isImproper
        s.Method = 'iterated';
    else
        s.Method = 'tiled';
    end
elseif isImproper && strcmpi(s.Method,'tiled')
    error(message('MATLAB:integral2:nonFiniteLimit'));
end
if strcmpi(s.Method,'iterated')
    s.integralOptions = integralParseArgs('AbsTol',s.AbsTol,'RelTol',s.RelTol);
    s.integralOptions.InitialIntervalCount = 3;
    s.integralOptions.Persistence = s.Persistence;
    s.integralOptions.ThrowOnFail = true;
end

%--------------------------------------------------------------------------
function validateAbsTol(x)
if ~(isfloat(x) && isreal(x) && x >= 0)
    % Example:
    % integral2(@(x,y)x+y,0,1,0,1,'AbsTol',-1)
    error(message('MATLAB:integral2:invalidAbsTol'));
end

%--------------------------------------------------------------------------
function validateRelTol(x)
if ~(isfloat(x) && isreal(x) && x >= 0)
    % Example:
    % integral2(@(x,y)x+y,0,1,0,1,'RelTol',-1)
     error(message('MATLAB:integral2:invalidRelTol'));
end

%--------------------------------------------------------------------------
function validateMethod(x)
if ~(strcmpi(x,'auto') || strcmpi(x,'tiled') || strcmpi(x,'iterated'))
     error(message('MATLAB:integral2:invalidMethod'));
end
