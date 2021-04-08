data = importdata('LiBatteryData.mat');
xData = data.time;
yData_C1 = data.current_C1;
yData_2C1 = data.current_2C1;
yData_4C1 = data.current_4C1;

plot(xData, yData_C1,'og');
hold on 
plot(xData, yData_2C1, 'sb');
plot(xData, yData_4C1, 'xk');
xlabel('time in h');
ylabel('current in v');
title('characteristic line: discharging Li-Ion Battery (temperature = 25°)')
legend('LiBattery C_1','LiBattery 2C_1','LiBattery 4C_1')

