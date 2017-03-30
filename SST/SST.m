
dbstop if error
% Create string for MID_
if ~exist('dataDir','var')
    %dataDir = '/Users/tariqcannonier/Documents/aux_incoming_Feb_2017/';% Indicate where the data is housed
    scriptDir = fullfile(pwd);
    a = regexp(scriptDir,'/');
    Home = getenv('HOME');
    dataDir = [Home, fullfile(scriptDir(a(3):a(end-1)),'aux_incoming_Feb_2017')];
    outputDir = [Home, fullfile(scriptDir(a(3):a(end-1)),'Output/SST',datestr(now,'yyyymmdd'))];
    %outputDir = fullfile(scriptDir(1:a(end-1)),'Output/MID',datestr(now,'yyyymmdd'));
end

EventName = 'baseline_year_1_arm_1';
TaskName = 'sst_exported_';
dateVar = datestr(now,'yyyymmdd');

t0 = datetime('now','Format','HH:mm:ss.SSS'); % Mark script runtime

%mid_output = '/Users/tc587/fMRI/ABCD/Output/MID/MID_Output.txt'; % MID Output File

% Create MID Output Directory outside of the NBack Analysis Package
if ~exist(outputDir,'dir')
    mkdir(outputDir);
end

%%
% open MID Behavior file
fidSST = fopen(fullfile(outputDir,['SSTBehavior_',dateVar,'.csv']),'w');

% List output variables
%
condsSST = {'Site','Subject','Go_Correct: Run 1 Count',...
    'Go_Correct: Run 1 Mean RT','Go_Correct: Run 1 SD RT',...
    'Go_Correct: Run 2 Count','Go_Correct: Run 2 Mean RT',...
    'Go_Correct: Run 2 SD RT','Go_Correct: Total Count',...
    'Go_Correct: Total Mean RT','Go_Correct: Total SD RT',...
    'Go_Incorrect: Run 1 Count','Go_Incorrect: Run 1 Mean RT'...
    'Go_Incorrect: Run 1 SD RT','Go_Incorrect: Run 2 Count',...
    'Go_Incorrect: Run 2 Mean RT','Go_Incorrect: Run 2 SD RT',...
    'Go_Incorrect: Total Count','Go_Incorrect: Total Mean RT',...
    'Go_Incorrect: Total SD RT','Go_CorrectLate: Run 1 Count',...
    'Go_CorrectLate: Run 1 Mean RT','Go_CorrectLate: Run 1 SD RT',...
    'Go_CorrectLate: Run 2 Count','Go_CorrectLate: Run 2 Mean RT',...
    'Go_CorrectLate: Run 2 SD RT','Go_CorrectLate: Total Count',...
    'Go_CorrectLate: Total Mean RT','Go_CorrectLate: Total SD RT',...
    'Go_NoResp: Run 1 Count','Go_NoResp: Run 2 Count',...
    'Go_NoResp: Total Count','Stop_Correct: Run 1 Count',...
    'Stop_Correct: Run 2 Count','Stop_Correct: Total Count',...
    'Stop_Incorrect: Run 1 Count','Stop_Incorrect: Run 1 Mean RT',...
    'Stop_Incorrect: Run 1 SD RT','Stop_Incorrect: Run 2 Count',...
    'Stop_Incorrect: Run 2 Mean RT','Stop_Incorrect: Run 2 SD RT'...
    'Stop_Incorrect: Total Count','Stop_Incorrect: Total Mean RT',...
    'Stop_Incorrect: Total SD RT','Go Accuracy %: Run 1',...
    'Go Accuracy %: Run 2','Go Accuracy %: Total','	Stop Accuracy %: Run 1',...
    'Stop Accuracy %: Run 2','Stop Accuracy %: Total',...
    'Trial Sum: Run 1 Count','Trial Sum: Run 2 Count','Trial Sum: Total Count'};
%}


% Print each output variable to csv header for MID
for i = 1:length(condsSST)
    printType = '%s';
    printCond = cell2mat(condsSST(i));
    fprintf(fidSST, [printType ','],printCond);
