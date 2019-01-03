
offset = 91;
pathName = '';
for runNumber = 1:4
    switch runNumber
        case 1
            pathName = '../../evaluations/evaluation_BM25_SL_PS_ignorelowidf.txt';
        case 2
            pathName = '../../evaluations/evaluation_TFIDF_SL_PS_ignorelowidf.txt';
        case 3
            pathName = '../../evaluations/evaluation_BM25_PS_ignorelowidf.txt';
        case 4
            pathName = '../../evaluations/evaluation_TFIDF_ignorelowidf.txt';
        otherwise
            warning('Unexpected run number.');       
    end
    trecEvalResultFileRun1 = fopen(pathName);
    evalData = textscan(trecEvalResultFileRun1,'%s %s %s');
    for i = 1:50 
        run(runNumber).topic(i).id = evalData{2}{1+offset*(i-1)};
        run(runNumber).topic(i).map = str2double(evalData{3}{4+offset*(i-1)});
        run(runNumber).topic(i).Rprec = str2double(evalData{3}{5+offset*(i-1)});
        run(runNumber).topic(i).P_10 = str2double(evalData{3}{20+offset*(i-1)});
    end
    evalAllData(runNumber).MAP = evalData{3}{4556}; %ALL MAP
    evalAllData(runNumber).Rprec = evalData{3}{4558}; %ALL Rprec
    evalAllData(runNumber).P_10 = evalData{3}{4573}; %ALL P_10
    fclose(trecEvalResultFileRun1);
end


%create runID cell array
runID = {'BM25_SL_PS','TFIDF_SL_PS','BM25_PS','TFIDF'};

%create topicID cell array
topicID = {};
for i = 1:50
    topicID{i} = run(1).topic(i).id;
end

%create measure matrix
measureMAP = ones(50,4);
measureRPrec = ones(50,4); 
measureP_10 = ones(50,4);
for i = 1:50
    for j = 1:4
        measureMAP(i,j)=run(j).topic(i).map;
        measureRPrec(i,j)=run(j).topic(i).Rprec;
        measureP_10(i,j)=run(j).topic(i).P_10;
    end
end

save('evalData.mat', 'runID', 'topicID', 'measureMAP', 'measureRPrec', 'measureP_10');  

%save ALL MAP,Rprec, P_10

save('evalAllData.mat', 'evalAllData');

