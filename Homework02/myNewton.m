function [xZero, abortFlagg, iters] = myNewton(varargin)
% myNewton - Calculation of intersection with the x-axis,using Newton
% algorithm
%
% Syntax:  [output1,output2,output3] = function_name(input1,input2,input3,...
%                                             input4,input5,input6,input7)
%
% Inputs:
%    Function - Function for the intersection to be calculated
%    Derivative - optional: first derivative of the Function
%    StartValue - optional: Start x-Value, zero if nothing else given.
%    MaxIters - optional: maximale Iterations, 50 if nothing else given.
%    Feps - optional: termination condition,10^-6 if nothing else given.
%    Xeps - optional: termination condition,10^-6 if nothing else given.
%    LivePlot - optional: show Plotfigures.
%
% Outputs:
%    xZero - Number value of the calculated intersection with the x-axis
%    abortFlagg - String Value of with condition terminated
%    iters - Number Value, how many iterations until the programm
%    terminated
%
% Example: 
%    xZero = myNewton('Function',@function);
%    [xZero,abortFlagg,iters] = myNewton('Function',@function,'Derivative',@derivative)
%   
%
% Other m-files required: numDiff.m
% Subfunctions: numDiff.m
% MAT-files required: numDiff.m
%
% See also: numDiff,

% Author: Finn Freiheit 
% DHBW-Stuttgart
% March 2021; Last revision: 09-03-2021

%------------- BEGIN CODE --------------
%% Assign input variables

for i = 1:nargin
    if strcmp (varargin{i},'Function')
        func = varargin{i+1};
    elseif strcmp (varargin{i},'Derivative')
        dfunc = varargin{i+1};
        dfuncBool = 0;
    elseif strcmp (varargin{i},'StartValue')
        x0 = varargin{i+1};
    elseif strcmp (varargin{i},'MaxIter')
        maxIter = varargin{i+1};
    elseif strcmp (varargin{i},'Feps')
        feps = varargin{i+1};
    elseif strcmp (varargin{i},'Xeps')
        xeps = varargin{i+1};
    elseif strcmp (varargin{i},'LivePlot')
        livePlot = varargin{i+1};
    end 
end

%% Check whether there are input variables. If not, predefined ones are set

if ~exist('func','var')
    error('no valid function');
end

if ~exist('dfunc','var') % no need for additional flag
    % If there is no differential Funktion, the User is asked with differential algorithm
    % he whants to use. 
    answer = questdlg('wich kind of differential algorithm do you want to use? ', ...
            'Differential Menu', ...
            'Forward Differential','Backward Differential','Central Differential','Forward Differential');
        % Handle response
        switch answer
        case 'Forward Differential'
            methodFromMenu = 'forwardDiff';
        case 'Backward Differential'
            methodFromMenu = 'backwardDiff';
        case 'Central Differential'
            methodFromMenu = 'centralDiff';
        end
    disp(['Using ', methodFromMenu]);
end 

if ~exist('x0','var')
    x0 = 0;
    disp(['Using default x0 =  ', num2str(x0)]);
end %if - this is (old) bad style coming from c code. 

if ~exist('maxIter','var')
    maxIter = 50;
    disp(['Using default maxIter =  ', num2str(maxIter)]);
end %if

if ~exist('feps','var')
    feps = 1e-6;
    disp(['Using default Feps =  ', num2str(feps)]);
end %if

if ~exist('xeps','var')
    xeps = 1e-6;
    disp(['Using default Xeps =  ', num2str(xeps)]);
end %if


if ~exist('livePlot','var')
    livePlot = 'off';
    disp('Using default LivePlot =  off');
end %if

 

%% Generate the Plotfigure
if strcmp(livePlot,'on')
    h = figure('Name','Newton');
    ax1 = subplot(2,1,1);
    plot(ax1,0,x0,'bo');
    ylabel('');
    hold on;
    grid on;
    xlim('auto');
    ylim('auto');
    ax2 = subplot(2,1,2);
    semilogy(ax2,0,func(x0),'rx')
    ylabel('Function Value')
    hold on;
    grid on;
    xlim('auto');
    ylim('auto');
end%if

%% Calculate aproximated values with Newton-Function
xOld = x0; 
abortFlagg = 'maxIter';
for i = 1:maxIter
    f = func(xOld);
    if f < feps
        abortFlagg = 'feps';
        break; 
    end %if 
    
    % Use differential Funktion if given, if not use differential algorithm 
    if exist('dfunc','var')
        df = dfunc(xOld);
    else
        df = numDiff(func,xOld,methodFromMenu);
    end%if
    % avoid division by zero
    if df == 0
        abortFlagg = 'df = 0';
        break; 
    end%if 
    
    xNew = xOld  - f/df;
    
    if abs(xNew - xOld) < xeps
        abortFlagg = 'xeps';
        break;
    end%if
    
    xOld = xNew;
    
    if strcmp(livePlot,'on')
        plot(ax1,i,xNew,'bo');
        semilogy(ax2,i,func(xNew), 'rx');
        pause(0.05); 
    end%if
    
end %for
iters = i;
xZero = xNew;
    
end %function
%------------- END OF CODE --------------