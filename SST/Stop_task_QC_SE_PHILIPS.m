%Stop task QC - Bader Chaarani, Hugh Garavan & the IMAGEN consortium - 2016

%function [values deltas] = Stop_task_QC(dataDirectory,format)
function [values deltas] = Stop_task_QC()

%if (strcmp(format,'ge'))
 %    disp(sprintf('GE it is'));
%end
dataDirectory=uigetdir('.','Select folder containing .csv files');
cd (dataDirectory);

listing = dir('*.csv');
myfiles={listing(:).name};
d = dir(dataDirectory);
disp(length(d));
failed=0;

%For each subject in the group
for f=1:length(myfiles)
    
    t1 = textread(myfiles{f}, '%s', 'delimiter', '\n','whitespace','');
    
%     Trial_Category = t1(:,2);
    try
%         filename = [dataDirectory filesep d(f).name];% Read in the csv file
%        [num, text] = csvread(filename);
%        text([1,2],:) = [];
%       Trial = num(:,1);
%       Trial_Category = text(:,2);
      
        Go_Success_Reaction_Time=zeros(460,1);
        Go_Fail_Reaction_Time=zeros(460,1);
        Stop_Fail_Reaction_Time= zeros(460,1);
        Go_Success_Reaction_Time1=zeros(460,1);
        Go_Fail_Reaction_Time1=zeros(460,1);
        Stop_Fail_Reaction_Time1= zeros(460,1);
        Early_Stop_Reaction_Time=zeros(460,1);
        Go_RT_total=zeros(460,1);
         Go_Success_Rate=0;
         Go_Fail_Rate=0;
%          Go_Miss_Rate=0;
         Stop_Sucess_Rate=0;
         Early_Stops=0;
         Go_trials=0;
         Stop_trials=0;
        SSD=zeros(460,1);
        %All runs
        %for i = 3: (length(t1)-1);
        %1st run
        %for i = 3: 182;
        %2nd run
        %for i = 183: (length(t1)-1);
        headers = regexp(char(t1(2,:)),',','split');
        trialTypeIndex = strcmp(headers,'Procedure[Trial]');
        outcomeIndex = strcmp(headers,'TrialCode');
        for i = 3: (length(t1)-1)
            a=regexp(char(t1(i,1)),',','split');         
            %GO=a(80);  %trial type
            GO = a(trialTypeIndex); %trial type
            
            %outcome=a(121);  %trial type
            outcome = a(outcomeIndex);
            
            %outcome=outcome{1}{2};
            if (strcmp(GO,'GoTrial'))
                Go_trials=Go_trials+1;
                if (strcmp(outcome,'CorrectGo'))
                    Go_Success_Reaction_Time(i-2)=str2double(a(76));
                    Go_Success_Reaction_Time1(i-2)=str2double(a(76));
                    Go_Success_Rate=Go_Success_Rate+1;
                end;
                if (strcmp(outcome,'IncorrectGo'))
                    Go_Fail_Reaction_Time(i-2)=str2double(a(76));
                    Go_Fail_Reaction_Time1(i-2)=str2double(a(76));
                    Go_Fail_Rate=Go_Fail_Rate+1;
                end;
                
            elseif (strcmp(GO,'VariableStopTrial'))
                     Stop_trials=Stop_trials+1;
                 if (strcmp(outcome,'IncorrectStop'))
                    Stop_Fail_Reaction_Time(i-2)= str2double(a(112));
                    Stop_Fail_Reaction_Time1(i-2)= str2double(a(112));
                end;
                if (strcmp(outcome,'StopTooEarly'))
                    Early_Stop_Reaction_Time(i-2)=str2double(a(112));
                    Early_Stops= Early_Stops+1;
                end;
                if (strcmp(outcome,'CorrectStop'))
                     Stop_Sucess_Rate= Stop_Sucess_Rate+1;
                end;
                if (strcmp(outcome, 'CorrectStop') || strcmp(outcome, 'IncorrectStop')) 
                    SSD(i-2)= str2double(a(97));
                end
            end
            if (strcmp(outcome, 'CorrectGo')) %|| strcmp(outcome, 'StopTooEarly')
                    Go_RT_total(i-2)=str2double(a(76));
            end    
            
       end;     
       %convert to seconds
        Go_Success_Reaction_Times(f,:)= Go_Success_Reaction_Time/1000;
        Go_Fail_Reaction_Times(f,:)= Go_Fail_Reaction_Time/1000;
        Stop_Fail_Reaction_Times(f,:)= Stop_Fail_Reaction_Time/1000;
        Go_Success_Reaction_Times1(f,:)= Go_Success_Reaction_Time1/1000;
        Go_Fail_Reaction_Times1(f,:)= Go_Fail_Reaction_Time1/1000;
        Stop_Fail_Reaction_Times1(f,:)= Stop_Fail_Reaction_Time1/1000;
        Early_Stop_Reaction_Times(f,:)= Early_Stop_Reaction_Time/1000;
       % Go_RT_totals(f,:)= Go_RT_total/1000;    
        %SSDs(f,:)= SSD/1000;
        
        Go_Success_Rate=(Go_Success_Rate/Go_trials)*100;
        Go_Fail_Rate=(Go_Fail_Rate/Go_trials)*100;
        Stop_Sucess_Rate=(Stop_Sucess_Rate/Stop_trials)*100;
       
      
        Go_Success_Rates(f)=Go_Success_Rate;
        Go_Fail_Rates(f)=Go_Fail_Rate;
        Stop_Sucess_Rates(f)=Stop_Sucess_Rate; 
        Early_Stopss(f)= Early_Stops;
        subjects{f}=myfiles{f};
        
        %remove zeros and calculate stuff like SSRT
        
        Go_RT_total(Go_RT_total==0) = [];
        SSD(SSD==0) = [];
        Stop_Signal_Reaction_Time = median(Go_RT_total)- mean(SSD);
        Stop_Signal_Reaction_Times(f)= Stop_Signal_Reaction_Time;
        
        Go_Success_Reaction_Time1(Go_Success_Reaction_Time1==0) = [];
        Go_Fail_Reaction_Time1(Go_Fail_Reaction_Time1==0) = [];
        Stop_Fail_Reaction_Time1(Stop_Fail_Reaction_Time1==0) = [];
        
        Avg_GoSuccess=mean(Go_Success_Reaction_Time1);
        Avg_GoSuccesses(f)= Avg_GoSuccess;
        Avg_GoFail=mean(Go_Fail_Reaction_Time1);
        Avg_GoFails(f)= Avg_GoFail;
        Avg_StopFail=mean(Stop_Fail_Reaction_Time1);
        Avg_StopFails(f)= Avg_StopFail;
        
        disp(sprintf('processed %d of %d %s', f, length(myfiles),myfiles{f}));
    %        Stop_Signal_Reaction_Time(i-2)= mean(Go_RT_total(i-2)) - SSD(i-2);
     catch err
        disp(sprintf('Could not process: %s',myfiles{f}));
        failed=failed+1;
        disp(err.message);
        subjects{f}=myfiles{f};
    end; 
