
offset = 91;
%todo change run file
pathName = '';
for runNumber = 1:4
    switch runNumber
        case 1
            pathName = '../trecEvalResults/evaluationRun1.txt';
        case 2
            pathName = '../trecEvalResults/evaluationRun2.txt';
        case 3
            pathName = '../trecEvalResults/evaluationRun3.txt';
        case 4
            pathName = '../trecEvalResults/evaluationRun4.txt';
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
    fclose(trecEvalResultFileRun1);
end


%create runID cell array
runID = {'run1', 'run2', 'run3', 'run4'};

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

%save runID, topicID and measure to mat file for ANOVA test
save('evalData.mat', 'runID', 'topicID', 'measureMAP', 'measureRPrec', 'measureP_10');  

