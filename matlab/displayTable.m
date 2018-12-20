%Display for the following runs:
%Mean Average Precision (MAP),
%precision at recall base (Rprec), 
%precision at 10 (P_10)

load('evalAllData.mat');
firstCol = [
    evalAllData(1).MAP;
    evalAllData(2).MAP;
    evalAllData(3).MAP;
    evalAllData(4).MAP
    ];

secondCol = [
    evalAllData(1).Rprec;
    evalAllData(2).Rprec;
    evalAllData(3).Rprec;
    evalAllData(4).Rprec
    ];
thirdCol  = [
    evalAllData(1).P_10;
    evalAllData(2).P_10;
    evalAllData(3).P_10;
    evalAllData(4).P_10
    ]; 
evalTable = table(firstCol, secondCol, thirdCol, 'VariableNames',{'MAP','Rprec','P_10'},'RowNames',{'Run1','Run2','Run3','Run4'})
