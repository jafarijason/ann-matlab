
%% Start of Program
clc
clear
close all

%% Data Loading
Data  =    load('C-DATA'); 
Train = Data.Train;
Test = Data.Test;
XtrUN = Train(:,2:end);
XtsUN = Train(:,2:end);
YtrUC = Train(:,1);
YtsUC = Train(:,1);
 
InputNum  =    size(XtrUN , 2);    
ClassNum = 5;
OutputNum =   ClassNum ;  

%% Normalization
MinXtrUN = min(XtrUN);
MaxXtrUN = max(XtrUN);

MinXtsUN = min(XtsUN);
MaxXtsUN = max(XtsUN);
 
Xtr =XtrUN ;
Xts =XtsUN; 
 
 

for ii = 1:InputNum
    Xtr ( : , ii) = Normalize_Fcn(XtrUN(:,ii) , MinXtrUN(ii) , MaxXtrUN(ii));
    Xts ( : , ii) = Normalize_Fcn(XtsUN(:,ii) , MinXtsUN(ii) , MaxXtsUN(ii));
end

%% Output Coding
Ytr = zeros(size(YtrUC,1),OutputNum);
Yts = zeros(size(YtsUC,1),OutputNum);
for ii = 1:size(Ytr,1)
    Ytr(ii,YtrUC(ii) )=1;
end
for ii = 1:size(Yts,1)
    Yts(ii,YtsUC(ii) )=1;
end

  

%% Network Structure
pr = [-1 1];
PR = repmat(pr,InputNum,1);



Network = newff(PR,[25 OutputNum ]  ,{'tansig'    'tansig'} );


%% Training
Network = train(Network ,Xtr',Ytr');

%% Assesment
YtrNet = sim(Network,Xtr')';
YtsNet = sim(Network,Xts')';

MSEtr = mse(YtrNet , Ytr) 
MSEts = mse(YtsNet , Yts) 

%% Get Classes
 Classes_tr =   ClacClasses_Fcn(YtrNet  );
 Classes_ts =   ClacClasses_Fcn(YtsNet  );
 

%% Display
 ConfMat_tr =  CalcConfMat_Fcn(YtrUC , Classes_tr,ClassNum);
 ConfMat_ts =  CalcConfMat_Fcn(YtsUC , Classes_ts,ClassNum);
 
 CCRtr = 100 * sum(diag(ConfMat_tr)) / (sum(sum(ConfMat_tr))) 
 CCRts = 100 * sum(diag(ConfMat_ts)) / (sum(sum(ConfMat_ts))) 

 