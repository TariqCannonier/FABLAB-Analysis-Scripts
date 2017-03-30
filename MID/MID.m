
dbstop if error
% Create string for MID_
if ~exist('dataDir','var')
    %dataDir = '/Users/tariqcannonier/Documents/aux_incoming_Feb_2017/';% Indicate where the data is housed
    scriptDir = fullfile(pwd);
    a = regexp(scriptDir,'/');
    Home = getenv('HOME');
    dataDir = [Home, fullfile(scriptDir(a(3):a(end-1)),'aux_incoming_Feb_2017')];
    outputDir = [Home, fullfile(scriptDir(a(3):a(end-1)),'Output/MID',datestr(now,'yyyymmdd'))];
    %outputDir = fullfile(scriptDir(1:a(end-1)),'Output/MID',datestr(now,'yyyymmdd'));
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

%%
% open MID Behavior file
fidMID = fopen(fullfile(outputDir,['MIDBehavior_',dateVar,'.csv']),'w');

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
fprintf(fidMID,'\n');

% Close csv file
%fclose(fidMID);

%% Navigating data directories
% Pull directories names for each site
sites = dir(dataDir);
sites = sites(arrayfun(@(x)x.name(1),sites) ~='.'); % Removes any hidden directories with '.' in name
sites = {sites.name}';

