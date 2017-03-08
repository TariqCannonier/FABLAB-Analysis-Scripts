function abcd_mid_extract_TC(varargin)
%% Wrapper script to extract eprime data files
% ABCD_MID_EXTRACT Extracts MID data from participant files.
% ABCD_MID_EXTRACT(input) loops through input participant files.

dataDir = '/Users/tc587/fMRI/ABCD/EmotionalNback/ABCDData/data';
bdf = '/Users/tc587/fMRI/ABCD/Output/MID/MID_Output.txt'; % MID Output File
% 'Heitzeg/Researchers/mfield/eprime_test/ABCD/newEprimeData_20161128/mid_perf_data/data_files/abcd_mid_pefdata.txt'
%% Sort Participant Data Files
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
        x = x(arrayfun(@(x)x.name(1),x)~='.');
        ct = 1;
        
        try
            while isempty(strfind(x(ct).name,'mid-exported'))
                % Breaks if index exceeds size of subdirectories
                ct = ct+1;
            end
        catch
            if eSite(1).site == 1
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
            [h,m,s] = hms(datatime('now','Format','HH:mm:ss.SS')-t0);
            fprintf('Skipping MID... Site: %s, ID %s, elapsed_time: %01.0f:%02.0f:%02.2f\n',Site,ID,h,m,s); % Print runtime
            continue
            %break
        end

if nargin == 0 
    %addpath '/Heitzeg/Researchers/mfield/scripts/utility_scripts'
    sf = uipickfiles('out','ch');
    %open file to write to
    fbd = fopen(bdf, 'w');
    createheader = 1;
else
    sf = varargin{1};
    %open outfile for data
    if ~exist(bdf,'file') % if MID Output file does not exist
         fbd = fopen(bdf, 'w');
         createheader = 1;
    else
        fbd = fopen(bdf, 'a');
        createheader = 0;
    end
end

mdir = '/users/tc587/fMRI/ABCD/Output/MID/';
%mdir = '/Heitzeg/Researchers/mfield/eprime_test/ABCD/newEprimeData_20161128/mid_perf_data/data_mat_files/';


%fbd = '/Heitzeg/Researchers/mfield/eprime_test/ABCD/newEprimeData_20161128/mid_perf_data/data_files/abcd_mid_perfdata.txt';

%create headers
if createheader == 1
    fprintf(fbd, '%s ', 'Site Subject SubjectFileName Mismatch ExperimentName Version') 

    h_one = { 'Overall', 'run1', 'run2' };
    h_two = { 'CombinedReward', 'CombinedLoss' 'SmallReward', 'LargeReward','SmallLoss','LargeLoss','Neutral'};
    h_three = { 'HitRate', 'MissRate', 'MeanRT', 'RT_Std' };

    for ih = 1:size(h_one,2)
        for ihh = 1:size(h_two,2)
            for ihhh = 1:size(h_three,2)
                colheader = [ h_one{ih} , h_two{ihh}, h_three{ihhh} ];
                fprintf( fbd, '%s ', colheader);
            end
        end
        colheader = [ h_one{ih} , 'Money' ];
        fprintf(fbd, '%s ', colheader);
    end
    fprintf(fbd, '\n');
end
% columns of interest for performance data

strcol = { 'Block' , 'SubTrial', 'Condition', 'prbacc', 'prbrt', 'RunMoney' };


%loop through subject data. should i save data as a .mat file (mid_bdata)

