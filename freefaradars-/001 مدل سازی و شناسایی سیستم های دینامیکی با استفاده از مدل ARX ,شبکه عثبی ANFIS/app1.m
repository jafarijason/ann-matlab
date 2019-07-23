clc;
clear;
close all;

% Dynmaics Function
f=@(t,x) [x(2)
          x(3)
          -10*x(3)-10*x(2)-5.5*x(1)-5*x(1)^3+randn];
      
Tf=5;
dt=0.01;
t=0:dt:Tf;

x0=[0 0 1];

[t, x]=ode45(f,t,x0);

y=x(:,1);

save('mydata.mat');

figure (1);
plot(t,x);



figure (1);
plot(t,y);