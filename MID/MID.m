
dbstop if error
% Create string for MID_
if ~exist('dataDir','var')
    dataDir = '/Users/tc587/fMRI/ABCD/AWS_Data/aux_incoming_Feb_2017/';
    scriptDir = fullfile(pwd);
    a = regexp(scriptDir,'/');
    outputDir = fullfile(scriptDir(1:a(end)),'Output/MID',datestr(now,'yyyymmdd'));
end

EventName = 'baseline_year_1_arm_1';
TaskName = 'mid_exported_';
dateVar = datestr(now,'yyyymmdd');

t0 = datetime('now','Format','HH:mm:ss.SSS'); % Mark script runtime

mid_output = '/Users/tc587/fMRI/ABCD/Output/MID/MID_Output.txt'; % MID Output File

% Create MID Output Directory outside of the NBack Analysis Package
if ~exist(outputDir,'dir')
    mkdir(outputDir);
end

%% 
% open MID Behavior file
fidMID = fopen(fullfile(outputDir,['MIDBehaviorMID_',dateVar,'.csv']),'w');

% List output variables
%
condsMID = {'Site','Subject','ExperimentName','Version',...
    'OverallMoney','OverallCombinedRewardHitRate','OverallCombinedRewardMissRate',...
    'OverallCombinedRewardMeanRT','OverallCombinedRewardRT_Std','OverallCombinedLossHitRate',...
    'OverallCombinedLossMissRate','OverallCombinedLossMeanRT','OverallCombinedLossRT_Std',...
    'OverallSmallRewardHitRate','OverallSmallRewardMissRate','OverallSmallRewardMeanRT',...
    'OverallSmallRewardRT_Std','OverallLargeRewardHitRate','OverallLargeRewardMissRate',...
    'OverallLargeRewardMeanRT','OverallLargeRewardRT_Std','OverallSmallLossHitRate',...
    'OverallSmallLossMissRate','OverallSmallLossMeanRT','OverallSmallLossRT_Std',...
    'OverallLargeLossHitRate','OverallLargeLossMissRate','OverallLargeLossMeanRT',...
    'OverallLargeLossRT_Std','OverallNeutralHitRate','OverallNeutralMissRate',...
    'OverallNeutralMeanRT','OverallNeutralRT_Std','run1Money','run1CombinedRewardHitRate',...
    'run1CombinedRewardMissRate','run1CombinedRewardMeanRT','run1CombinedRewardRT_Std',...
    'run1CombinedLossHitRate','run1CombinedLossMissRate','run1CombinedLossMeanRT',...
    'run1CombinedLossRT_Std','run1SmallRewardHitRate','run1SmallRewardMissRate',...
    'run1SmallRewardMeanRT','run1SmallRewardRT_Std','run1LargeRewardHitRate',...
    'run1LargeRewardMissRate','run1LargeRewardMeanRT','run1LargeRewardRT_Std',...
    'run1SmallLossHitRate','run1SmallLossMissRate','run1SmallLossMeanRT',...
    'run1SmallLossRT_Std','run1LargeLossHitRate','run1LargeLossMissRate',...
    'run1LargeLossMeanRT','run1LargeLossRT_Std','run1NeutralHitRate',...
    'run1NeutralMissRate','run1NeutralMeanRT','run1NeutralRT_Std',...
    'run2Money','run2CombinedRewardHitRate','run2CombinedRewardMissRate',...
    'run2CombinedRewardMeanRT','run2CombinedRewardRT_Std','run2CombinedLossHitRate',...
    'run2CombinedLossMissRate','run2CombinedLossMeanRT','run2CombinedLossRT_Std',...
    'run2SmallRewardHitRate','run2SmallRewardMissRate','run2SmallRewardMeanRT',...
    'run2SmallRewardRT_Std','run2LargeRewardHitRate','run2LargeRewardMissRate',...
    'run2LargeRewardMeanRT','run2LargeRewardRT_Std','run2SmallLossHitRate',...
    'run2SmallLossMissRate','run2SmallLossMeanRT','run2SmallLossRT_Std',...
    'run2LargeLossHitRate','run2LargeLossMissRate','run2LargeLossMeanRT',...
    'run2LargeLossRT_Std','run2NeutralHitRate','run2NeutralMissRate',...
    'run2NeutralMeanRT','run2NeutralRT_Std'};
%}


% Print each output variable to csv header for MID
for i = 1:length(condsMID)
    printType = '%s';
    printCond = cell2mat(condsMID(i));
    fprintf(fidMID, [printType ','],printCond);
