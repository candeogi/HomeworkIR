trecEvalResultFile = fopen('../trecEvalResults/evauationRun0.txt');

offset = 91;

evalData = textscan(trecEvalResultFile,'%s %s %s');
%topicParam = struct;
%topicParam.name = evalData{1}{4};
%topicParam.numTopic = evalData{2}{4};

topic(1).id = evalData{2}{1};
topic(1).map = str2double(evalData{3}{4});
topic(1).Rprec = str2double(evalData{3}{5});
topic(1).P_10 = str2double(evalData{3}{20});

topic(2).id = evalData{2}{1 + offset};
topic(2).map = str2double(evalData{3}{4+offset});
topic(2).Rprec = str2double(evalData{3}{5+offset});
topic(2).P_10 = str2double(evalData{3}{20+offset});

fclose(trecEvalResultFile);
