%% Batch Run
% Runs analysis for EmoNBack_WM, EmoNBack_REC, MID, and SST
% Tariq Cannonier
clear

addpath(genpath('Output'));
addpath(genpath('EmoNBack'));
addpath(genpath('MID'));
addpath(genpath('SST'));

% Provide the path to where behavioral data is located.  Remainder of the
% scripts will process and sort in the Output Folder in the 'ABCD Analysis
% Package'.
%dataDir = '/Users/tc587/fMRI/ABCD/AWS_Data/EmotionalNback/ABCDData/data/';%'/Users/tc587/fMRI/ABCD/AWS_Data/aux_incoming_Nov_3rd_2016';
%dataDir = '/Users/tc587/fMRI/ABCD/AWS_Data/Archive Data/aux_incoming_Nov_3rd_2016_2';
dataDir = '/Users/tc587/fMRI/ABCD/AWS_Data/aux_incoming_Feb_2017';

%% EmoNBack WM & REC
scriptDir = fullfile(pwd,'EmoNBack/WM_SCRIPTS'); % Notes the directory for supplemental scripts
outputDir = fullfile(pwd,'Output/NBack',datestr(now,'yyyymmdd')); %'/Users/tc587/fMRI/ABCD/ABCD Analysis Package';

% Run EmoNBack Analysis
run('loadEPrimeNbackWMBehavABCD_TC3.m')

%% Plots for BJ
% Create Boxplots for WM
run('EmoNback_boxplotsWM.m'); % Uncomment to create EmoNback boxplots

% Create Boxplots for REC
scriptDir = fullfile(pwd,'EmoNBack/REC_SCRIPTS');
run('EmoNback_boxplotsREC.m');

% Save Errors into .mat file for later
nbackMat = strcat(outputDir,filesep,'NBack_Errors_',datestr(now,'yyyymmdd'));
save(nbackMat,'eSite')
clear

%% MID


%% SST


%% WrapUp
rmpath(genpath('Output'));
rmpath(genpath('EmoNBack'));
rmpath(genpath('MID'));
rmpath(genpath('SST'));