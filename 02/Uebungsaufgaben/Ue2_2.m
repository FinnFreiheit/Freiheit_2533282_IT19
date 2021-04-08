data= importdata('CompanySalesData.mat');
xData = data.year;
yturnover = data.turnover;
ycosts = data.costs;
yprofit = data.profit;
yData = [yturnover; ycosts; yprofit];
bar(xData, yData, 'stacked')
facecolor