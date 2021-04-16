%% runMyNewton: 
% runs the myNewton Funtion and visulaize the reults.
% See also: myNewton, myPoly, dmyPoly, 
% Author: Finn Freiheit 
% DHBW-Stuttgart
% March 2021; Last revision: 16-03-2021

%% mandatory
clear; clc; close all;

%% set variables
x0 = 10;
maxIter = 30;
xeps = 1e-8;
feps = 1e-8;

%% Function call
[xZero, abortFlagg, iters] = myNewton('Function',@myPoly,...
    'LivePlot','on');

%% END CODE