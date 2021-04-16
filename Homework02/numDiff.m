function y = numDiff(func,x,method)
% numDiff - The numerical approximation of the derivative of a function f: R → R
% at the point x0
% Syntax:  [output1] = function_name(input1,input2,input3)
%                                             
%
% Inputs:
%    func   - Function f
%    x      -  Point x0
%    method - choice between three approximation procedures
%           (Backwarddifferentiation: backwardDiff, Centraldifferentiation:
%           centralDiff, Forwarddifferentiation: forwarddiff)
%    
%
% Outputs:
%    y - numerical derivative at a point x
%
% Example: 
%    y = numDiff(func,10,'forwarddiff')
%    
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: (used in) myNewton

% Author: Finn Freiheit 
% DHBW-Stuttgart
% March 2021; Last revision: 09-03-2021

%------------- BEGIN CODE --------------
%% 
        hDiff = 1e-8;
        if strcmp(method,'backwardDiff')
            y = (func(x) - func(x - hDiff)) / hDiff;
       
        elseif strcmp(method,'centralDiff')
            hDiff = 1e-6;
            y = (func(x + hDiff) - func(x - hDiff)) / (2*hDiff);
     
        elseif strcmp(method,'forwardDiff')
            y = (func(x + hDiff) - func(x)) / hDiff;
        else
            error("Error: the Method is not valid");
        end %if   
end %numDiff
%------------- END OF CODE --------------