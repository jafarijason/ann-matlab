
%% Start of Program
clc
clear
close all

%% Data Loading
Data  =     xlsread('Data.xls'); 
X     =     Data(  : , 1:end-1);
Y     =     Data(  : , end) ;    



DataNum   =    size(X , 1); 
InputNum  =    size(X , 2);    
OutputNum =    size(Y , 2) ;  



%% Normalization
MinX = min(X);
MinY = min(Y);

MaxX = max(X);
MaxY = max(Y);

XN = X;
YN =Y;


for ii = 1:InputNum
    XN ( : , ii) = Normalize_Fcn(X(:,ii) , MinX(ii) , MaxX(ii));
end



for ii = 1:OutputNum
    YN ( : , ii) = Normalize_Fcn(Y(:,ii) , MinY(ii) , MaxY(ii));
end


%% Test and Train Data
TrPrecent = 80;
TrNum = round(DataNum * TrPrecent /100);
TsNum = DataNum -TrNum;

R = randperm (DataNum);

trIndex = R(1:TrNum);
tsIndex = R(1+TrNum : end);

Xtr = XN(trIndex , :);
Ytr = YN(trIndex , :);
Xts = XN(tsIndex , :);
Yts = YN(tsIndex , :);
 

%% Network Structure
pr = [-1 1];
PR = repmat(pr,InputNum,1);



Network = newff(PR,[5 OutputNum ]  ,{'tansig'    'tansig'} );


%% Training
Network = train(Network ,Xtr',Ytr');

%% Assesment
YtrNet = sim(Network,Xtr')';
YtsNet = sim(Network,Xts')';

MSEtr = mse(YtrNet , Ytr);
MSEts = mse(YtsNet , Yts);


%% Display

figure(1)
plot(Ytr,'-or')
hold on 
plot(YtrNet,'-sb')
hold off

figure(2)
plot(Yts,'-or')
hold on 
plot(YtsNet,'-sb')
hold off

figure(3)
t = -1:0.1:1;
plot(t,t,'b' , 'linewidth' , 2);
hold on
plot(Ytr,YtrNet ,'ok')
hold off



figure(4)
t = -1:0.1:1;
plot(t,t,'b' , 'linewidth' , 2);
hold on
plot(Yts,YtsNet ,'ok')
hold off

