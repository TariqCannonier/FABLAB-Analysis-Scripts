%% Initialize relevant paths & variables
% Run this script from the first directory downloaded when pulling the AWS
% data.
% Ali Cohen
% Tariq Cannonier
if ~exist('dataDir','var')
    %addpath('/Volumes/Main/Casey-Lab/EmotionalNback/WM_Data')
    dataDir = '/Users/tc587/fMRI/ABCD/AWS_Data/aux_incoming_Nov_3rd_2016/'; 
    %WMDir = '/Volumes/Main/Casey-Lab/EmotionalNback/WM_Data/';
    %RECDir = '/Volumes/Main/Casey-Lab/EmotionalNback/REC_Data/';
    %ScriptDir = '/Volumes/Main/Casey-Lab/EmotionalNback/SCRIPTS';
end

EventName = 'baseline_year_1_arm_1'; % determines the timeline for the assessment (i.e. baseline_year_1_arm_1)
TaskName = 'nback-rec-exported_'; % Targets the nback task

t0 = tic; % Starts timer for analysis

%start new line in csv
%fid = fopen(['/Volumes/Main/Casey-Lab/EmotionalNback/SCRIPTS/EmoNback_RECBehavior.csv'],'w');
fid = fopen(fullfile(outputDir,['EmoNback_RECBehavior_',datestr(now,'yyyymmdd'),'.csv']),'w');

%List of ALL output variables
Conds = {'ExperimentName'; 'Subject'; 'Version'; 'SessionDate'; 'Happy_HR'; 'Happy_FA';... 
'Happy_Pr'; 'Happy_Br'; 'Happy_Miss'; 'Happy_CR'; 'Happy_dprime'; 'Fear_HR'; 'Fear_FA'; 'Fear_Pr'; ...
'Fear_Br'; 'Fear_Miss'; 'Fear_CR'; 'Fear_dprime'; 'Neut_HR'; 'Neut_FA'; 'Neut_Pr'; 'Neut_Br'; ...
'Neut_Miss'; 'Neut_CR'; 'Neut_dprime'; 'Place_HR'; 'Place_FA'; 'Place_Pr'; 'Place_Br'; ...
'Place_Miss'; 'Place_CR'; 'Place_dprime'; 'Happy0back_HR'; 'Fear0back_HR'; 'Neut0back_HR'; 'Place0back_HR'; ...
'Happy2back_HR'; 'Fear2back_HR'; 'Neut2back_HR'; 'Place2back_HR'; ...
'Happy_TargetHR'; 'Happy_LureHR'; 'Happy_NonlureHR'; ...
'Fear_TargetHR'; 'Fear_LureHR'; 'Fear_NonlureHR'; ...
'Neut_TargetHR'; 'Neut_LureHR'; 'Neut_NonlureHR'; ...
'Place_TargetHR'; 'Place_LureHR'; 'Place_NonlureHR'; 'ThreeExposure0backTargetStim'; ...
'TwoExposure2backTargetStim'; 'TwoExposure0backLureStim'; 'TwoExposure2backLureStim'; ...
'OneExposure0backStim'; 'OneExposure2backStim'};    

%Print each output variable to csv header
for i = 1:length(Conds)
    PrintType = '%s';
    PrintCond = cell2mat(Conds(i));
    fprintf(fid, [PrintType ','], PrintCond);
end

%Close csv file
fclose(fid);

sites = dir(dataDir);
sites = sites(arrayfun(@(x)x.name(1), sites) ~='.'); % Removes any hidden directories with '.' in name
sites = {sites.name}';

%use following two lines for batching
 subs=dir('SC0*'); 
 subs = {subs.name}' ;

%use following line for individual subjects
%subs = {'SC02252'};

for subjz = 1:size(subs,1)
    ID = subs{subjz}; 
    
%Load WM E-Prime to retrieve stimuli presented in the task
    Conditions={'Block';'BlockType';'Stim_ACC';'Stim_CRESP'; 'Stim_RESP';'Stim_RT';...
        'StimType';'Stimulus';'TargetType'
        }; % Relevant conditions
    
    
    cd([WMDir ID]); % cd into the subject's directory 
    if exist([ID '.xlsx'],'file');
        [NUM,TXT,RAW]=xlsread([ID '.xlsx']); % Load in subject's excel file
        
        if strfind(RAW{1,1},'WM');
            for i = 1:length(Conditions); % loop through conditions
                j=1; % to set and loop through the column number from the loaded excel file
                while strcmp(RAW{2,j},Conditions{i})==0; % while loop! if you don't find the condition (ie., column you're looking for, keep going)
                    j=j+1; % these aren't the droids you're looking for. go to the next column
                    if strcmp(RAW{2,j},Conditions{i})==1; % but, if these are the droids you're looking for, then...
                        
                        perFind = strfind(Conditions{i},'.'); %find out if the conditions column has a period (will need to change b/c matlab gets angry)
                        bracketFind = strfind(Conditions{i},'['); % or if the conditions column has a bracket (matlab angrier)
%                        slashFind = strfind(Conditions{i},'/'); % or if the conditions column has a bracket (matlab angrier)
                        if perFind; % if there was a period in the colum
                            Condition2 = strrep(Conditions{i},'.','_'); % turn that frown upside down! (into a "_")
                            eval(sprintf('%s = RAW(3:end,j);',Condition2)); %biggest part of the script - make a new variable that equals the old one, but with a happy new name
                        elseif bracketFind;
                            Condition2 = strrep(Conditions{i},'[','_');
                            Condition2 = strrep(Condition2,']','');
                            eval(sprintf('%s = RAW(3:end,j);',Condition2));
