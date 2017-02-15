%% Initialize relevant paths & variables
% Run this script from the first directory downloaded when pulling the AWS
% data.
% Ali Cohen
% Tariq Cannonier


dbstop if error
% Used for debugging.  Determines if the directory housing Behvaioral data
% exists.  If not, it uses the directory stated here.
if ~exist('dataDir','var')
    % If Executing the script from the subdirectory
    %dataDir = '/Users/tc587/fMRI/ABCD/AWS_Data/aux_incoming_Nov_3rd_2016/';
    dataDir = '/Users/tc587/fMRI/ABCD/EmotionalNback/ABCDData/data';
    scriptDir = fullfile(pwd); % Notes the directory for supplemental scripts
    a = regexp(scriptDir,'/');
    outputDir = fullfile(scriptDir(1:a(6)),'Output/NBack',datestr(now,'yyyymmdd'));
end

% if executing BatchRun
%scriptDir = fullfile(pwd,'EmoNBack','WM_SCRIPTS'); % Notes the directory for supplemental scripts
%outputDir = fullfile(pwd,'Output/NBack'); %'/Users/tc587/fMRI/ABCD/ABCD Analysis Package';
EventName = 'baseline_year_1_arm_1'; % determines the timeline for the assessment (i.e. baseline_year_1_arm_1)
TaskName = 'nback-wm-exported_'; % Targets the nback task
dateVar = datestr(now,'yyyymmdd');

t0 = datetime('now','Format','HH:mm:ss.SSS'); % Mark script runtime

% Navigate to main directory
if ~exist(outputDir,'dir')
    mkdir(outputDir); % Makes  baseDir if it does not already exist
end

%% Construct WM EmoNback Output File
%fid = fopen(fullfile(scriptDir,['EmoNback_WMBehaviorABCD_',datestr(now,'yyyymmdd'),'.csv']),'w');
fidWM = fopen(fullfile(outputDir,['EmoNback_WMBehaviorABCD_',dateVar,'.csv']),'w');

%List of ALL output variables
condsWM = {'ExperimentName'; 'Site'; 'NDARGUID'; 'Version'; 'Overall_RT'; 'Overall_ACC'; 'HappyBlocks_RT'; 'HappyBlocks_ACC'; ...
    'FearBlocks_RT'; 'FearBlocks_ACC'; 'NeutBlocks_RT'; 'NeutBlocks_ACC'; 'PlaceBlocks_RT'; ...
    'PlaceBlocks_ACC'; 'Overall0back_RT'; 'Overall0back_ACC'; 'Happy0back_RT'; 'Happy0back_ACC'; 'Fear0back_RT'; 'Fear0back_ACC'; ...
    'Neut0back_RT'; 'Neut0back_ACC'; 'Place0back_RT'; 'Place0back_ACC'; 'Overall2back_RT'; 'Overall2back_ACC'; 'Happy2back_RT'; 'Happy2back_ACC'; ...
    'Fear2back_RT'; 'Fear2back_ACC'; 'Neut2back_RT'; 'Neut2back_ACC'; 'Place2back_RT'; 'Place2back_ACC'; 'run1Overall_RT'; 'run1Overall_ACC'; ...
    'run1HappyBlocks_RT'; 'run1HappyBlocks_ACC'; 'run1FearBlocks_RT'; 'run1FearBlocks_ACC'; 'run1NeutBlocks_RT'; 'run1NeutBlocks_ACC'; ...
    'run1PlaceBlocks_RT'; 'run1PlaceBlocks_ACC'; 'run1Happy0back_RT'; 'run1Happy0back_ACC'; 'run1Fear0back_RT'; 'run1Fear0back_ACC'; ...
    'run1Neut0back_RT'; 'run1Neut0back_ACC'; 'run1Place0back_RT'; 'run1Place0back_ACC'; 'run1Happy2back_RT'; 'run1Happy2back_ACC'; ...
    'run1Fear2back_RT'; 'run1Fear2back_ACC'; 'run1Neut2back_RT'; 'run1Neut2back_ACC'; 'run1Place2back_RT'; 'run1Place2back_ACC'; 'run2Overall_RT'; ...
    'run2Overall_ACC'; 'run2HappyBlocks_RT'; 'run2HappyBlocks_ACC'; 'run2FearBlocks_RT'; 'run2FearBlocks_ACC'; 'run2NeutBlocks_RT'; 'run2NeutBlocks_ACC'; ...
    'run2PlaceBlocks_RT'; 'run2PlaceBlocks_ACC'; 'run2Happy0back_RT'; 'run2Happy0back_ACC'; 'run2Fear0back_RT'; 'run2Fear0back_ACC'; ...
    'run2Neut0back_RT'; 'run2Neut0back_ACC'; 'run2Place0back_RT'; 'run2Place0back_ACC'; 'run2Happy2back_RT'; 'run2Happy2back_ACC'; ...
    'run2Fear2back_RT'; 'run2Fear2back_ACC'; 'run2Neut2back_RT'; 'run2Neut2back_ACC'; 'run2Place2back_RT'; 'run2Place2back_ACC'; 'Nonlure_ACC';...
    'Lure_ACC'; 'Target_ACC';'HappyTargetHR';'HappyLureFA';'HappyNonlureFA';'FearTargetHR';'FearLureFA';'FearNonlureFA';'NeutTargetHR';...
    'NeutLureFA';'NeutNonlureFA';'PlaceTargetHR';'PlaceLureFA';'PlaceNonlureFA'};