for sitez = 1:length(sites) % Change back to 1 to start from top of cohort.  Change for debugging.
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
            %break
        end
        
        % Generate the participant's data directory
        subDataDir = fullfile(subBaseDir,x(ct).name);
        subDataMID = cell2table(cell(0,5));
        subDataFile = dir(subDataDir);
        subDataFile = subDataFile(arrayfun(@(x)x.name(1),subDataFile)~='.');
        
        i = 1;
        if any(strcmp(ID,{'NDAR_INV81W1WMVM','NDAR_INV2P3B9TGH','NDAR_INV4M8H34KB','NDAR_INV32GN03AZ_backup'}))
            1;%continue;
        end
        
        if strcmp(Site,'LIBR')
            1;
        end
        % Find the participant's MID data and import the data to a variable
        while (isempty(subDataMID) || strcmp(subDataMID.ExperimentName(1),'ExperimentName')==false) && i<=length(subDataFile)
            subDataPath = [];
            if strfind(subDataFile(i).name,[shortID,'_MID'])
                subDataPath = fullfile(subDataFile(i).folder,subDataFile(i).name); % Import assuming old Siemens/Phillips scripts
                subDataMID = importSubjDataMIDtable(subDataPath); % Use version 13
                version = subDataMID.MIDVERSION(2);
            end
            if isempty(subDataPath) || isempty(subDataMID)
                i = i+1;
                continue;
            elseif cell2mat(strfind(subDataMID.ExperimentName(1),'edit')) % If first row contains phrase "edit" delete row.
                subDataMID(1,:) = [];
            end
            i = i+1;
        end
        
        if isempty(subDataMID) % If MID was not found in directory for NDARGUID
            [h,m,s] = hms(datetime('now','Format','HH:mm:ss.SS')-t0); % Clock script runtime
            fprintf('Skipping MID... Site: %s, ID: %s, elapsed_time: %01.0f:%02.0f:%02.2f\n',Site,ID,h,m,s); % Print runtime
            continue;
        elseif cell2mat(strfind(subDataMID.ExperimentName(2),'GE')) % If using GE scanner.  Otherwise Phillips/Siemens
            if strcmpi(subDataMID.MIDVERSION(1),'MIDVERSION') % Uses old version
                subDataMID = importSubjDataMIDGEDecrepit(subDataPath);
                version = subDataMID.MIDVERSION(2);
            else
                subDataMID = importSubjDataMIDGE(subDataPath);
                version = subDataMID.TrialOrder(2);
            end
        elseif ~strcmpi(subDataMID.MIDVERSION(1),'MIDVERSION') % Using new Phillips/Siemens scripts
            if strcmpi(subDataMID.SessionTime(1),'TrialOrder') % Using the Dec experiment package
                %subDataMID = importSubjDataMIDtableDecrepit(subDataPath);
                subDataMID = importSubjDataMID13table(subDataPath);
            end
            if isa(subDataMID,'logical')
                if subDataMID == false
                    continue
                end
            end
            version = subDataMID.TrialOrder(2);
        elseif strcmpi(table2array(subDataMID.ExperimentName(2)),'Behavioral')
            %subDataMID = importSubjDataMID13table(subDataPath); % Use version 1-12
            if cell2mat(strfind(subDataMID.DataFileBasename(2),'Behavioral'))
                subDataMID = importSubjDataMIDBehavtable(subDataPath);
            end
            version = subDataMID.TrialOrder(2);
        end
        %{
        if isempty(subDataMID) % Skip forward if subDataMID isempty
            continue;
        end
        %}
        
        % Columns of interest for performance Data. Cut NaN entries from
        % variable.
        Conditions_MID = {'Block','SubTrial','Condition','prbacc','prbrt','RunMoney'};
        nanInd = isnan(subDataMID.prbacc);
        subDataMID = subDataMID(~nanInd,:);
        
        try
            % Compute Variables of interest for Output
            % Overall = run1&2; Combined = Small and Large;
            run1Ind = find(subDataMID.Block==1);
            run2Ind = find(subDataMID.Block==2);
            rewardInd = ~cellfun('isempty',strfind(subDataMID.Condition,'Reward'));
            punishInd = ~cellfun('isempty',strfind(subDataMID.Condition,'Pun'));
            lgrewardInd = strcmp(subDataMID.Condition,'LgReward');
            smrewardInd = strcmp(subDataMID.Condition,'SmallReward');
            lgpunishInd = strcmp(subDataMID.Condition,'LgPun');
            smpunishInd = strcmp(subDataMID.Condition,'SmallPun');
            neutralInd = strcmp(subDataMID.Condition,'Triangle');
            
            nTrials = length(subDataMID.SubTrial);
            OverallMoney = sum(subDataMID.RunMoney);
            OverallCombinedRewardHitRate = sum(subDataMID.prbacc(rewardInd))/nTrials;
            OverallCombinedRewardMissRate = 1-OverallCombinedRewardHitRate;
            OverallCombinedRewardMeanRT = mean(subDataMID.prbrt(rewardInd));
            OverallCombinedRewardRT_Std = std(subDataMID.prbrt(rewardInd));
            
            OverallCombinedLossHitRate = sum(subDataMID.prbacc(punishInd))/nTrials;
            OverallCombinedLossMissRate = 1-OverallCombinedLossHitRate;
            OverallCombinedLossMeanRT = mean(subDataMID.prbrt(punishInd));
            OverallCombinedLossRT_Std = std(subDataMID.prbrt(punishInd));
            
            OverallSmallRewardHitRate = sum(subDataMID.prbacc(smrewardInd))/nTrials;
            OverallSmallRewardMissRate	= 1-OverallSmallRewardHitRate;
            OverallSmallRewardMeanRT = mean(subDataMID.prbrt(smrewardInd));
            OverallSmallRewardRT_Std = std(subDataMID.prbrt(smrewardInd));
            
            OverallLargeRewardHitRate = sum(subDataMID.prbacc(lgrewardInd))/nTrials;
            OverallLargeRewardMissRate = 1-OverallLargeRewardHitRate;
            OverallLargeRewardMeanRT = mean(subDataMID.prbacc(lgrewardInd));
            OverallLargeRewardRT_Std = std(subDataMID.prbacc(lgrewardInd));
            
            OverallSmallLossHitRate = sum(subDataMID.prbacc(smpunishInd))/nTrials;
            OverallSmallLossMissRate = 1-OverallSmallLossHitRate;
            OverallSmallLossMeanRT = mean(subDataMID.prbrt(smpunishInd));
            OverallSmallLossRT_Std = std(subDataMID.prbrt(smpunishInd));
            
            OverallLargeLossHitRate = sum(subDataMID.prbacc(lgpunishInd))/nTrials;
            OverallLargeLossMissRate = 1-OverallLargeLossHitRate;
            OverallLargeLossMeanRT = mean(subDataMID.prbrt(lgpunishInd));
            OverallLargeLossRT_Std = std(subDataMID.prbrt(lgpunishInd));
            
            OverallNeutralHitRate = sum(subDataMID.prbacc(neutralInd))/nTrials;
            OverallNeutralMissRate = 1-OverallLargeLossMissRate;
            OverallNeutralMeanRT = mean(subDataMID.prbrt(neutralInd));
            OverallNeutralRT_Std = std(subDataMID.prbrt(neutralInd));
            
            run1Money = sum(subDataMID.RunMoney(run1Ind));
            run1CombinedRewardHitRate = sum(subDataMID.prbacc(rewardInd(1:50)))/(nTrials/2);
            run1CombinedRewardMissRate = 1-run1CombinedRewardHitRate;
            run1CombinedRewardMeanRT = mean(subDataMID.prbrt(rewardInd(1:50)));
            run1CombinedRewardRT_Std = std(subDataMID.prbrt(rewardInd(1:50)));
            
            run1CombinedLossHitRate = sum(subDataMID.prbacc(punishInd(1:50)))/(nTrials/2);
            run1CombinedLossMissRate = 1-run1CombinedLossHitRate;
            run1CombinedLossMeanRT = mean(subDataMID.prbrt(punishInd(1:50)));
            run1CombinedLossRT_Std = std(subDataMID.prbrt(punishInd(1:50)));
            
            run1SmallRewardHitRate = sum(subDataMID.prbacc(smrewardInd(1:50)))/(nTrials/2);
            run1SmallRewardMissRate = 1-run1SmallRewardHitRate;
            run1SmallRewardMeanRT = mean(subDataMID.prbacc(smrewardInd(1:50)));
            run1SmallRewardRT_Std = std(subDataMID.prbacc(smrewardInd(1:50)));
            
            run1LargeRewardHitRate = sum(subDataMID.prbacc(lgrewardInd(1:50)))/(nTrials/2);
            run1LargeRewardMissRate = 1-run1LargeRewardHitRate;
            run1LargeRewardMeanRT = mean(subDataMID.prbrt(lgrewardInd(1:50)));
            run1LargeRewardRT_Std = std(subDataMID.prbrt(lgrewardInd(1:50)));
            
            run1SmallLossHitRate = sum(subDataMID.prbacc(smpunishInd(1:50)))/(nTrials/2);
            run1SmallLossMissRate = 1-run1SmallLossHitRate;
            run1SmallLossMeanRT = mean(subDataMID.prbrt(smpunishInd(1:50)));
            run1SmallLossRT_Std = std(subDataMID.prbrt(smpunishInd(1:50)));
            
            run1LargeLossHitRate = sum(subDataMID.prbacc(lgpunishInd(1:50)))/(nTrials/2);
            run1LargeLossMissRate = 1- run1LargeLossHitRate;
            run1LargeLossMeanRT = mean(subDataMID.prbrt(lgpunishInd(1:50)));
            run1LargeLossRT_Std = std(subDataMID.prbrt(lgpunishInd(1:50)));
            
            run1NeutralHitRate = sum(subDataMID.prbacc(neutralInd(1:50)))/(nTrials/2);
            run1NeutralMissRate = 1-run1NeutralHitRate;
            run1NeutralMeanRT = mean(subDataMID.prbrt(neutralInd(1:50)));
            run1NeutralRT_Std = std(subDataMID.prbrt(neutralInd(1:50)));
            
            run2Money = sum(subDataMID.RunMoney(run2Ind));
            run2CombinedRewardHitRate = sum(subDataMID.prbacc(rewardInd(51:end)))/(nTrials/2);
            run2CombinedRewardMissRate = 1-run2CombinedRewardHitRate;
            run2CombinedRewardMeanRT = mean(subDataMID.prbrt(rewardInd(51:end)));
            run2CombinedRewardRT_Std = std(subDataMID.prbrt(rewardInd(51:end)));
            
            run2CombinedLossHitRate = sum(subDataMID.prbacc(punishInd(51:end)))/(nTrials/2);
            run2CombinedLossMissRate = 1-run2CombinedLossHitRate;
            run2CombinedLossMeanRT = mean(subDataMID.prbrt(punishInd(51:end)));
            run2CombinedLossRT_Std = std(subDataMID.prbrt(punishInd(51:end)));
            
            run2SmallRewardHitRate = sum(subDataMID.prbacc(smrewardInd(51:end)))/(nTrials/2);
            run2SmallRewardMissRate = 1-run2SmallRewardHitRate;
            run2SmallRewardMeanRT = mean(subDataMID.prbrt(smrewardInd(51:end)));
            run2SmallRewardRT_Std = std(subDataMID.prbrt(smrewardInd(51:end)));
            
            run2LargeRewardHitRate = sum(subDataMID.prbacc(lgrewardInd(51:end)))/(nTrials/2);
            run2LargeRewardMissRate = 1-run2LargeRewardHitRate;
            run2LargeRewardMeanRT = mean(subDataMID.prbrt(lgrewardInd(51:end)));
            run2LargeRewardRT_Std = std(subDataMID.prbrt(lgrewardInd(51:end)));
            
            run2SmallLossHitRate = sum(subDataMID.prbacc(smpunishInd(51:end)))/(nTrials/2);
            run2SmallLossMissRate = 1-run2SmallLossHitRate;
            run2SmallLossMeanRT = mean(subDataMID.prbrt(smpunishInd(51:end)));
            run2SmallLossRT_Std = std(subDataMID.prbrt(smpunishInd(51:end)));
            
            run2LargeLossHitRate = sum(subDataMID.prbacc(lgpunishInd(51:end)))/(nTrials/2);
            run2LargeLossMissRate = 1-run2LargeLossHitRate;
            run2LargeLossMeanRT = mean(subDataMID.prbrt(lgpunishInd(51:end)));
            run2LargeLossRT_Std = std(subDataMID.prbrt(lgpunishInd(51:end)));
            
            run2NeutralHitRate = sum(subDataMID.prbacc(neutralInd(51:end)))/(nTrials/2);
            run2NeutralMissRate = 1-run2NeutralHitRate;
            run2NeutralMeanRT = mean(subDataMID.prbrt(neutralInd(51:end)));
            run2NeutralRT_Std = std(subDataMID.prbrt(neutralInd(51:end)));
            
            printVars = {Site,ID,subDataMID.ExperimentName(2),version,OverallMoney,...
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
            clear subDataMID
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
        fprintf('Site: %s, ID: %s, elapsed_time: %01.0f:%02.0f:%02.2f\n',Site,ID,h,m,s);
        clear subDataMID
        
    end
end
fclose(fidMID);