%                        elseif slashFind; % if there was a period in the colum
%                            Condition2 = strrep(Conditions{i},'/','_'); % turn that frown upside down! (into a "_")
%                            eval(sprintf('%s = RAW(3:end,j);',Condition2)); %biggest part of the script - make a new variable that equals the old one, but with a happy new name    
                        else
                            Condition2 = Conditions{i};
                            eval(sprintf('%s = RAW(3:end,j);',Condition2));
                        end
                        
                        try eval(sprintf('A = isfloat(cell2mat(%s));',Condition2));
                        catch
                            A = 0;
                        end
                        
                        if A == 1;
                            eval(sprintf('%s = cell2mat(%s);',Condition2,Condition2));
                        end
                        
                        break
                        
                    end
                end
            end
        end
        cd (ScriptDir);
        %Isolate WM stim from relevant conditions
        saveWMStim;
        numstimappearances;
        %Clean up workspace
        clearvars -except ID subs subjz Conds fid WMFearStim0back WMFearStim2back WMHappyStim0back WMHappyStim2back WMNeutStim0back WMNeutStim2back WMPlaceStim0back WMPlaceStim2back HappyTargetStim HappyLureStim HappyNonlureStim FearTargetStim FearLureStim FearNonlureStim NeutTargetStim NeutLureStim NeutNonlureStim PlaceTargetStim PlaceLureStim PlaceNonlureStim HappyTarget0backStim HappyTarget2backStim HappyLure0backStim HappyLure2backStim HappyNonlure0backStim HappyNonlure2backStim FearTarget0backStim FearTarget2backStim FearLure0backStim FearLure2backStim FearNonlure0backStim FearNonlure2backStim NeutTarget0backStim NeutTarget2backStim NeutLure0backStim NeutLure2backStim NeutNonlure0backStim NeutNonlure2backStim PlaceTarget0backStim PlaceTarget2backStim PlaceLure0backStim PlaceLure2backStim PlaceNonlure0backStim PlaceNonlure2backStim
        %Reset relevant paths
        addpath('/Volumes/Main/Casey-Lab/EmotionalNback/WM_Data')
        WMDir = '/Volumes/Main/Casey-Lab/EmotionalNback/WM_Data/';
        RECDir = '/Volumes/Main/Casey-Lab/EmotionalNback/REC_Data/';
        ScriptDir = '/Volumes/Main/Casey-Lab/EmotionalNback/SCRIPTS';
        cd (ScriptDir);
    end
    
    %Load REC data for analyses!
        Conditions={'Block';'Stim.ACC';'Stim.CRESP'; 'Stim.RESP';'Stim.RT';...
        'StimType';'Stimulus[Block]'
        }; % Relevant conditions
    
    
    cd([RECDir ID]); % cd into the subject's directory 
    if exist([ID '.xlsx'],'file');
        [NUM,TXT,RAW]=xlsread([ID '.xlsx']); % Load in subject's excel file
        
        if strfind(RAW{1,1},'REC');
            for i = 1:length(Conditions); % loop through conditions
                j=1; % to set and loop through the column number from the loaded excel file
                while strcmp(RAW{2,j},Conditions{i})==0; % while loop! if you don't find the condition (ie., column you're looking for, keep going)
                    j=j+1; % these aren't the droids you're looking for. go to the next column
                    if strcmp(RAW{2,j},Conditions{i})==1; % but, if these are the droids you're looking for, then...
                        
                        perFind = strfind(Conditions{i},'.'); %find out if the conditions column has a period (will need to change b/c matlab gets angry)
                        bracketFind = strfind(Conditions{i},'['); % or if the conditions column has a bracket (matlab angrier)
%                        slashFind = strfind(Conditions{i},'/'); % or if the conditions column has a bracket (matlab angrier)
                        if perFind; % if there was a period in the colum
                            Condition2 = strrep(Conditions{i},'.','_'); % turn that frown upside down! (into a "_")
                            eval(sprintf('%s = RAW(3:end,j);',Condition2)); %biggest part of the script - make a new variable that equals the old one, but with a happy new name
                        elseif bracketFind;
                            Condition2 = strrep(Conditions{i},'[','_');
                            Condition2 = strrep(Condition2,']','');
                            eval(sprintf('%s = RAW(3:end,j);',Condition2));
%                        elseif slashFind; % if there was a period in the colum
%                            Condition2 = strrep(Conditions{i},'/','_'); % turn that frown upside down! (into a "_")
%                            eval(sprintf('%s = RAW(3:end,j);',Condition2)); %biggest part of the script - make a new variable that equals the old one, but with a happy new name    
                        else
                            Condition2 = Conditions{i};
                            eval(sprintf('%s = RAW(3:end,j);',Condition2));
                        end
                        
                        try eval(sprintf('A = isfloat(cell2mat(%s));',Condition2));
                        catch
                            A = 0;
                        end
                        
                        if A == 1;
                            eval(sprintf('%s = cell2mat(%s);',Condition2,Condition2));
                        end
                        
                        break
                        
                    end
                end
            end
        end
        cd (ScriptDir);
        analyzeRECBehav;
    end
    runtime = toc(t0); % Clock script runtime
    fprintf('Site: %s, ID: %s, starttime:%2.3f\n',Site,ID,runtime) % Print runtime
end

h = floor(runtime/(60*60));
remainder = runtime-h;
m = floor(runtime/60);
s = runtime - m*60;

fprintf('\n\n==========\nREC Total runtime:\n%02.0f:%02.0f:%02.0f\n==========\n',h,m,s)

