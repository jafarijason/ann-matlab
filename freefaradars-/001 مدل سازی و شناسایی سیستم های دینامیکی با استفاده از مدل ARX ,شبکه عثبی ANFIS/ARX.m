 clc;
 clear;
 close all;
 % Dynamic Function
  f=@(t,x) [x(2)
            x(3)
            -10*x(3) - 10 * x(2) -5.5*x(1)-5*x(1)^3+randn];
        
 Tf = 5  ;
 dt = 0.01;
 t=0:dt:Tf;
 
 x0=[0 0 1]';
 
[t,x]= ode45(f,t,x0);
 