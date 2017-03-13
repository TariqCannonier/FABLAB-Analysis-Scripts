dbstop if error
% Used for debugging.  Determines if the directory housing Behvaioral data
% exists.  If not, it uses the directory stated here.
if ~exist('dataDir','var')
    % If Executing the script from the subdirectory
    %dataDir = '/Users/tc587/fMRI/ABCD/AWS_Data/aux_incoming_Nov_3rd_2016/';
    dataDir = '/Users/tc587/fMRI/ABCD/EmotionalNback/ABCDData/data';
    scriptDir = fullfile(pwd); % Notes the directory for supplemental scripts
    a = regexp(scriptDir,'/');
    outputDir = fullfile(scriptDir(1:a(6)),'Output/SST',datestr(now,'yyyymmdd'));
end

EventName = 'baseline_year_1_arm_1'; % determines the timeline for the assessment (i.e. baseline_year_1_arm_1')
TaskName = 'nback-wm-exported_'; % Targets the nback task
dateVar = datestr(now,'yyyymmdd');

t0 = datetime('now','Format','HH:mm:ss.SSS'); % Mark script runtime

% Navigate to main directory
if ~exist(outputDir,'dir')
    mkdir(outputDir); % Makes baseDir if it does not already exist
end

%% Construct SST 
fidSST = fopen(fullfile(outputDir,['StopSignalABCD_',dateVar,'.csv']),'w');

% List of ALL output variables
condsSST = {'Site';	'Subject'; 'Go_Correct: Run 1 Count';...
    'Go_Correct: Run 1'; 'Mean RT'; 'Go_Correct: Run 1 SD RT';...
    'Go_Correct: Run 2 Count'; 'Go_Correct: Run 2 Mean RT';...
    'Go_Correct: Run 2 SD RT'; 'Go_Correct: Total Count';...
    'Go_Correct: Total Mean RT'; 'Go_Correct: Total SD RT';	...
    'Go_Incorrect: Run 1 Count'; 'Go_Incorrect: Run 1 Mean RT';...
    'Go_Incorrect: Run 1 SD RT'; 'Go_Incorrect: Run 2 Count';... 
    'Go_Incorrect: Run 2 Mean RT';	'Go_Incorrect: Run 2 SD RT';...
    'Go_Incorrect: Total Count';	'Go_Incorrect: Total Mean RT';...
    'Go_Incorrect: Total SD RT';	'Go_CorrectLate: Run 1 Count';...
    'Go_CorrectLate: Run 1 Mean RT';	'Go_CorrectLate: Run 1 SD RT';...
    'Go_CorrectLate: Run 2 Count';	'Go_CorrectLate: Run 2 Mean RT';...
    'Go_CorrectLate: Run 2 SD RT';	'Go_CorrectLate: Total Count';...
    'Go_CorrectLate: Total Mean RT';	'Go_CorrectLate: Total SD RT';...
    'Go_NoResp: Run 1 Count';	'Go_NoResp: Run 2 Count';...
    'Go_NoResp: Total Count';	'Stop_Correct: Run 1 Count';...
    'Stop_Correct: Run 2 Count';	'Stop_Correct: Total Count';...
    'Stop_Incorrect: Run 1 Count';	'Stop_Incorrect: Run 1 Mean RT';...
    'Stop_Incorrect: Run 1 SD RT';	'Stop_Incorrect: Run 2 Count';...
    'Stop_Incorrect: Run 2 Mean RT';	'Stop_Incorrect: Run 2 SD RT';...
    'Stop_Incorrect: Total Count';	'Stop_Incorrect: Total Mean RT';...
    'Stop_Incorrect: Total SD RT';	'Go Accuracy %: Run 1';...
    'Go Accuracy %: Run 2';	'Go Accuracy %: Total';...
    'Stop Accuracy %: Run 1';	'Stop Accuracy %: Run 2';...
    'Stop Accuracy %: Total'; 	'Trial Sum: Run 1 Count';...
    'Trial Sum: Run 2 Count';	'Trial Sum: Total Count'};

% Print each output variable to csv header for WM
for i = 1:length(condsSST)
    printType = '%s';
    printCond = cell2mat(condsWM(i));
    fprintf(fidSST, [printType ','], printCond);
end

% Close csv file
fclose(fidWM);

%% Navigating data directories
% Pull directories names for each site
sites = dir(dataDir);
sites = sites(arrayfun(@(x)x.name(1), sites) ~= '.');
sites = {sites.name}';

Conditions_SST = {'Block'};
session = {'_SessionA1','_SessionA2','_SessionB1','_SessionB2','_SessionC'};







    
    
    
    
    
    