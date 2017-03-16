
dbstop if error
% Create string for MID
Home = getenv('HOME');
if ~exist('dataDir','var')
    dataDir = uigetdir;
%    dataDir = '/Users/tc587/fMRI/ABCD/AWS_Data/aux_incoming_Feb_2017/';
    scriptDir = fullfile(pwd);
    a = regexp(scriptDir,'/');
    outputDir = fullfile(scriptDir(1:a(end-1)),'Output/MID',datestr(now,'yyyymmdd'));
end

EventName = 'baseline_year_1_arm_1';
TaskName = 'mid_exported_';
dateVar = datestr(now,'yyyymmdd');

t0 = datetime('now','Format','HH:mm:ss.SSS'); % Mark script runtime

%mid_output = '/Users/tc587/fMRI/ABCD/Output/MID/MID_Output.txt'; % MID Output File

% Create MID Output Directory outside of the NBack Analysis Package
if ~exist(outputDir,'dir')
    mkdir(outputDir);
end

%% Open MID Output File with Header Labels
% open MID Behavior file
fidMID = fopen(fullfile(outputDir,['MIDBehavior_',dateVar,'.csv']),'w');

% List output variables
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
fprintf(fidMID,'\n');

%% Navigating data directories
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
            shortID = ID(9:strfind(ID,'_backup')-1);
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
            %             if eSite(1).site == 1 % Initiate error counting
            %                 eSite(eSite_count).site = Site;
            %                 eSite(eSite_count).part(eID_count).ID = ID;
            %                 eSite(eSite_count).part(eID_count).eTask(1) = {'MID'};
            %                 eID_count = eID_count+1;
            %             elseif strcmp(eSite(end).site,Site) % error count; log ID within site
            %                 %eSite(eSite_count).site = Site;
            %                 eSite(eSite_count).part(eID_count).ID = ID;
            %                 eSite(eSite_count).part(eID_count).eTask(1) = {'MID'};
            %                 eID_count = eID_count+1;
            %             else % error count; initiate log within new
            %                 eSite_count = eSite_count+1;
            %                 eSite(eSite_count).site = Site;
            %                 eSite(eSite_count).part(eID_count).ID = ID;
            %                 eSite(eSite_count).part(eID_count).eTask(1) = {'MID'};
            %                 eID_count = 1;
            %             end
            [h,m,s] = hms(datetime('now','Format','HH:mm:ss.SS')-t0); % Clock script runtime
            fprintf('Skipping MID... Site: %s, ID: %s, elapsed_time: %01.0f:%02.0f:%02.2f\n',Site,ID,h,m,s); % Print runtime
            continue
        end
        
        % Generate the participant's data directory
        subDataDir = fullfile(subBaseDir,x(ct).name);
        subDataMID = cell2table(cell(0,5));
        subDataFile = dir(subDataDir);
        subDataFile = subDataFile(arrayfun(@(x)x.name(1),subDataFile)~='.');
        i = 1;
        
        % Find the participant's MID data and import the data to a variable
        try
            while (isempty(subDataMID) || strcmp(table2array(subDataMID(1,1)),'ExperimentName')==false) && i<=length(subDataFile)
                subDataPath = [];
                if strfind(subDataFile(i).name,[shortID,'_MID'])
                    subDataPath = fullfile(subDataFile(i).folder,subDataFile(i).name);
                    subDataMID = importSubjDataMIDtable(subDataPath); % Use version 13
                end
                i = i+1;
            end
            
            if isempty(subDataMID) % Skip forward if subDataMID isempty
                [h,m,s] = hms(datetime('now','Format','HH:mm:ss.SS')-t0); % Clock script runtime
                fprintf('Skipping MID... Site: %s, ID: %s, elapsed_time: %01.0f:%02.0f:%02.2f\n',Site,ID,h,m,s); % Print runtime
                continue;
            end
            
            try %cell2mat(strfind(table2array(subDataMID(1,:)),'TrialOrder')) %~strcmpi(table2array(subDataMID(1,'MIDVERSION')),'MIDVERSION')
                %subDataMID = importSubjDataMID13table(subDataPath); % Use version 1-12
                version = table2array(subDataMID(2,'TrialOrder'));
            catch
                version = table2array(subDataMID(2,'MIDVERSION'));
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
            
            OverallLargeRewardHitRate = sum(table2array(subDataMID(lgrewardInd,'prbacc')))/nTrials;
            OverallLargeRewardMissRate = 1-OverallLargeRewardHitRate;
            OverallLargeRewardMeanRT = mean(table2array(subDataMID(lgrewardInd,'prbrt')));
            OverallLargeRewardRT_Std = std(table2array(subDataMID(lgrewardInd,'prbrt')));
            
            OverallSmallLossHitRate = sum(table2array(subDataMID(smpunishInd,'prbacc')))/nTrials;
            OverallSmallLossMissRate = 1-OverallSmallLossHitRate;
            OverallSmallLossMeanRT = mean(table2array(subDataMID(smpunishInd,'prbrt')));
            OverallSmallLossRT_Std = std(table2array(subDataMID(smpunishInd,'prbrt')));
            
            OverallLargeLossHitRate = sum(table2array(subDataMID(lgpunishInd,'prbacc')))/nTrials;
            OverallLargeLossMissRate = 1-OverallLargeLossHitRate;
            OverallLargeLossMeanRT = mean(table2array(subDataMID(lgpunishInd,'prbrt')));
            OverallLargeLossRT_Std = std(table2array(subDataMID(lgpunishInd,'prbrt')));
            
            OverallNeutralHitRate = sum(table2array(subDataMID(neutralInd,'prbacc')))/nTrials;
            OverallNeutralMissRate = 1-OverallLargeLossMissRate;
            OverallNeutralMeanRT = mean(table2array(subDataMID(neutralInd,'prbrt')));
            OverallNeutralRT_Std = std(table2array(subDataMID(neutralInd,'prbrt')));
            
            run1Money = sum(table2array(subDataMID(run1Ind,'RunMoney')));
            run1CombinedRewardHitRate = sum(table2array(subDataMID(rewardInd(1:50),'prbacc')))/(nTrials/2);
            run1CombinedRewardMissRate = 1-run1CombinedRewardHitRate;
            run1CombinedRewardMeanRT = mean(table2array(subDataMID(rewardInd(1:50),'prbrt')));
            run1CombinedRewardRT_Std = std(table2array(subDataMID(rewardInd(1:50),'prbrt')));
            
            run1CombinedLossHitRate = sum(table2array(subDataMID(punishInd(1:50),'prbacc')))/(nTrials/2);
            run1CombinedLossMissRate = 1-run1CombinedLossHitRate;
            run1CombinedLossMeanRT = mean(table2array(subDataMID(punishInd(1:50),'prbrt')));
            run1CombinedLossRT_Std = std(table2array(subDataMID(punishInd(1:50),'prbrt')));
            
            run1SmallRewardHitRate = sum(table2array(subDataMID(smrewardInd(1:50),'prbacc')))/(nTrials/2);
            run1SmallRewardMissRate = 1-run1SmallRewardHitRate;
            run1SmallRewardMeanRT = mean(table2array(subDataMID(smrewardInd(1:50),'prbrt')));
            run1SmallRewardRT_Std = std(table2array(subDataMID(smrewardInd(1:50),'prbrt')));
            
            run1LargeRewardHitRate = sum(table2array(subDataMID(lgrewardInd(1:50),'prbacc')))/(nTrials/2);
            run1LargeRewardMissRate = 1-run1LargeRewardHitRate;
            run1LargeRewardMeanRT = mean(table2array(subDataMID(lgrewardInd(1:50),'prbrt')));
            run1LargeRewardRT_Std = std(table2array(subDataMID(lgrewardInd(1:50),'prbrt')));
            
            run1SmallLossHitRate = sum(table2array(subDataMID(smpunishInd(1:50),'prbacc')))/(nTrials/2);
            run1SmallLossMissRate = 1-run1SmallLossHitRate;
            run1SmallLossMeanRT = mean(table2array(subDataMID(smpunishInd(1:50),'prbrt')));
            run1SmallLossRT_Std = std(table2array(subDataMID(smpunishInd(1:50),'prbrt')));
            
            run1LargeLossHitRate = sum(table2array(subDataMID(lgpunishInd(1:50),'prbacc')))/(nTrials/2);
            run1LargeLossMissRate = 1- run1LargeLossHitRate;
            run1LargeLossMeanRT = mean(table2array(subDataMID(lgpunishInd(1:50),'prbrt')));
            run1LargeLossRT_Std = std(table2array(subDataMID(lgpunishInd(1:50),'prbrt')));
            
            run1NeutralHitRate = sum(table2array(subDataMID(neutralInd(1:50),'prbacc')))/(nTrials/2);
            run1NeutralMissRate = 1-run1NeutralHitRate;
            run1NeutralMeanRT = mean(table2array(subDataMID(neutralInd(1:50),'prbrt')));
            run1NeutralRT_Std = std(table2array(subDataMID(neutralInd(1:50),'prbrt')));
            
            run2Money = sum(table2array(subDataMID(run2Ind,'RunMoney')));
            run2CombinedRewardHitRate = sum(table2array(subDataMID(rewardInd(51:end),'prbacc')))/(nTrials/2);
            run2CombinedRewardMissRate = 1-run2CombinedRewardHitRate;
            run2CombinedRewardMeanRT = mean(table2array(subDataMID(rewardInd(51:end),'prbrt')));
            run2CombinedRewardRT_Std = std(table2array(subDataMID(rewardInd(51:end),'prbrt')));
            
            run2CombinedLossHitRate = sum(table2array(subDataMID(punishInd(51:end),'prbacc')))/(nTrials/2);
            run2CombinedLossMissRate = 1-run2CombinedLossHitRate;
            run2CombinedLossMeanRT = mean(table2array(subDataMID(punishInd(51:end),'prbrt')));
            run2CombinedLossRT_Std = std(table2array(subDataMID(punishInd(51:end),'prbrt')));
            
            run2SmallRewardHitRate = sum(table2array(subDataMID(smrewardInd(51:end),'prbacc')))/(nTrials/2);
            run2SmallRewardMissRate = 1-run2SmallRewardHitRate;
            run2SmallRewardMeanRT = mean(table2array(subDataMID(smrewardInd(51:end),'prbrt')));
            run2SmallRewardRT_Std = std(table2array(subDataMID(smrewardInd(51:end),'prbrt')));
            
            run2LargeRewardHitRate = sum(table2array(subDataMID(lgrewardInd(51:end),'prbacc')))/(nTrials/2);
            run2LargeRewardMissRate = 1-run2LargeRewardHitRate;
            run2LargeRewardMeanRT = mean(table2array(subDataMID(lgrewardInd(51:end),'prbrt')));
            run2LargeRewardRT_Std = std(table2array(subDataMID(lgrewardInd(51:end),'prbrt')));
            
            run2SmallLossHitRate = sum(table2array(subDataMID(smpunishInd(51:end),'prbacc')))/(nTrials/2);
            run2SmallLossMissRate = 1-run2SmallLossHitRate;
            run2SmallLossMeanRT = mean(table2array(subDataMID(smpunishInd(51:end),'prbrt')));
            run2SmallLossRT_Std = std(table2array(subDataMID(smpunishInd(51:end),'prbrt')));
            
            run2LargeLossHitRate = sum(table2array(subDataMID(lgpunishInd(51:end),'prbacc')))/(nTrials/2);
            run2LargeLossMissRate = 1-run2LargeLossHitRate;
            run2LargeLossMeanRT = mean(table2array(subDataMID(lgpunishInd(51:end),'prbrt')));
            run2LargeLossRT_Std = std(table2array(subDataMID(lgpunishInd(51:end),'prbrt')));
            
            run2NeutralHitRate = sum(table2array(subDataMID(neutralInd(51:end),'prbacc')))/(nTrials/2);
            run2NeutralMissRate = 1-run2NeutralHitRate;
            run2NeutralMeanRT = mean(table2array(subDataMID(neutralInd(51:end),'prbrt')));
            run2NeutralRT_Std = std(table2array(subDataMID(neutralInd(51:end),'prbrt')));
            
            if isnan(OverallCombinedRewardMeanRT)
                1;
            end
            
            printVars = {Site,ID,table2array(subDataMID(2,'ExperimentName')),version,OverallMoney,...
                OverallCombinedRewardHitRate, OverallCombinedRewardMissRate,...
                OverallCombinedRewardMeanRT, OverallCombinedRewardRT_Std,...
                OverallCombinedLossHitRate, OverallCombinedLossMissRate,...
                OverallCombinedLossMeanRT, OverallCombinedLossRT_Std,...
                OverallSmallRewardHitRate, OverallSmallRewardMissRate,...
                OverallSmallRewardMeanRT, OverallSmallRewardRT_Std,...
                OverallLargeRewardHitRate, OverallLargeRewardMissRate,...
                OverallLargeRewardMeanRT, OverallLargeRewardRT_Std,...
                OverallSmallLossHitRate, OverallSmallLossMissRate,...
                OverallSmallLossMeanRT,	OverallSmallLossRT_Std,...
                OverallLargeLossHitRate, OverallLargeLossMissRate,...
                OverallLargeLossMeanRT, OverallLargeLossRT_Std,...
                OverallNeutralHitRate, OverallNeutralMissRate,...
                OverallNeutralMeanRT, OverallNeutralRT_Std,...
                run1Money, run1CombinedRewardHitRate,...
                run1CombinedRewardMissRate, run1CombinedRewardMeanRT,...
                run1CombinedRewardRT_Std, run1CombinedLossHitRate,...
                run1CombinedLossMissRate, run1CombinedLossMeanRT,...
                run1CombinedLossRT_Std, run1SmallRewardHitRate,...
                run1SmallRewardMissRate, run1SmallRewardMeanRT,...
                run1SmallRewardRT_Std, run1LargeRewardHitRate,...
                run1LargeRewardMissRate, run1LargeRewardMeanRT,...
                run1LargeRewardRT_Std, run1SmallLossHitRate,...
                run1SmallLossMissRate, run1SmallLossMeanRT,...
                run1SmallLossRT_Std, run1LargeLossHitRate,...
                run1LargeLossMissRate, run1LargeLossMeanRT,...
                run1LargeLossRT_Std, run1NeutralHitRate,...
                run1NeutralMissRate, run1NeutralMeanRT,...
                run1NeutralRT_Std, run2Money,...
                run2CombinedRewardHitRate, run2CombinedRewardMissRate,...
                run2CombinedRewardMeanRT, run2CombinedRewardRT_Std,...
                run2CombinedLossHitRate, run2CombinedLossMissRate,...
                run2CombinedLossMeanRT, run2CombinedLossRT_Std,...
                run2SmallRewardHitRate, run2SmallRewardMissRate,...
                run2SmallRewardMeanRT, run2SmallRewardRT_Std,...
                run2LargeRewardHitRate, run2LargeRewardMissRate,...
                run2LargeRewardMeanRT, run2LargeRewardRT_Std,...
                run2SmallLossHitRate, run2SmallLossMissRate, ...
                run2SmallLossMeanRT, run2SmallLossRT_Std,...
                run2LargeLossHitRate, run2LargeLossMissRate,...
                run2LargeLossMeanRT, run2LargeLossRT_Std,...
                run2NeutralHitRate, run2NeutralMissRate,...
                run2NeutralMeanRT, run2NeutralRT_Std};
        catch
            [h,m,s] = hms(datetime('now','Format','HH:mm:ss.SS')-t0); % Clock script runtime
            fprintf('Skipping MID... Site: %s, ID: %s, elapsed_time: %01.0f:%02.0f:%02.2f\n',Site,ID,h,m,s); % Print runtime
            continue;
        end
        
        % printVars to textfile
        for i = 1:length(printVars)
            %printIt;
            if isa(printVars{i},'cell')
                printIt = cell2mat(printVars{i});
            else
                printIt = printVars{i};
            end
            
            if ischar(printIt)
                printType = '%s';
            elseif isa(printIt,'double')
                printType = '%2.4f';
            end
            fprintf(fidMID,[printType ','],printIt);
        end
        fprintf(fidMID,'\n');
        [h,m,s] = hms(datetime('now','Format','HH:mm:ss.SS')-t0); % Clock script runtime
        fprintf('Site: %s, ID: %s, elapsed_time: %01.0f:%02.0f:%02.2f\n',Site,ID,h,m,s); % Print runtime
        clear subDataMID
    end
end











