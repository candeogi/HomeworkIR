% Anova test and plots
% 
% Code thanks to Nicola Ferro (ferro@dei.unipd.it) from repository below:
% https://bitbucket.org/frrncl/ir-unipd/src

load('evalData.mat')

measure = measureRPrec;
m = mean(measure);

% sort in descending order of mean score
%[~, idx] = sort(m, 'descend');

% re-order runs by ascending mean of the measure
% needed to have a more nice looking box plot
%measureA = measure(:, idx);
%runIDA = runID(idx);

%ignoring sorting for this measure to match other graphs
measureA = measure;
runIDA = runID;

% perform the ANOVA
[~, tbl, sts] = anova1(measureA, runIDA, 'off');

% display the ANOVA table
tbl

% perform
c = multcompare(sts, 'Alpha', 0.05, 'Ctype', 'hsd'); 

% display the multiple comparisons
c

%% plots of the data

% get the Tukey HSD test figure
currentFigure = gcf;

    ax = gca;
    ax.FontSize = 20;
    ax.XLabel.String = 'Precision at Recall base (RPrec)';
    ax.YLabel.String = 'Run';

    currentFigure.PaperPositionMode = 'auto';
    currentFigure.PaperUnits = 'centimeters';
    currentFigure.PaperSize = [42 22];
    currentFigure.PaperPosition = [1 1 40 20];

print(currentFigure, '-dpdf', 'rprec-tukey.pdf');
    
    
% box plot
currentFigure = figure;
    % need to reverse the order of the columns to have bloxplot displayed
    % as the Tukey HSD plot
    boxplot(measure(:, end:-1:1), 'Labels', runID(end:-1:1), ...
        'Orientation', 'horizontal', 'Notch','off', 'Symbol', 'ro')
    
    ax = gca;
    ax.FontSize = 20;
    ax.XLabel.String = 'Precision at Recall base (RPrec)';
    ax.YLabel.String = 'Run';
    
    currentFigure.PaperPositionMode = 'auto';
    currentFigure.PaperUnits = 'centimeters';
    currentFigure.PaperSize = [42 22];
    currentFigure.PaperPosition = [1 1 40 20];

print(currentFigure, '-dpdf', 'rprec-boxplot.pdf');