%Print each output variable to csv header for WM
for i = 1:length(condsWM)
    printType = '%s';
    printCond = cell2mat(condsWM(i));
    fprintf(fidWM, [printType ','], printCond);
end

%Close csv file
fclose(fidWM);

%% Construct REC EmoNback Output File
fidREC = fopen(fullfile(outputDir,['EmoNback_RECBehaviorABCD_',dateVar,'.csv']),'w');

% List all output variables for RecMem
condsREC = {'ExperimentName'; 'Site'; 'NDARGUID'; 'Version'; 'SessionDate';...
    'Happy_HR'; 'Happy_FA'; 'Happy_Pr'; 'Happy_Br'; 'Happy_Miss';...
    'Happy_CR'; 'Happy_dprime'; 'Fear_HR'; 'Fear_FA'; 'Fear_Pr'; ...
    'Fear_Br'; 'Fear_Miss'; 'Fear_CR'; 'Fear_dprime'; 'Neut_HR';...
    'Neut_FA'; 'Neut_Pr'; 'Neut_Br'; 'Neut_Miss'; 'Neut_CR'; ...
    'Neut_dprime'; 'Place_HR'; 'Place_FA'; 'Place_Pr'; 'Place_Br'; ...
    'Place_Miss'; 'Place_CR'; 'Place_dprime'; 'Happy0back_HR'; ...
    'Fear0back_HR'; 'Neut0back_HR'; 'Place0back_HR'; 'Happy2back_HR'; ...
    'Fear2back_HR'; 'Neut2back_HR'; 'Place2back_HR'; 'Happy_TargetHR'; ...
    'Happy_LureHR'; 'Happy_NonlureHR'; 'Fear_TargetHR'; 'Fear_LureHR'; ...
    'Fear_NonlureHR'; 'Neut_TargetHR'; 'Neut_LureHR'; 'Neut_NonlureHR'; ...
    'Place_TargetHR'; 'Place_LureHR'; 'Place_NonlureHR'; ...
    'ThreeExposure0backTargetStim'; 'TwoExposure2backTargetStim'; ...
    'TwoExposure0backLureStim'; 'TwoExposure2backLureStim'; ...
    'OneExposure0backStim'; 'OneExposure2backStim'
    };

for i = 1:length(condsREC)
    printType = '%s';
    printCond = cell2mat(condsREC(i));
    fprintf(fidREC, [printType ','], printCond);
end

% Close csv file
fclose(fidREC);

%% Navigating data directories
% Pull directories names for each site
sites = dir(dataDir);%dir('*');
sites = sites(arrayfun(@(x)x.name(1), sites) ~='.'); % Removes any hidden directories with '.' in name
sites = {sites.name}';

