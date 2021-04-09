clear; clc; close all;

x0 = 10;
maxIter = 30;
xeps = 1e-8;
feps = 1e-8;

[xZero, abortFlagg, iters] = myNewton('Function',@myPoly,...
    'LivePlot','on');