for ifile = 1:size(sf,1)
    %find subjid and write it out to text file.
    sfile = deblank(sf(ifile,:));
    [ ~ , sfilename, ~ ] = fileparts(sfile);
    sname = sfilename(:,1:end-4);
    [ unidir , pguid, ~ ] = fileparts(fileparts(fileparts(fileparts(sfile))))
    [ ~, uni ] = fileparts(unidir);
    if strcmp(sname(1,1:8), 'NDAR_INV') == 0
        fullsname = [ 'NDAR_INV', sname ];
    else
        fullsname = sname;
    end
    
    if strcmp(fullsname, pguid)
        mismatch = 0;
    else
        mismatch = 1;
    end
    %disp(sf)
    %create .mat file
    smatfile = [ mdir , pguid, '.mat' ];
    
    %%open file and read it. 
    
    fid = fopen(sfile);
    
    % find indices of columns of interest
    % need to get to second line to get column headers
    
   C1 = fgetl(fid);
   count = 1;
   while strcmp(C1(1,1:14), 'ExperimentName') == 0
        C1 = fgetl(fid);
        count = count + 1;
   end
   % now convert to cell
    C2 = textscan(C1,'%s', 'Delimiter','\t');
    
    
    
    % loop through cell contents to find index of columns
    % store indices in vector cp
    
    cp = zeros(1,6);
    
    for ic = 1:size(C2{1})
        for ip = 1:size(strcol,2)
            if strcmp(C2{1}(ic), strcol(ip))
                cp(ip) = ic;
            end
            if strcmp(C2{1}(ic), 'MIDVERSION')
                vercol = ic;
            end
        end
    end
    C1 = fgetl(fid);
    C2 = textscan(C1,'%s', 'Delimiter','\t');
    
    exper = cell2mat(C2{1}(1));
    expversion = cell2mat(C2{1}(vercol));
    disp(exper);
    disp(expversion);
    %now create format string to pull out relavent data from text file
    
    
    
    
    %using text scan
    % rewind text file
    
    frewind(fid);
    
    formatSpec=[repmat('%*s ',[1,cp(1)-1]), '%d ', repmat('%*s ', [1,cp(2) - (cp(1) + 1)]), '%d ', repmat('%*s ', [1,cp(3)-(cp(2) + 1)]), '%s ', repmat('%*s ' , [1,cp(4)-(cp(3)+1)]), '%d ', repmat('%*s ' , [1,cp(5)-(cp(4)+1)]), ' %d ', repmat('%*s ' , [1,cp(6)-(cp(5)+1)]), ' %4.2f %*[^\n]'];
    
    %finally pull in data to a cell array
    C = textscan(fid,formatSpec,'HeaderLines', count, 'Delimiter','\t', 'CollectOutput', 1);
    
    
    %find index of non zeros
    
    
    index = find(C{1}(:,2)~=0);
    
    %write out new data line by line in array. C1 = run, C2 = trial num, C3
    %= trial type, C4 = prb accuracy, C5 = RT, C5 = RunMoney
    
    mid_bdata = [];
    
    for iline = 1:size(index)
        
        mid_bdata(iline, 1) = C{1}(index(iline), 1);
        mid_bdata(iline, 2) = C{1}(index(iline), 2);
        
        strial = char(C{2}(index(iline)));
        switch strial
            case 'SmallReward'
                ttype = 1;
            case 'LgReward'
                ttype = 2;
            case 'SmallPun'
                ttype = 3;
            case 'LgPun'
                ttype = 4;
            case 'Triangle'
                ttype = 5;
        end
        
        mid_bdata(iline, 3) = ttype;
        mid_bdata(iline, 4) = C{3}(index(iline), 1);
        mid_bdata(iline, 5) = C{3}(index(iline), 2);
        mid_mondata(iline,1) = C{4}(index(iline));
        
    end
    %write out behavioral data
    fprintf(fbd, '%s %s %s %d %s %s ', uni, pguid, sname, mismatch, exper, expversion);
    nCond = mid_bdata(:, 3);
    instruct = {find(nCond==1 | nCond==2), find(nCond==3 | nCond == 4), find(nCond==1), find(nCond ==2), find(nCond==3), find(nCond == 4), find(nCond ==5)};
    
    for j = 1:7
        ind = instruct{j};
        nTrials = length(ind);
        nACC = mid_bdata(ind,4);
        ACCHitRate = sum(nACC)/nTrials;
        ACCMissRate = sum(~nACC)/nTrials;
        nRT = mid_bdata(ind,5);
        nRTavg = mean(nRT(find(nACC))); %
        nRTstd = std(nRT(find(nACC)));
        fprintf(fbd, '%4.3f %4.3f %4.3f %4.3f ', ACCHitRate, ACCMissRate, nRTavg, nRTstd);
    end
    
    money = sum(mid_mondata);
    fprintf(fbd, '%4.2f ', money );
    
    for ir = 1:2
        run_mat = mid_bdata(find(mid_bdata(:,1)==ir),:);
        nt = size(run_mat,1);
        if nt > 0
            money = sum(mid_mondata((ir-1)*nt+1:ir*nt));
        end
        
        
        nCond = run_mat(:, 3);
        instruct = {find(nCond==1 | nCond==2), find(nCond==3 | nCond == 4), find(nCond==1), find(nCond ==2), find(nCond==3), find(nCond == 4), find(nCond ==5)};
        for j = 1:7
            ind = instruct{j};
            nTrials = length(ind);
            nACC = run_mat(ind,4);
            ACCHitRate = sum(nACC)/nTrials;
            ACCMissRate = sum(~nACC)/nTrials;
            nRT = run_mat(ind,5);
            nRTavg = mean(nRT(find(nACC)));
            nRTstd = std(nRT(find(nACC)));%
            fprintf(fbd, '%4.3f %4.3f %4.3f %4.3f ', ACCHitRate, ACCMissRate, nRTavg, nRTstd);
        end
        fprintf(fbd, '%4.2f ', money );
    end
    fprintf(fbd, '\n');
    save(smatfile, 'pguid', 'sname', 'expversion','exper','mid_bdata', 'C', 'money', 'mid_mondata')
    fclose(fid)

end 
fclose(fbd);