end
fprintf(fidSST,'\n');

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
            while isempty(strfind(x(ct).name,'sst-exported'))
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
            fprintf('Skipping SST... Site: %s, ID: %s, elapsed_time: %01.0f:%02.0f:%02.2f\n',Site,ID,h,m,s); % Print runtime
            continue
            %break
        end
        
        % Generate the participant's data directory
        subDataDir = fullfile(subBaseDir,x(ct).name);
        subDataSST = cell2table(cell(0,5));
        subDataFile = dir(subDataDir);
        subDataFile = subDataFile(arrayfun(@(x)x.name(1),subDataFile)~='.');
        
        i = 1;
        %if any(strcmp(ID,{'NDAR_INV2P3B9TGH','NDAR_INV4M8H34KB','NDAR_INV32GN03AZ_backup'}))
        %    continue;
        %end
        
        if strcmp(Site,'LIBR')
        %    1;
        end
        % Find the participant's MID data and import the data to a variable
        while (isempty(subDataSST) || strcmp(subDataSST.ExperimentName(1),'ExperimentName')==false) && i<=length(subDataFile)
            subDataPath = [];
            if strfind(subDataFile(i).name,[shortID,'_SST'])
                subDataPath = fullfile(subDataFile(i).folder,subDataFile(i).name);
                subDataSST = importSubjDataSST(subDataPath); % Use version 13
            end
            if isempty(subDataPath) || isempty(subDataSST)
                i = i+1;
                continue;
            elseif cell2mat(strfind(subDataSST.ExperimentName(1),'edit')) % If first row contains phrase "edit" delete row.
                subDataSST(1,:) = [];
            end
            i = i+1;
        end
        
        if isempty(subDataSST)
            [h,m,s] = hms(datetime('now','Format','HH:mm:ss.SS')-t0); % Clock script runtime
            fprintf('Skipping SST... Site: %s, ID: %s, elapsed_time: %01.0f:%02.0f:%02.2f\n',Site,ID,h,m,s); % Print runtime
            continue;
        elseif cell2mat(strfind(subDataSST.ExperimentName(2),'GE'))
            if strcmpi(subDataSST.MIDVERSION(1),'MIDVERSION')
                subDataSST = importSubjDataSSTGEDecrepit(subDataPath);
                version = subDataSST.MIDVERSION(2);
            else
                subDataSST = importSubjDataSSTGE(subDataPath);
                version = subDataSST.TrialOrder(2);
            end
        elseif ~isa(subDataSST.SSTversion(2),'double') % SSTversion does not exist before Dec 2016
            subDataSST = importSubjDataSSTDecrepit(subDataPath);
            if isa(subDataSST,'logical')
                if subDataSST == false
                    continue
                end
            end
            version = '13';
        else
            subDataSST = importSubjDataMID13table(subDataPath); % Use version 1-12
            if cell2mat(strfind(subDataSST.DataFileBasename(2),'Behavioral'))
                subDataSST = importSubjDataMIDBehavtable(subDataPath);
            end
            version = subDataSST.TrialOrder(2);
        end
        
        %{
        if isempty(subDataMID) % Skip forward if subDataMID isempty
            continue;
        end
        %}
        
        % Columns of interest for performance Data. Cut NaN entries from
        % variable.
        scanStartInd = [~isnan(subDataSST.Wait4ScannerRTTime),~isnan(subDataSST.Wait4ScannerBRTTime)];
        scanStartTime = [subDataSST.Wait4ScannerRTTime(scanStartInd(:,1)), subDataSST.Wait4ScannerBRTTime(scanStartInd(:,2))];
        scanStartTime = scanStartTime(end,:);
        
        % Determine Unique Blocks
        block = subDataSST.Block;
        [trialBlocks,uInd, ~] = unique(block);
        
        % Establishing Variables
        go_rt = subDataSST.GoRT;
        fix_rt = subDataSST.FixRT;
        go_dur = subDataSST.GoDuration;
        go_rt(go_rt==0) = fix_rt(go_rt==0) + go_dur(go_rt==0);
        stop_rt = subDataSST.StopSignalRT;
        %stop_rt = table2array(subDataSST(:,'StopSignalRT'));
        stop_fix = isnan(go_rt)&fix_rt>0;
        
        % Revisit this line
        stop_rt(stop_fix) = subDataSST.StopSignalDuration(stop_fix)+fix_rt(stop_fix);
        
        %% Conditions in evaluation
        trialtype = {'Go_Correct', 'Go_Incorrect', 'Go_CorrectLate', 'Go_NoResp', 'Stop_Correct', 'Stop_Incorrect'};
        goTrials = strcmp(subDataSST.ProcedureTrial,'GoTrial');
        stopTrials = strcmp(subDataSST.ProcedureTrial,'VariableStopTrial');
        
        go_correct = subDataSST.GoACC(goTrials)==1;
        go_incorrect = subDataSST.GoACC(goTrials)==0;
        go_noresp = isnan(subDataSST.GoRESP(goTrials));  %~sum(subDataSST.GoRESP(goTrials)==[1,2],2);
        go_resp = ~isnan(subDataSST.GoRESP(goTrials));
        go_nofix = isnan(subDataSST.FixRESP(goTrials));
        go_fix = ~isnan(subDataSST.FixRESP(goTrials));
        go_noresp_fix = go_noresp&go_nofix;

        go_wrong = go_incorrect&go_resp;
        go_wrong_noresp = go_incorrect&go_noresp;
        go_late = go_wrong_noresp&go_fix;
        
        % REvist this line
        go_late_correct = ~isnan(subDataSST.FixRESP(go_late))==subDataSST.GoCRESP(go_late);
        go_late_incorrect = ~isnan(subDataSST.FixRESP(go_late))~=subDataSST.GoCRESP(go_late);
        
        if any(go_late_incorrect)&&any(go_wrong)
            go_wrong_all = sum(go_late_incorrect,go_wrong,2);
        end
        
        % Go_CorrectLate
        
        
        for i = 2:length(block)
            
            if block(i) == trialBlocks(1)
            elseif block(i) == trialBlocks(2)
            end
        end
        
        
        
%%
        try
            
%{
            printVars = {Site,ID,table2array(subDataSST(2,'ExperimentName')),version,OverallMoney,...
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
%}
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
            fprintf(fidSST,[printType ','],printIt);
        end
        fprintf(fidSST,'\n');
        [h,m,s] = hms(datetime('now','Format','HH:mm:ss.SS')-t0); % Clock script runtime
        fprintf('Site: %s, ID: %s, elapsed_time: %01.0f:%02.0f:%02.2f\n',Site,ID,h,m,s);
        clear subDataMID
        
    end
end
fclose(fidSST);











