
offset = 91;
%todo change run file
trecEvalResultFileRun1 = fopen('../trecEvalResults/evauationRun0.txt');
trecEvalResultFileRun2 = fopen('../trecEvalResults/evauationRun0.txt');
trecEvalResultFileRun3 = fopen('../trecEvalResults/evauationRun0.txt');
trecEvalResultFileRun4 = fopen('../trecEvalResults/evauationRun0.txt');
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
            warning('Unexpected run number.')       
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

measure = ones(50,4);
for i = 1:50
    for j = 1:4
        measure(i,j)=topic(i).map;
    end
end