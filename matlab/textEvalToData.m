
offset = 91;
%todo change run file
pathName = '';
for runNumber = 1:4
    switch runNumber
        case 1
            pathName = '../trecEvalResults/evauationRun0.txt';
        case 2
            pathName = '../trecEvalResults/evauationRun0.txt';
        case 3
            pathName = '../trecEvalResults/evauationRun0.txt';
        case 4
            pathName = '../trecEvalResults/evauationRun0.txt';
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
measure = ones(50,4);
for i = 1:50
    for j = 1:4
        measure(i,j)=run(j).topic(i).map;
    end
end

%save runID, topicID and measure to mat file for ANOVA test
save('evalData.mat', 'runID', 'topicID', 'measure');  

