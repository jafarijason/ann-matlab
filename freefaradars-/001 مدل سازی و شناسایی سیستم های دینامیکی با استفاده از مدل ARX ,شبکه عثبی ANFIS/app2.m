clc;
clear;
close all;

load mydata;

% Prepare Identification Data
u=randn(size(y));
idd=iddata(y,u,dt);

% ARX Model
na=5;
nb=2;
nk=0;
model=arx(idd,[na nb nk]);

% Compare Model and Data
figure;
compare(idd,model);

% Residuals
figure;
resid(model,idd);