%{
Conditions_WM={'Block';'BlockType';'Stim.ACC';'Stim.CRESP'; 'Stim.RESP';...
    'Stim.RT';'StimType';'Stimulus';'TargetType'}; % Relevant conditions
Conditions_REC={'Block';'Stim.ACC[Block]';'Stim.CRESP[Block]'; 'Stim.RESP[Block]';...
    'Stim.RT[Block]';'StimType[Block]';'Stimulus[Block]'};
%}
Conditions_WM={'Block';'BlockType';'Stim.ACC';'Stim.RESP';...
    'Stim.RT';'StimType';'Stimulus';'TargetType'}; % Relevant conditions
Conditions_REC={'Block';'Stim.ACC[Block]';'Stim.RESP[Block]';...
    'Stim.RT[Block]';'StimType[Block]';'Stimulus[Block]'};
session = {'_SessionA1','_SessionA2','_SessionB1','_SessionB2','_SessionC'};

eSite(1).site = 1; % Initialize struct for erroneous ID/datapoints
eSite_count = 1; % Initialize count for erroneous ID/datapoints

% Debugging erroroneous sites
load('/Users/tc587/fMRI/ABCD/NBack Analaysis Package/Output/NBack/WM_Variables.mat','eSite')

for sitez = 1:length(sites)
    Site = sites{sitez};
    siteDir = fullfile(dataDir,Site); % Make path to site directory
    
    subs = dir(siteDir);
    subs = subs(arrayfun(@(x)x.name(1), subs) ~='.'); % Data file is not a hidden file
    subs = subs(arrayfun(@(x)x.name(1), subs) =='N'); % Data is a participant (not phantom)
    subs = {subs.name}'; % List participants at indexed site
    eID_count = 1;
    
    for subjz = 1:size(subs,1)
        ID = subs{subjz}; % Get participant ID
        shortID = ID(9:end);
        subBaseDir = fullfile(dataDir,Site,ID,EventName); % Find path to ePrime output files
        x = dir(subBaseDir);
        x = x(arrayfun(@(x)x.name(1), x)~='.');
        ct = 1;
        
        try % Continue if nback-wm-exported was not imported
            % Find the nback-wm-exported directory to build the directory
            % path.
            while isempty(strfind(x(ct).name,'nback-wm-exported'))
                % Breaks if index exceeds size of subdirectories
                ct = ct+1;
            end
        catch
            % Task was not completed for this participant.  Logged in eSite
            % struct.
            if eSite(1).site == 1 % Initiate error counting
                eSite(eSite_count).site = Site;
                eSite(eSite_count).part(eID_count).ID = ID;
                eSite(eSite_count).part(eID_count).eTask(1) = {'WM'};
                eID_count = eID_count+1;
            elseif strcmp(eSite(end).site,Site) % error count; log ID within site
                %eSite(eSite_count).site = Site;
                eSite(eSite_count).part(eID_count).ID = ID;
                eSite(eSite_count).part(eID_count).eTask(1) = {'WM'};
                eID_count = eID_count+1;
            else % error count; initiate log within new
                eSite_count = eSite_count+1;
                eSite(eSite_count).site = Site;
                eSite(eSite_count).part(eID_count).ID = ID;
                eSite(eSite_count).part(eID_count).eTask(1) = {'WM'};
                eID_count = 1;
            end
            [h,m,s] = hms(datetime('now','Format','HH:mm:ss.SS')-t0); % Clock script runtime
            fprintf('Skipping WM... Site: %s, ID: %s, elapsed_time: %01.0f:%02.0f:%02.2f\n',Site,ID,h,m,s); % Print runtime
            continue
            %break
        end
        
        % Generate the participant's data directory
        subDataDir = fullfile(subBaseDir,x(ct).name);
        
        subDataWMcsv = [];
        subDataWMtxt = [];
        subDataFile = dir(subDataDir);
        subDataFile = subDataFile(arrayfun(@(x)x.name(1),subDataFile)~='.');
        
        for i = 1:length(subDataFile)
            subDataPath = [];
            if strfind(subDataFile(i).name,[shortID,'_WM']) % If data file matches shortID and is WM
                subDataPath = fullfile(subDataFile(i).folder,subDataFile(i).name);
                if strfind(subDataPath,'txt')
                    subDataWM = importSubjDataWMtxt(subDataPath);
                else
                    subDataWM = importSubjDataWMcsv(subDataPath);
                end
            end
        end
        if isempty(subDataPath)% Participant did not do WM and could not do REC either
            if eSite(1).site == 1 % Initiate error counting
                eSite(eSite_count).site = Site;
                eSite(eSite_count).part(eID_count).ID = ID;
                eSite(eSite_count).part(eID_count).eTask(1) = {'WM'};
                eSite(eSite_count).part(eID_count).eTask(2) = {'REC'};
                eID_count = eID_count+1;
            elseif strcmp(eSite(end).site,Site) % error count; log ID within site
                %eSite(eSite_count).site = Site;
                eSite(eSite_count).part(eID_count).ID = ID;
                eSite(eSite_count).part(eID_count).eTask(1) = {'WM'};
                eSite(eSite_count).part(eID_count).eTask(2) = {'REC'};
                eID_count = eID_count+1;
            else % error count; initiate log within new
                eSite_count = eSite_count+1;
                eSite(eSite_count).site = Site;
                eSite(eSite_count).part(eID_count).ID = ID;
                eSite(eSite_count).part(eID_count).eTask(1) = {'WM'};
                eSite(eSite_count).part(eID_count).eTask(2) = {'REC'};
                eID_count = 1;
            end
            [h,m,s] = hms(datetime('now','Format','HH:mm:ss.SS')-t0); % Clock script runtime
            fprintf('Skipping WM... Site: %s, ID: %s, elapsed_time: %01.0f:%02.0f:%02.2f\n',Site,ID,h,m,s); % Print runtime
            continue
            %break            
        end
        %{
        if exist(fullfile(subDataDir,strcat(ID(9:end),'_WM.txt')),'file')
            subDataPath = fullfile(subDataDir,strcat(ID(9:end),'_WM.txt'));
            subDataWMcsv = importSubjDataWMtxt(subDataPath);
        elseif exist(fullfile(subDataDir,strcat('NDAR_INV',ID(9:end),'_WM.txt')),'file')
            subDataPath = fullfile(subDataDir,strcat('NDAR_INV',ID(9:end),'_WM.txt'));
            subDataWMcsv = importSubjDataWMtxt(subDataPath);
        elseif exist(fullfile(subDataDir,strcat('NDAR_INV',ID(9:end),'_WM.csv')),'file')
            subDataPath = fullfile(subDataDir,strcat('NDAR_INV',ID(9:end),'_WM.csv'));
            subDataWMtxt = importSubjDataWMcsv(subDataPath);
        elseif exist(fullfile(subDataDir,strcat(ID(9:end),'_WM.csv')),'file')
            subDataPath = fullfile(subDataDir,strcat(ID(9:end),'_WM.csv'));
            subDataWMtxt = importSubjDataWMcsv(subDataPath);
        end
        
        if isempty(subDataWMtxt)
            subDataWM = subDataWMcsv;
        else
            subDataWM = subDataWMtxt;
        end
        %}
        %{
        Attempt to get MATLAB to read improperly exported data.  Do not
        uncomment.
        subData = textscan(subDataPathTest,'%s','delimiter','\n','whitespace','');
        subData = regexp(testData{2:end,:},',','split');
        %}
        %% Evaluate WM
        try
            for i = 1:length(Conditions_WM) % Loop through conditions
                j = 1; % Initiates loop at the first column
                %try %Skip incompatible data
                while strcmp(subDataWM(1,j),Conditions_WM{i})==false % Loops until it finds the desired condition
                    j = j+1;
                    if strcmp(subDataWM{1,j},Conditions_WM{i})==true
                        perFind = strfind(Conditions_WM{i},'.');
                        bracketFind = strfind(Conditions_WM{i},'[');
                        if perFind
                            Condition2 = strrep(Conditions_WM{i},'.','_');
                            eval(sprintf('%s_WM = subDataWM(2:end,j);',Condition2));
                        elseif bracketFind
                            Condition2 = strrep(Conditions_WM{i},'[','_');
                            Condition2 = strrep(Condition2,']','');
                            eval(sprintf('%s_WM = subDataWM(2:end,j);',Condition2));
                        else
                            Condition2 = Conditions_WM{i};
                            eval(sprintf('%s_WM = subDataWM(2:end,j);',Condition2));
                        end
                        
                        try
                            eval(sprintf('A = isfloat(cell2mat(%s));',Condition2));
                        catch
                            A = 0;
                        end
                        if A == 1
                            eval(sprintf('%s = cell2mat(%s);',Condition2,Condition2));
                        end
                        break
                    end
                end
            end
        catch
            if eSite(1).site == 1 % Initiate error counting
                eSite(eSite_count).site = Site;
                eSite(eSite_count).part(eID_count).ID = ID;
                eSite(eSite_count).part(eID_count).eTask(1) = {'WM'};
                eID_count = eID_count+1;
            elseif strcmp(eSite(end).site,Site) % error count; log ID within site
                %eSite(eSite_count).site = Site;
                eSite(eSite_count).part(eID_count).ID = ID;
                eSite(eSite_count).part(eID_count).eTask(1) = {'WM'};
                eID_count = eID_count+1;
            else % error count; initiate log within new
                eSite_count = eSite_count+1;
                eSite(eSite_count).site = Site;
                eSite(eSite_count).part(eID_count).ID = ID;
                eSite(eSite_count).part(eID_count).eTask(1) = {'WM'};
                eID_count = 1;
            end
            [h,m,s] = hms(datetime('now','Format','HH:mm:ss.SS')-t0); % Clock script runtime
            fprintf('Skipping WM... Site: %s, ID: %s, elapsed_time: %01.0f:%02.0f:%02.2f\n',Site,ID,h,m,s); % Print runtime
            continue
            %break
        end
        format longg
        
        % Write to outputfile in script directory
        %fid = fopen(fullfile(scriptDir,['EmoNback_WMBehaviorABCD_',datestr(now,'yyyymmdd'),'.csv']),'a');
        fidWM = fopen(fullfile(outputDir,['EmoNback_WMBehaviorABCD_',dateVar,'.csv']),'a');
        fprintf(fidWM,'\n');
        
        clear ExperimentName NDARGUID
        
        ExperimentName = subDataWM{2,1}(1:length(subDataWM{2,1}));
        NDARGUID = subDataWM{2,14};
        Version = subDataWM{2,17};
        
        % Run scripts to create remaining variables
        %calcWMBehavABCD_original;
        calcWMBehavABCD_TC;
        
        % Define variable type e.g. character, numberic cell
        % if numeric, specify digits to print
        for i = 1:length(condsWM)
            a = eval(condsWM{i});
            if ischar(a)
                outType = '%s';
            elseif isnumeric(a)
                outType = '%4.3f';
            elseif iscell(a)
                outType = '%s';
                a = cell2mat(a);
            end
            fprintf(fidWM, strcat(outType,','),a);
        end
        fclose(fidWM);
        
        %runtime = toc(t0); % Clock script runtime
        
        %% Evaluate REC
        ct = 1;
        try % Continue if nback-wm-exported was not imported
            % Find the nback-wm-exported directory to build the directory
            % path.
            while isempty(strfind(x(ct).name,'nback-rec-exported'))
                ct = ct+1;
            end
        catch
            % Task was not completed for this participant.  Logged in eSite
            % struct.
            if eSite(1).site == 1 % Initiate error counting
                eSite(eSite_count).site = Site;
                eSite(eSite_count).part(eID_count).ID = ID;
                eSite(eSite_count).part(eID_count).eTask(2) = {'REC'};
                eID_count = eID_count+1;
            elseif strcmp(eSite(end).site,Site) % error count; log ID within site
                %eSite(eSite_count).site = Site;
                eSite(eSite_count).part(eID_count).ID = ID;
                eSite(eSite_count).part(eID_count).eTask(2) = {'REC'};
                eID_count = eID_count+1;
            else % error count; initiate log within new
                eSite_count = eSite_count+1;
                eSite(eSite_count).site = Site;
                eSite(eSite_count).part(eID_count).ID = ID;
                eSite(eSite_count).part(eID_count).eTask(2) = {'REC'};
                eID_count = 1;
            end
            [h,m,s] = hms(datetime('now','Format','HH:mm:ss.SS')-t0); % Clock script runtime
            fprintf('Skipping REC... Site: %s, ID: %s, elapsed_time: %01.0f:%02.0f:%02.2f\n',Site,ID,h,m,s); % Print runtime
            continue
        end
        
        % Generate the participant's data directory
        subDataDir = fullfile(subBaseDir,x(ct).name);
        
        % Concatenate and Import the participant's data
        numDataDir = dir(subDataDir);
        numDataDir = numDataDir(arrayfun(@(x)x.name(1), numDataDir)~='.');
        
        % Process file if folder only has a .txt file formatted in Unicode.
        %{
        if length(numDataDir)==1
            subDataPath = fullfile(numDataDir.folder,numDataDir.name);
        elseif exist(fullfile(subDataDir,strcat(ID(9:end),'_REC.csv')),'file')
            subDataPath = fullfile(subDataDir,strcat(ID(9:end),'_REC.csv'));
        elseif exist(fullfile(subDataDir,strcat('NDAR_INV',ID(9:end),'_REC.csv')),'file')
            subDataPath = fullfile(subDataDir,strcat('NDAR_INV',ID(9:end),'_REC.csv'));
        end
        %}
        
        subDataRECcsv = [];
        subDataRECtxt = [];
        subDataFile = dir(subDataDir);
        subDataFile = subDataFile(arrayfun(@(x)x.name(1),subDataFile)~='.');
        %{
        if exist(fullfile(subDataDir,strcat(ID(9:end),'_REC.txt')),'file')
            subDataPath = fullfile(subDataDir,strcat(ID(9:end),'_REC.txt'));
            subDataRECcsv = importSubjDataRECtxt(subDataPath);
        elseif exist(fullfile(subDataDir,strcat('NDAR_INV',ID(9:end),'_REC.txt')),'file')
            subDataPath = fullfile(subDataDir,strcat('NDAR_INV',ID(9:end),'_REC.txt'));
            subDataRECcsv = importSubjDataRECtxt(subDataPath);
        elseif exist(fullfile(subDataDir,strcat(ID(9:end),'_REC.csv')),'file')
            subDataPath = fullfile(subDataDir,strcat(ID(9:end),'_REC.csv'));
            subDataRECtxt = importSubjDataRECcsv(subDataPath);
        elseif exist(fullfile(subDataDir,strcat('NDAR_INV',ID(9:end),'_REC.csv')),'file')
            subDataPath = fullfile(subDataDir,strcat('NDAR_INV',ID(9:end),'_REC.csv'));
            subDataRECtxt = importSubjDataRECcsv(subDataPath);
            %}
        for i = 1:length(subDataFile) % Directories may have more than 1 file
            subDataPath = [];
            if strfind(subDataFile(i).name,[shortID,'_REC']) % If data file matches shortID and is WM
                subDataPath = fullfile(subDataFile(i).folder,subDataFile(i).name);
                if strfind(subDataPath,'txt')
                    subDataRECtxt = importSubjDataRECtxt(subDataPath);
                else
                    subDataRECcsv = importSubjDataRECcsv(subDataPath);
                end
            end
        end
        
        if isempty(subDataPath) % Indicates that participant did not do REC
            %        elseif isempty(subDataPath)
            if eSite(1).site == 1 % Initiate error counting
                eSite(eSite_count).site = Site;
                eSite(eSite_count).part(eID_count).ID = ID;
                eSite(eSite_count).part(eID_count).eTask(2) = {'REC'};
                eID_count = eID_count+1;
            elseif strcmp(eSite(end).site,Site) % Error count; log ID within site
                %eSite(eSite_count).site = Site;
                eSite(eSite_count).part(eID_count).ID = ID;
                eSite(eSite_count).part(eID_count).eTask(2) = {'REC'};
                eID_count = eID_count+1;
            else % error count; initiate log within new
                eSite_count = eSite_count+1;
                eSite(eSite_count).site = Site;
                eSite(eSite_count).part(eID_count).ID = ID;
                eSite(eSite_count).part(eID_count).eTask(2) = {'REC'};
                eID_count = 1;
            end
            [h,m,s] = hms(datetime('now','Format','HH:mm:ss.SS')-t0); % Clock script runtime
            fprintf('Skipping REC... Site: %s, ID: %s, elapsed_time: %01.0f:%02.0f:%02.2f\n',Site,ID,h,m,s); % Print runtime
            continue;
        end
        
        if exist(fullfile(subDataDir,strcat('NDAR_INV',ID(9:end),'_REC.txt')),'file')
            subDataPath = fullfile(subDataDir,strcat('NDAR_INV',ID(9:end),'_REC.txt'));
            subDataRECtxt = importSubjDataRECtxt(subDataPath);
        end
        
        if isempty(subDataRECtxt)
            subDataREC = subDataRECcsv;
        else
            subDataREC = subDataRECtxt;
        end
        %{
        Attempt to get MATLAB to read improperly exported data.  Do not
        uncomment.
        subData = textscan(subDataPathTest,'%s','delimiter','\n','whitespace','');
        subData = regexp(testData{2:end,:},',','split');

        %}
        % If file has more than 120 empty cells, it was exported from
        % ePrime.
        if sum(any(cellfun(@isempty,subDataREC))) > 120
            if eSite(1).site == 1 % Initiate error counting
                eSite(eSite_count).site = Site;
                eSite(eSite_count).part(eID_count).ID = ID;
                eSite(eSite_count).part(eID_count).eTask(2) = {'REC'};
                eID_count = eID_count+1;
            elseif strcmp(eSite(end).site,Site) % error count; log ID within site
                %eSite(eSite_count).site = Site;
                eSite(eSite_count).part(eID_count).ID = ID;
                eSite(eSite_count).part(eID_count).eTask(2) = {'REC'};
                eID_count = eID_count+1;
            else % error count; initiate log within new
                eSite_count = eSite_count+1;
                eSite(eSite_count).site = Site;
                eSite(eSite_count).part(eID_count).ID = ID;
                eSite(eSite_count).part(eID_count).eTask(2) = {'REC'};
                eID_count = 1;
            end
            [h,m,s] = hms(datetime('now','Format','HH:mm:ss.SS')-t0); % Clock script runtime
            fprintf('Skipping REC... Site: %s, ID: %s, elapsed_time: %01.0f:%02.0f:%02.2f\n',Site,ID,h,m,s); % Print runtime
            continue;
        end
        try
            for i = 1:length(Conditions_REC)
                j = 1;
                %try %Skip incompatible data
                while strcmp(subDataREC(1,j),Conditions_REC{i})==false % Loops until it finds the desired condition
                    j = j+1;
                    
                    if strcmp(subDataREC{1,j},Conditions_REC{i})==true
                        perFind = strfind(Conditions_REC{i},'.');
                        bracketFind = strfind(Conditions_REC{i},'[');
                        %fprintf('%s\n',subDataREC{1,j});
                        if and(isempty(perFind),isempty(bracketFind))
                            Condition2 = Conditions_REC{i};
                            eval(sprintf('%s_REC = subDataREC(2:end,j);',Condition2));
                        elseif and(perFind, bracketFind)
                            Condition2 = strrep(Conditions_REC{i},'.','_');
                            Condition2 = strrep(Condition2,'[','_');
                            Condition2 = strrep(Condition2,']','');
                            eval(sprintf('%s_REC = subDataREC(2:end,j);',Condition2));
                        elseif perFind
                            Condition2 = strrep(Conditions_REC{i},'.','_');
                            eval(sprintf('%s_REC = subDataREC(2:end,j);',Condition2));
                        elseif bracketFind
                            Condition2 = strrep(Conditions_REC{i},'[','_');
                            Condition2 = strrep(Condition2,']','');
                            eval(sprintf('%s_REC = subDataREC(2:end,j);',Condition2));
                        else
                            Condition2 = Conditions_REC{i};
                            eval(sprintf('%s_REC = subDataREC(2:end,j);',Condition2));
                        end
                        
                        try
                            eval(sprintf('A = isfloat(cell2mat(%s));',Condition2));
                        catch
                            A = 0;
                        end
                        
                        if A == 1
                            eval(sprintf('%s = cell2mat(%s);',Condition2,Condition2));
                        end
                        
                        break
                        
                    end
                end
                %
                
            end
        catch
            if eSite(1).site == 1 % Initiate error counting
                eSite(eSite_count).site = Site;
                eSite(eSite_count).part(eID_count).ID = ID;
                eSite(eSite_count).part(eID_count).eTask(2) = {'REC'};
                eID_count = eID_count+1;
            elseif strcmp(eSite(end).site,Site) % error count; log ID within site
                %eSite(eSite_count).site = Site;
                eSite(eSite_count).part(eID_count).ID = ID;
                eSite(eSite_count).part(eID_count).eTask(2) = {'REC'};
                eID_count = eID_count+1;
            else % error count; initiate log within new
                eSite_count = eSite_count+1;
                eSite(eSite_count).site = Site;
                eSite(eSite_count).part(eID_count).ID = ID;
                eSite(eSite_count).part(eID_count).eTask(2) = {'REC'};
                eID_count = 1;
            end
            [h,m,s] = hms(datetime('now','Format','HH:mm:ss.SS')-t0); % Clock script runtime
            fprintf('Skipping REC... Site: %s, ID: %s, elapsed_time: %01.0f:%02.0f:%02.2f\n',Site,ID,h,m,s); % Print runtime
            continue
        end
        format longg
        
        % Write to outputfile in script directory
        %fid = fopen(fullfile(scriptDir,['EmoNback_WMBehaviorABCD_',datestr(now,'yyyymmdd'),'.csv']),'a');
        fidREC = fopen(fullfile(outputDir,['EmoNback_RECBehaviorABCD_',dateVar,'.csv']),'a');
        fprintf(fidREC,'\n');
        
        clear ExperimentName NDARGUID
        
        %ExperimentName = subDataREC{2,1}(1:length(subDataREC{2,1}));
        NDARGUID = subDataREC{2,12};
        Version = subDataREC{2,16};
        % Run scripts to create remaining variables
        saveWMStim;
        numstimappearances;
        
        if any(isnan(checkNAN))
            continue
        end
        %analyzeRECBehav;
        ExperimentName = subDataREC{2,1}(1:length(subDataREC{2,1}));
        
        % Define variable type e.g. character, numberic cell
        % if numeric, specify digits to print
        % fidREC = fopen(fullfile(outputDir,['EmoNback_RECBehaviorABCD_',datestr(now,'yyyymmdd'),'.csv']),'a');
        for i = 1:length(condsREC)
            a = eval(condsREC{i});
            if ischar(a)
                outType = '%s';
            elseif isnumeric(a)
                outType = '%4.3f';
            elseif iscell(a)
                outType = '%s';
                a = cell2mat(a);
            end
            fprintf(fidREC, strcat(outType,','),a);
        end
        fclose(fidREC);
        [h,m,s] = hms(datetime('now','Format','HH:mm:ss.SS')-t0); % Clock script runtime
        fprintf('Site: %s, ID: %s, elapsed_time: %01.0f:%02.0f:%02.2f\n',Site,ID,h,m,s); % Print runtime
    end
end
save(fullfile(pwd,'Output/NBack/WM_Variables'))
%rmpath(scriptDir)
%cd(scriptDir)e
[h,m,s] = hms(datetime('now','Format','HH:mm:ss.SS')-t0); % Clock script runtime
fprintf('\n\n==========\nNBack Total runtime:\n%02.0f:%02.0f:%02.2f\n==========\n',h,m,s)