end

% Close csv file
%fclose(fidMID);

%% Navigating dat directories
% Pull directories names for each site
sites = dir(dataDir);
sites = sites(arrayfun(@(x)x.name(1),sites) ~='.'); % Removes any hidden directories with '.' in name
sites = {sites.name}';

for sitez = 1:length(sites)
    Site = sites{sitez};
    siteDir = fullfile(dataDir,Site);
    
    subs = dir(siteDir);
    subs = subs(arrayfun(@(x)x.name(1), subs) ~='.'); % Data file is not a hidden file
    subs = subs(arrayfun(@(x)x.name(1), subs) =='N'); % Data is a participant (not phantom)
    subs = {subs.name}'; % List participants at indexed site
    
    for subjz = 1:size(subs,1)
        ID = subs{subjz};
        if strfind(ID,'_backup')
            shortID = ID(9:STRFIND(ID,'_backup')-1);
        else
            shortID = ID(9:end);
        end
        subBaseDir = fullfile(dataDir,Site,ID,EventName);
        x = dir(subBaseDir);
        x = x(arrayfun(@(x)x.name(1), x)~='.');
        ct = 1;
        
        try
            while isempty(strfind(x(ct).name,'mid-exported'))
                ct = ct+1;
            end
        catch
            if eSite(1).site == 1 % Initiate error counting
                eSite(eSite_count).site = Site;
                eSite(eSite_count).part(eID_count).ID = ID;
                eSite(eSite_count).part(eID_count).eTask(1) = {'MID'};
                eID_count = eID_count+1;
            elseif strcmp(eSite(end).site,Site) % error count; log ID within site
                %eSite(eSite_count).site = Site;
                eSite(eSite_count).part(eID_count).ID = ID;
                eSite(eSite_count).part(eID_count).eTask(1) = {'MID'};
                eID_count = eID_count+1;
            else % error count; initiate log within new
                eSite_count = eSite_count+1;
                eSite(eSite_count).site = Site;
                eSite(eSite_count).part(eID_count).ID = ID;
                eSite(eSite_count).part(eID_count).eTask(1) = {'MID'};
                eID_count = 1;
            end
            [h,m,s] = hms(datetime('now','Format','HH:mm:ss.SS')-t0); % Clock script runtime
            fprintf('Skipping MID... Site: %s, ID: %s, elapsed_time: %01.0f:%02.0f:%02.2f\n',Site,ID,h,m,s); % Print runtime
            continue
            %break
        end
        
        % Generate the participant's data directory
        subDataDir = fullfile(subBaseDir,x(ct).name);
        subDataMID = cell2table(cell(0,5));
        subDataFile = dir(subDataDir);
        subDataFile = subDataFile(arrayfun(@(x)x.name(1),subDataFile)~='.');
        
        i = 1;
        
        % Find the participant's MID data and import the data to a variable
        while isempty(subDataMID) || strcmp(table2array(subDataMID(1,1)),'ExperimentName')==false && i<=length(subDataFile)
            subDataPath = [];
            if strfind(subDataFile(i).name,[shortID,'_MID'])
                subDataPath = fullfile(subDataFile(i).folder,subDataFile(i).name);
                subDataMID = importSubjDataMIDtable(subDataPath);
            end
            i = i+1;
        end
        
        % Columns of interest for performance Data. Cut NaN entries from
        % variable.
        Conditions_MID = {'Block','SubTrial','Condition','prbacc','prbrt','RunMoney'};
        nanInd = isnan(table2array(subDataMID(:,'prbacc')));
        subDataMID = subDataMID(~nanInd,:);
        
        % Compute Variables of interest for Output
        % Overall = run1&2; Combined = Small and Large; 
        run1Ind = find(table2array(subDataMID(:,'Block'))==1);
        run2Ind = find(table2array(subDataMID(:,'Block'))==2);
        rewardInd = ~cellfun('isempty',strfind(table2array(subDataMID(:,'Condition')),'Reward'));
        punishInd = ~cellfun('isempty',strfind(table2array(subDataMID(:,'Condition')),'Pun'));
        lgrewardInd = strcmp(table2array(subDataMID(:,'Condition')),'LgReward');
        smrewardInd = strcmp(table2array(subDataMID(:,'Condition')),'SmallReward');
        lgpunishInd = strcmp(table2array(subDataMID(:,'Condition')),'LgPun');
        smpunishInd = strcmp(table2array(subDataMID(:,'Condition')),'SmallPun');
        neutralInd = strcmp(table2array(subDataMID(:,'Condition')),'Triangle');
        
        nTrials = length(table2array(subDataMID(:,'SubTrial')));
        OverallMoney = sum(table2array(subDataMID(:,'RunMoney')));
        OverallCombinedRewardHitRate = sum(table2array(subDataMID(rewardInd,'prbacc')))/nTrials;
        OverallCombinedRewardMissRate = 1-OverallCombinedRewardHitRate;
        OverallCombinedRewardMeanRT = mean(table2array(subDataMID(rewardInd,'prbrt')));
        OverallCombinedRewardRT_Std = std(table2array(subDataMID(rewardInd,'prbrt')));
        OverallCombinedLossHitRate = sum(table2array(subDataMID(punishInd,'prbacc')))/nTrials;
        OverallCombinedLossMissRate = 1-OverallCombinedLossHitRate;
        OverallCombinedLossMeanRT = mean(table2array(subDataMID(punishInd,'prbrt')));
        OverallCombinedLossRT_Std = std(table2array(subDataMID(punishInd,'prbrt')));
        OverallSmallRewardHitRate = sum(table2array(subDataMID(smrewardInd,'prbacc')))/nTrials;
        OverallSmallRewardMissRate	= 1-OverallSmallRewardHitRate;
        OverallSmallRewardMeanRT = mean(table2array(subDataMID(smrewardInd,'prbrt')));
        OverallSmallRewardRT_Std = std(table2array(subDataMID(smrewardInd,'prbrt')));
        OverallLargeRewardHitRate = sum(table2array(subDataMID(lgrewardInd,'prbrt')));
        OverallLargeRewardMissRate
        OverallLargeRewardMeanRT
        OverallLargeRewardRT_Std
        OverallSmallLossHitRate
        OverallSmallLossMissRate
        OverallSmallLossMeanRT
        OverallSmallLossRT_Std
        OverallLargeLossHitRate
        OverallLargeLossMissRate
        OverallLargeLossMeanRT
        OverallLargeLossRT_Std
        OverallNeutralHitRate
        OverallNeutralMissRate
        OverallNeutralMeanRT
        OverallNeutralRT_Std
        run1Money
        run1CombinedRewardHitRate
        run1CombinedRewardMissRate
        run1CombinedRewardMeanRT
        run1CombinedRewardRT_Std
        run1CombinedLossHitRate
        run1CombinedLossMissRate
        run1CombinedLossMeanRT
        run1CombinedLossRT_Std
        run1SmallRewardHitRate
        run1SmallRewardMissRate
        run1SmallRewardMeanRT
        run1SmallRewardRT_Std
        run1LargeRewardHitRate
        run1LargeRewardMissRate
        run1LargeRewardMeanRT
        run1LargeRewardRT_Std
        run1SmallLossHitRate
        run1SmallLossMissRate
        run1SmallLossMeanRT
        run1SmallLossRT_Std
        run1LargeLossHitRate
        run1LargeLossMissRate
        run1LargeLossMeanRT
        run1LargeLossRT_Std
        run1NeutralHitRate
        run1NeutralMissRate
        run1NeutralMeanRT
        run1NeutralRT_Std
        run2Money
        run2CombinedRewardHitRate
        run2CombinedRewardMissRate
        run2CombinedRewardMeanRT
        run2CombinedRewardRT_Std
        run2CombinedLossHitRate
        run2CombinedLossMissRate
        run2CombinedLossMeanRT
        run2CombinedLossRT_Std
        run2SmallRewardHitRate
        run2SmallRewardMissRate
        run2SmallRewardMeanRT
        run2SmallRewardRT_Std
        run2LargeRewardHitRate
        run2LargeRewardMissRate
        run2LargeRewardMeanRT
        run2LargeRewardRT_Std
        run2SmallLossHitRate
        run2SmallLossMissRate
        run2SmallLossMeanRT
        run2SmallLossRT_Std
        run2LargeLossHitRate
        run2LargeLossMissRate
        run2LargeLossMeanRT
        run2LargeLossRT_Std
        run2NeutralHitRate
        run2NeutralMissRate
        run2NeutralMeanRT
        run2NeutralRT_Std
        
        printVar = {Site,ID,ExperimentName,Version};
        
        
        % printVars to textfile
        for i = 1:length(printVars)
            if ischar(printVars{i})
                printType = '%s';
            elseif isa(printVars{i},'double')
                printType = '%d';
            end
            fprintf(fidMID,[printType ','],printVars{i})
        end
        fprintf(fidMID,'\n')
        
    end
end

        









