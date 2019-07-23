clc;
clear;
close all;

load mydata;

%Prepare Data

d0y = y;
d1y=diff(d0y)/dt;
d2y=diff(d1y)/dt;
d3y=diff(d2y)/dt;

n=numel(d3y);

Inputs=[ d0y(1:n)  d1y(1:n) d2y(1:n)];

Targets = d3y;

% Train ANFIS Model

fis=genfis3(Inputs ,  Targets, 'sugeno' , 10);
anfis([Inputs Targets] , fis);

% Create  Model
f=@(t,x) [x(2)
          x(3)
          -10*x(3)-10*x(2)-5.5*x(1)-5*x(1)^3+randn];

fhat = @(t,x)[x(2)
              x(3)
              evalfis([x(1) x(2) x3()], fis) ];






