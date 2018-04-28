data=load("data.out")
time=data(:,1);
a1=data(:,2);
a2=data(:,3);
a3=data(:,4);
a4=data(:,5);

m=length(a1);

plot(time,a1,'-');
xlabel('Time'); ylabel('Memory Usage');
title('Comparative memory usages');
hold on;
plot(time,a2,'-');
plot(time,a3,'-');
plot(time,a4,'-');
legend('App1','App2','App3','App4');
fprintf("Comparative memory usage");
hold off;
fprintf("\n");
fprintf("Press enter to continue:");
pause;

[f,x]=cdf(a4);
plot(x,f);
ylabel('CDF'); xlabel('data points');
title('CDF');
pause;