end;
%save the results
allsubjects.subjects=subjects;
allsubjects.Go_Success_Reaction_Time = Go_Success_Reaction_Times;
allsubjects.Go_Fail_Reaction_Time = Go_Fail_Reaction_Times;
allsubjects.Stop_Fail_Reaction_Time= Stop_Fail_Reaction_Times;
allsubjects.Early_Stop_Reaction_Time= Early_Stop_Reaction_Times;
allsubjects.Stop_Signal_Reaction_Time = Stop_Signal_Reaction_Times;
allsubjects.Go_Success_Rate= Go_Success_Rates;
allsubjects.Go_Fail_Rate= Go_Fail_Rates;
allsubjects.Stop_Sucess_Rate= Stop_Sucess_Rates;
allsubjects.Early_Stops = Early_Stopss;
allsubjects.Avg_GoSuccess=Avg_GoSuccesses;
allsubjects.Avg_GoFail=Avg_GoFails;
allsubjects.Avg_StopFail=Avg_StopFails;

%save(['allsubjects\',group,'_rl_',myalgorithm,'results.mat'],'allsubjects');
save(['SST_behavioral_' 'results.mat'],'allsubjects');


fprintf('%d of %d failed', failed, length(myfiles));

%Create summary table and export to excel spreadsheet
load('SST_behavioral_results.mat')
Headers = {'Subjects';'SSRT';'GO_success_rate';'GO_fail_rate';'Stop_success_rate';'GO_success_RT';'GO_fail_RT';'Stop_fail_RT';'Early_stops'};
T = table(transpose(allsubjects.subjects),transpose(allsubjects.Stop_Signal_Reaction_Time),transpose(allsubjects.Go_Success_Rate),transpose(allsubjects.Go_Fail_Rate),transpose(allsubjects.Stop_Sucess_Rate),transpose(allsubjects.Avg_GoSuccess),transpose(allsubjects.Avg_GoFail),transpose(allsubjects.Avg_StopFail),transpose(allsubjects.Early_Stops),'VariableNames',Headers);
filename = 'QCsummary.xlsx';
writetable(T,filename,'Sheet',1)
%print table 
%T(:,:);

