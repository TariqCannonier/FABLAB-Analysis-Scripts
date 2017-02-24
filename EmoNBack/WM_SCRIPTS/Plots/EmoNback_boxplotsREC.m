%% EmoNback REC SubAnalysis
%try
%    csvfile = ['Output/NBack/EmoNback_WMBehaviorABCD_',datestr(now,'yyyymmdd'),'.csv'];
%    [ExperimentName,Site,NDARGUID,Version,Overall_RT,Overall_ACC,HappyBlocks_RT,HappyBlocks_ACC,FearBlocks_RT,FearBlocks_ACC,NeutBlocks_RT,NeutBlocks_ACC,PlaceBlocks_RT,PlaceBlocks_ACC,Overall0back_RT,Overall0back_ACC,Happy0back_RT,Happy0back_ACC,Fear0back_RT,Fear0back_ACC,Neut0back_RT,Neut0back_ACC,Place0back_RT,Place0back_ACC,Overall2back_RT,Overall2back_ACC,Happy2back_RT,Happy2back_ACC,Fear2back_RT,Fear2back_ACC,Neut2back_RT,Neut2back_ACC,Place2back_RT,Place2back_ACC,run1Overall_RT,run1Overall_ACC,run1HappyBlocks_RT,run1HappyBlocks_ACC,run1FearBlocks_RT,run1FearBlocks_ACC,run1NeutBlocks_RT,run1NeutBlocks_ACC,run1PlaceBlocks_RT,run1PlaceBlocks_ACC,run1Happy0back_RT,run1Happy0back_ACC,run1Fear0back_RT,run1Fear0back_ACC,run1Neut0back_RT,run1Neut0back_ACC,run1Place0back_RT,run1Place0back_ACC,run1Happy2back_RT,run1Happy2back_ACC,run1Fear2back_RT,run1Fear2back_ACC,run1Neut2back_RT,run1Neut2back_ACC,run1Place2back_RT,run1Place2back_ACC,run2Overall_RT,run2Overall_ACC,run2HappyBlocks_RT,run2HappyBlocks_ACC,run2FearBlocks_RT,run2FearBlocks_ACC,run2NeutBlocks_RT,run2NeutBlocks_ACC,run2PlaceBlocks_RT,run2PlaceBlocks_ACC,run2Happy0back_RT,run2Happy0back_ACC,run2Fear0back_RT,run2Fear0back_ACC,run2Neut0back_RT,run2Neut0back_ACC,run2Place0back_RT,run2Place0back_ACC,run2Happy2back_RT,run2Happy2back_ACC,run2Fear2back_RT,run2Fear2back_ACC,run2Neut2back_RT,run2Neut2back_ACC,run2Place2back_RT,run2Place2back_ACC,Nonlure_ACC,Lure_ACC,Target_ACC] = importAnalysis(csvfile);%importAnalysis('EmoNback_WMBehaviorABCD_20161203.csv');
%catch
    %csvfile = dir('Output/NBack/EmoNback_WMBehaviorABCD*.csv');
    file = dir('Output/NBack/20*');
    csvfileWM = dir(fullfile(file(end).folder,file(end).name,'EmoNback_WMBehaviorABCD*.csv'));
    csvfileREC = dir(fullfile(file(end).folder,file(end).name,'EmoNback_RECBehaviorABCD*.csv'));
    %csvfile = dir(fullfile('/Users/tc587/fMRI/ABCD/ABCD Analysis Package/Output/NBack/',datestr(now,'yyyymmdd'),'EmoNback_RECBehaviorABCD*.csv'));
    [ExperimentName,Site_WM,NDARGUID_WM,Version,Overall_RT,Overall_ACC,HappyBlocks_RT,HappyBlocks_ACC,FearBlocks_RT,FearBlocks_ACC,NeutBlocks_RT,NeutBlocks_ACC,PlaceBlocks_RT,PlaceBlocks_ACC,Overall0back_RT,Overall0back_ACC,Happy0back_RT,Happy0back_ACC,Fear0back_RT,Fear0back_ACC,Neut0back_RT,Neut0back_ACC,Place0back_RT,Place0back_ACC,Overall2back_RT,Overall2back_ACC,Happy2back_RT,Happy2back_ACC,Fear2back_RT,Fear2back_ACC,Neut2back_RT,Neut2back_ACC,Place2back_RT,Place2back_ACC,run1Overall_RT,run1Overall_ACC,run1HappyBlocks_RT,run1HappyBlocks_ACC,run1FearBlocks_RT,run1FearBlocks_ACC,run1NeutBlocks_RT,run1NeutBlocks_ACC,run1PlaceBlocks_RT,run1PlaceBlocks_ACC,run1Happy0back_RT,run1Happy0back_ACC,run1Fear0back_RT,run1Fear0back_ACC,run1Neut0back_RT,run1Neut0back_ACC,run1Place0back_RT,run1Place0back_ACC,run1Happy2back_RT,run1Happy2back_ACC,run1Fear2back_RT,run1Fear2back_ACC,run1Neut2back_RT,run1Neut2back_ACC,run1Place2back_RT,run1Place2back_ACC,run2Overall_RT,run2Overall_ACC,run2HappyBlocks_RT,run2HappyBlocks_ACC,run2FearBlocks_RT,run2FearBlocks_ACC,run2NeutBlocks_RT,run2NeutBlocks_ACC,run2PlaceBlocks_RT,run2PlaceBlocks_ACC,run2Happy0back_RT,run2Happy0back_ACC,run2Fear0back_RT,run2Fear0back_ACC,run2Neut0back_RT,run2Neut0back_ACC,run2Place0back_RT,run2Place0back_ACC,run2Happy2back_RT,run2Happy2back_ACC,run2Fear2back_RT,run2Fear2back_ACC,run2Neut2back_RT,run2Neut2back_ACC,run2Place2back_RT,run2Place2back_ACC,Nonlure_ACC,Lure_ACC,Target_ACC,HappyTargetHR,HappyLureFA,HappyNonlureFA,FearTargetHR,FearLureFA,FearNonlureFA,NeutTargetHR,NeutLureFA,NeutNonlureFA,PlaceTargetHR,PlaceLureFA,PlaceNonlureFA] = importWM(fullfile(csvfileWM(end).folder,csvfileWM(end).name));
    [ExperimentName,Site_REC,NDARGUID_REC,Version,SessionDate,Happy_HR,Happy_FA,Happy_Pr,Happy_Br,Happy_Miss,Happy_CR,Happy_dprime,Fear_HR,Fear_FA,Fear_Pr,Fear_Br,Fear_Miss,Fear_CR,Fear_dprime,Neut_HR,Neut_FA,Neut_Pr,Neut_Br,Neut_Miss,Neut_CR,Neut_dprime,Place_HR,Place_FA,Place_Pr,Place_Br,Place_Miss,Place_CR,Place_dprime,Happy0back_HR,Fear0back_HR,Neut0back_HR,Place0back_HR,Happy2back_HR,Fear2back_HR,Neut2back_HR,Place2back_HR,Happy_TargetHR,Happy_LureHR,Happy_NonlureHR,Fear_TargetHR,Fear_LureHR,Fear_NonlureHR,Neut_TargetHR,Neut_LureHR,Neut_NonlureHR,Place_TargetHR,Place_LureHR,Place_NonlureHR,ThreeExposure0backTargetStim,TwoExposure2backTargetStim,TwoExposure0backLureStim,TwoExposure2backLureStim,OneExposure0backStim,OneExposure2backStim] = importREC(fullfile(csvfileREC(end).folder,csvfileREC(end).name));
%end
close all

%saveDir = fullfile(pwd,'Plots/Boxplots',datestr(now,'yyyymmdd')); % Save data to designated directory
saveDir = fullfile(file(end).folder,file(end).name); % Save data to designated directory
if ~exist(saveDir,'dir')
    mkdir(saveDir)
end

% Create a grayscale and index into the row with desired shade of gray.
gray_matrix = gray;
gray_index = 35; % Lower is darker, Higher is lighter
%% REC: Plot Happy, Fear, Neutral, Place Overall d'
Overall = [Happy_dprime, Fear_dprime, Neut_dprime, Place_dprime];
plotLabels = {'Happy','Fear','Neut','Place'};

fig(1) = figure(1);
set(fig(1),'Position',[1 100 1600 1600]);

hold on
bp1 = boxplot(Overall,'Labels',plotLabels(1:4));
ylim([-6 6]) % Hard coded for dprime being ~+/-5
%ylim([min(min(Overall))-1 max(max(Overall))+1])

% Pretty-fy Boxplot title, lines, axis numbers
set(bp1,'LineWidth',2)
set(bp1(7,:),'Visible','off')
set(gca,'FontSize',16)
title(sprintf('EmoRecMem Overall Accuracy\nN = %1.0f',length(Overall)),'Fontsize',30)
xlabel('EventType','Fontsize',24)
ylabel('D-prime','Fontsize',24)

% Plot individual data points within boxplots
plot(1,Overall(:,1)','x','Color',gray_matrix(gray_index,:),'LineWidth',2)%[.01, .01, .01]*65,'LineWidth',2)
plot(2,Overall(:,2)','x','Color',gray_matrix(gray_index,:),'LineWidth',2)%[.01, .01, .01]*65,'LineWidth',2)
plot(3,Overall(:,3)','x','Color',gray_matrix(gray_index,:),'LineWidth',2)%[.01, .01, .01]*65,'LineWidth',2)
plot(4,Overall(:,4)','x','Color',gray_matrix(gray_index,:),'LineWidth',2)%[.01, .01, .01]*65,'LineWidth',2)
saveas(fig(1),fullfile(saveDir,'Boxplots/REC',sprintf('EmoNbackREC_Overall_Accuracy')),'jpeg')
hold off

%% REC Boxplots by Sites
ct = 2;
%{
difSites = unique(Site); %Determine unique site names
for i = 1:length(difSites)
    ind = find(ismember(Site,difSites(i))); % Find index for each site
    if length(ind)>3
        fig(ct) = figure(ct); %#ok<SAGROW>
        set(fig(ct),'Position',[1 100 1600 1600]);
        hold on
        bp2 = boxplot(Overall(ind,:),'Labels',plotLabels(1:4));
        ylim([-6 6])
        %ylim([min(min(Overall(ind,:)))-1 max(max(Overall(ind,:)))+1])
        set(bp2,'LineWidth',2)
        set(bp2(7,:),'Visible','off')
        set(gca,'FontSize',16)
        title(sprintf('EmoRecMem Overall Accuracy: %s\n n = %1.0f',difSites{i},length(ind)),'Fontsize',30)
        xlabel('EventType','Fontsize',24)
        ylabel('D-prime','Fontsize',24)
        
        plot(1,Overall(ind,1)','x','Color',gray_matrix(gray_index,:),'LineWidth',2)%[.01, .01, .01],'LineWidth',2)
        plot(2,Overall(ind,2)','x','Color',gray_matrix(gray_index,:),'LineWidth',2)%[.01, .01, .01],'LineWidth',2)
        plot(3,Overall(ind,3)','x','Color',gray_matrix(gray_index,:),'LineWidth',2)%[.01, .01, .01],'LineWidth',2)
        plot(4,Overall(ind,4)','x','Color',gray_matrix(gray_index,:),'LineWidth',2)%[.01, .01, .01],'LineWidth',2)
        hold off
        saveas(fig(ct),fullfile(saveDir,'Boxplots/REC',sprintf('EmoNbackREC_%s',difSites{i})),'jpeg')%difSites{i})))
        ct = ct+1;
    end
end

%% Barplots of HitRates
meanDPrime = mean([Happy_dprime, Fear_dprime, Neut_dprime, Place_dprime]);
stdDPrime = std([Happy_dprime, Fear_dprime, Neut_dprime, Place_dprime]);

colormap(gray)
fig(ct) = figure(ct);
set(fig(ct),'Position',[1 100 1600 1600]);
hold on
%ylim([0, max(max(meanDPrime, stdDPrime))+.5])
set(gca,'Fontsize',16,'XTickLabel',plotLabels,'XTick',1:4)
title('RecMem: Average D-prime by StimType','Fontsize',30)
xlabel('StimType','Fontsize',24)
ylabel('D-prime','Fontsize',24)
bar(meanDPrime,'black')
errorbar(meanDPrime,stdDPrime,'.','LineWidth',2,'color',gray_matrix(gray_index,:))
hold off

ct = ct+1;
%}
%% Plot Target, Lure, Nonlure HitRates
cutData = [];
Happy_TargetHR(isnan(Happy_TargetHR)) = [];
Happy_LureHR(isnan(Happy_LureHR)) = [];
Happy_NonlureHR(isnan(Happy_NonlureHR)) = [];
%{
cutData = [cutData; find(isnan(Happy_TargetHR))];
cutData = [cutData; find(isnan(Happy_LureHR))];
cutData = [cutData; find(isnan(Happy_NonlureHR))];
cutData = [cutData; find(isnan(Fear_TargetHR))];
cutData = [cutData; find(isnan(Fear_LureHR))];
cutData = [cutData; find(isnan(Fear_NonlureHR))];
cutData = [cutData; find(isnan(Neut_TargetHR))];
cutData = [cutData; find(isnan(Neut_LureHR))];
cutData = [cutData; find(isnan(Neut_NonlureHR))];
cutData = [cutData; find(isnan(Place_TargetHR))];
cutData = [cutData; find(isnan(Place_LureHR))];
cutData = [cutData; find(isnan(Place_NonlureHR))];
%}
Fear_TargetHR(isnan(Fear_TargetHR)) = [];
Fear_LureHR(isnan(Fear_LureHR)) = [];
Fear_NonlureHR(isnan(Fear_NonlureHR)) = [];

Neut_TargetHR(isnan(Neut_TargetHR)) = [];
Neut_LureHR(isnan(Neut_LureHR)) = [];
Neut_NonlureHR(isnan(Neut_NonlureHR)) = [];

Place_TargetHR(isnan(Place_TargetHR)) = [];
Place_LureHR(isnan(Place_LureHR)) = [];
Place_NonlureHR(isnan(Place_NonlureHR)) = [];

mean_HappyTarget = mean(Happy_TargetHR);
mean_HappyLure = mean(Happy_LureHR);
mean_HappyNonlure = mean(Happy_NonlureHR);
mean_FearTarget = mean(Fear_TargetHR);
mean_FearLure = mean(Fear_LureHR);
mean_FearNonlure = mean(Fear_NonlureHR);
mean_NeutTarget = mean(Neut_TargetHR);
mean_NeutLure = mean(Neut_LureHR);
mean_NeutNonlure = mean(Neut_NonlureHR);
mean_PlaceTarget = mean(Place_TargetHR);
mean_PlaceLure = mean(Place_LureHR);
mean_PlaceNonlure = mean(Place_NonlureHR);

mean_Target = mean([Happy_TargetHR,Fear_TargetHR,Neut_TargetHR,Place_TargetHR],2);
mean_NonTarget = mean([Happy_LureHR,Happy_NonlureHR,Fear_LureHR,...
    Fear_NonlureHR,Neut_LureHR,Neut_NonlureHR,Place_LureHR,Place_NonlureHR],2);

fig(ct) = figure(ct);
hold on
set(fig(ct),'Position',[1 100 1600 1600]);
set(gca,'Fontsize',24,'XTicklabel',plotLabels,'XTick',1:4)
title('RecMem: Average HitRate by StimType','Fontsize',36)
xlabel('StimType','Fontsize',30)
ylabel('HitRate','Fontsize',30);
bar_handle = bar([mean_HappyTarget,mean_HappyLure, mean_HappyNonlure;...Hap
    mean_FearTarget,mean_FearLure,mean_FearNonlure;...
    mean_NeutTarget,mean_NeutLure,mean_NeutNonlure;...
    mean_PlaceTarget,mean_PlaceLure,mean_PlaceNonlure],'grouped');
legh = legend('Target','Lure','Nonlure');
set(legh,'Position',[0.8 0.8 0.1 0.075],'Linewidth',1.5)
set(bar_handle(3),'FaceColor',gray_matrix(end,:))
set(bar_handle(2),'FaceColor',gray_matrix(floor(length(gray_matrix)*2/3),:))
set(bar_handle(1),'FaceColor',gray_matrix(floor(length(gray_matrix)/3),:))
hold off

ct = ct+1;

%% Correlation
%{
ann_dim = [.15, .775, .1, .1; .15, .3, .1, .1];
% Correlate Targets RecMem & N-Back [Place]
t = 'Target: 0-Back & RecMem [Place]';
scatter3(ct,Place0back_HR,Place_TargetHR,gray_matrix(20,:),gray_matrix(gray_index,:),t,1)
t = 'Target: 2-Back & RecMem [Place]';
scatter3(ct,Place2back_HR,Place_TargetHR,gray_matrix(20,:),gray_matrix(gray_index,:),t,2)
ct = ct+1;

% Correlate Targets RecMem & N-Back [Happy]
t = 'Target: 0-Back & RecMem [Happy]';
scatter3(ct,Happy0back_HR,Happy_TargetHR,gray_matrix(20,:),gray_matrix(gray_index,:),t,1)
t = 'Target: 2-Back & RecMem [Happy]';
scatter3(ct,Happy2back_HR,Happy_TargetHR,gray_matrix(20,:),gray_matrix(gray_index,:),t,2)
ct = ct+1;

% Correlate Targets RecMem & N-Back [Fear]
t = 'Target: 0-Back & RecMem [Fear]';
scatter3(ct,Fear0back_HR,Fear_TargetHR,gray_matrix(20,:),gray_matrix(gray_index,:),t,1)
t = 'Target: 2-Back & RecMem [Fear]';
scatter3(ct,Fear2back_HR,Fear_TargetHR,gray_matrix(20,:),gray_matrix(gray_index,:),t,2)
ct = ct+1;

% Correlate Targets RecMem & N-Back [Neut]
t = sprintf('Target: 0-Back & RecMem [Neut]');
scatter3(ct,Neut0back_HR,Neut_TargetHR,gray_matrix(20,:),gray_matrix(gray_index,:),t,1)
t = sprintf('Target: 2-Back & RecMem [Neut]');
scatter3(ct,Neut2back_HR,Neut_TargetHR,gray_matrix(20,:),gray_matrix(gray_index,:),t,2)
ct = ct+1;
%}
close all

%% Edits For BJ
% Variable Declaration
% NBack HR
Nback0_HR = mean([Happy0back_HR,Fear0back_HR,Neut0back_HR,Place0back_HR],2);
Nback2_HR = mean([Happy2back_HR,Fear2back_HR,Neut2back_HR,Place2back_HR],2);
NbackX_HR = mean([Happy0back_HR,Fear0back_HR,Neut0back_HR,Place0back_HR,...
    Happy2back_HR,Fear2back_HR,Neut2back_HR,Place2back_HR],2);

% NBack Miss
Nback0_Miss = mean(1-[Happy0back_HR,Fear0back_HR,Neut0back_HR,Place0back_HR],2);
Nback2_Miss = mean(1-[Happy2back_HR,Fear2back_HR,Neut2back_HR,Place2back_HR],2);
NbackX_Miss = mean(1-[Happy0back_HR,Fear0back_HR,Neut0back_HR,Place0back_HR,...
    Happy2back_HR,Fear2back_HR,Neut2back_HR,Place2back_HR],2);

% NBack Targets, Nontargets, Lure, and Nonlure
TargetHR = mean([Happy_TargetHR,Fear_TargetHR,Neut_TargetHR,Place_TargetHR],2);
NonTarget = mean([Happy_LureHR,Fear_LureHR,Neut_LureHR,Place_LureHR,...
    Happy_NonlureHR,Fear_NonlureHR,Neut_NonlureHR,Place_NonlureHR],2);
Lure = mean([Happy_LureHR,Fear_LureHR,Neut_LureHR,Place_LureHR],2);
Nonlure = mean([Happy_NonlureHR,Fear_NonlureHR,Neut_NonlureHR,Place_NonlureHR],2);
AllHR = mean([TargetHR,Lure,Nonlure],2);

% RecMem HR, FA
RecMemHR = mean([Happy_HR, Fear_HR, Neut_HR, Place_HR],2);
RecMemFA = mean([Happy_FA, Fear_FA, Neut_FA, Place_FA],2);

% WM
HappyWM_HR = mean([HappyTargetHR,HappyNonlureFA,HappyLureFA],2);
FearWM_HR = mean([FearTargetHR,FearNonlureFA,FearLureFA],2);
NeutWM_HR = mean([NeutTargetHR,NeutNonlureFA,NeutLureFA],2);
PlaceWM_HR = mean([PlaceTargetHR,PlaceNonlureFA,PlaceLureFA],2);
TargetWM_HR = mean([HappyTargetHR,FearTargetHR,NeutTargetHR,PlaceTargetHR],2);
NonlureWM_FA = mean([HappyNonlureFA,FearNonlureFA,NeutNonlureFA,PlaceNonlureFA],2);
LureWM_FA = mean([HappyLureFA,FearLureFA,NeutLureFA,PlaceLureFA],2);
NontargetWM_FA = mean([HappyNonlureFA,FearNonlureFA,NeutNonlureFA,PlaceNonlureFA,...
    HappyLureFA,FearLureFA,NeutLureFA,PlaceLureFA],2);
ct = 1;
%% Correlations for BJ
element = ismember(NDARGUID_WM,NDARGUID_REC); % What elements of A are in B
Overall_ACC = Overall_ACC(element); % index only the AnB
Target_ACC = Target_ACC(element);
Lure_ACC = Lure_ACC(element);
Nonlure_ACC = Nonlure_ACC(element);
TargetWM_HR = TargetWM_HR(element);
LureWM_FA = LureWM_FA(element);
NonlureWM_FA = NonlureWM_FA(element);
NontargetWM_FA = NontargetWM_FA(element);



Overall_prime = mean(Overall,2);
Overall_prime = Overall_prime(~isnan(Overall_prime));

t = sprintf('Overall: WM_Accuracy & REC_D''');
scatter2(ct,Overall_ACC,Overall_prime,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('Overall: WM_Accuracy & REC_HR');
scatter2(ct,Overall_ACC,RecMemHR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('Target: WM_Accuracy & REC_HR');
scatter2(ct,Target_ACC,RecMemHR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('Lure: WM_Accuracy & REC_HR');
scatter2(ct,Lure_ACC,RecMemHR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('Nonlure: WM_Accuracy & REC_HR');
scatter2(ct,Nonlure_ACC,RecMemHR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('Target: WM_Accuracy & REC_HR');
scatter2(ct,TargetWM_HR,RecMemHR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('Lure: WM_Accuracy & REC_HR');
scatter2(ct,LureWM_FA,RecMemHR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('Nonlure: WM_Accuracy & REC_HR');
scatter2(ct,NonlureWM_FA,RecMemHR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

%{
t = sprintf('Accuracy [WM] & D''[RecMem]');
scatter2(ct,Overall_ACC,Overall_prime,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('Target: HR[WM] & HR[RecMem]');
scatter2(ct,TargetWM_HR,TargetHR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('Lure: FA[WM] & HR[RecMem]');
scatter2(ct,LureWM_FA,Lure,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('Nonlure: FA[WM] & HR[RecMem]');
scatter2(ct,NonlureWM_FA,Nonlure,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('NonTarget: FA[WM] & HR[RecMem]');
scatter2(ct,NontargetWM_FA,NonTarget,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;
%}


%% Histograms of Response Distributions
%ct = 6;
figure(ct);
font = 20;
%suptitle('Distributions [WM]');
subplot(4,1,1)
histogram(TargetWM_HR)
xlabel('Targets','Fontsize',font)

subplot(4,1,2)
histogram(LureWM_FA)
xlabel('Lures','Fontsize',font)

subplot(4,1,3)
histogram(NonlureWM_FA)
xlabel('Nonlures','Fontsize',font)

subplot(4,1,4)
histogram(NontargetWM_FA)
xlabel('NonTargets','Fontsize',font)
ct = ct+1;

figure(ct);
%suptitle('Distributions [REC]');
subplot(4,1,1)
histogram(TargetHR)
xlabel('Targets','Fontsize',font)

subplot(4,1,2)
histogram(Lure)
xlabel('Lures','Fontsize',font)

subplot(4,1,3)
histogram(Nonlure)
xlabel('Nonlures','Fontsize',font)

subplot(4,1,4)
histogram(NonTarget)
xlabel('NonTargets','Fontsize',font)
%{
%t = sprintf('Overall_TLN: Hit[N-Back] & Hit[RecMem] [All]'); %HR Nback v HR RecMem across All emoValence
%scatter2(ct,NbackX_HR,RecMemHR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
%ct = ct+1;

ind_WM = find(ismember(NDARGUID_WM,NDARGUID_REC));
ind_REC = find(ismember(NDARGUID_WM(ind_WM),NDARGUID_REC));
ct = 1;

t = sprintf('%1.0f Happy[N-Back] & Happy[RecMem]',ct);
scatter2(ct,HappyWM_HR(ind_REC),Happy_HR(ind_REC),gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f Fear[N-Back] & Fear[RecMem]',ct);
scatter2(ct,FearWM_HR(ind_REC),Fear_HR(ind_REC),gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f Neut[N-Back] & Neut[RecMem]',ct);
scatter2(ct,NeutWM_HR(ind_REC),Neut_HR(ind_REC),gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f Place[N-Back] & Place[RecMem]',ct);
scatter2(ct,PlaceWM_HR(ind_REC),Place_HR(ind_REC),gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f Target(32)[N-Back] & Target[RecMem] [All]',ct);
scatter2(ct, TargetWM_HR(ind_REC),TargetHR(ind_REC),gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f Lure(40)[N-Back] & Lure[RecMem] [All]',ct);
scatter2(ct, LureWM_HR(ind_REC),Lure(ind_REC),gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f Nonlure(88)[N-Back] & Nonlure[RecMem] [All]',ct);
scatter2(ct,NonlureWM_HR(ind_REC),Nonlure(ind_REC),gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;
close all

%%
t = sprintf('%1.0f 0-Back & RecMemHR [All]',ct);
scatter2(ct,Nback0_HR,RecMemHR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f 0-Back & RecMemFA [All]',ct);
scatter2(ct,Nback0_HR,RecMemFA,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f 2-Back & RecMemHR [All]',ct);
scatter2(ct,Nback2_HR,RecMemHR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f 2-Back & RecMemFA [All]',ct);
scatter2(ct,Nback2_HR,RecMemFA,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f X-Back & RecMemHR [All]',ct);
scatter2(ct,NbackX_HR,RecMemHR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f X-Back & RecMemFA [All]',ct);
scatter2(ct,NbackX_HR,RecMemFA,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;
close all
%%
t = sprintf('%1.0f Hit[0back_REC] & Target[RecMem]',ct);
scatter2(ct,Nback0_HR,TargetHR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f Hit[2back_REC] & Target[RecMem]',ct);
scatter2(ct,Nback2_HR,TargetHR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f Hit[Xback_REC] & Target[RecMem]',ct);
scatter2(ct,NbackX_HR,TargetHR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;
close all

%%
t = sprintf('%1.0f Hit[0back_REC] & NonTarget[RecMem]',ct);
scatter2(ct,Nback0_HR,NonTarget,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f Hit[2back_REC] & NonTarget[RecMem]',ct);
scatter2(ct,Nback2_HR,NonTarget,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f Hit[Xback_REC] & NonTarget[RecMem]',ct);
scatter2(ct,NbackX_HR,NonTarget,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;
close all

%%
t = sprintf('%1.0f Hit[0back_REC] & Lure[RecMem]',ct);
scatter2(ct,Nback0_HR,Lure,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f Hit[2back_REC] & Lure[RecMem]',ct);
scatter2(ct,Nback2_HR,Lure,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f Hit[Xback_REC] & Lure[RecMem]',ct);
scatter2(ct,NbackX_HR,Lure,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;
close all

%%
t = sprintf('%1.0f Hit[0back_REC] & Nonlure[RecMem]',ct);
scatter2(ct,Nback0_HR,Nonlure,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f Hit[2back_REC] & Nonlure[RecMem]',ct);
scatter2(ct,Nback2_HR,Nonlure,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f Hit[Xback_REC] & Nonlure[RecMem]',ct);
scatter2(ct,NbackX_HR,Nonlure,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;
close all

%% RecMem 
t = sprintf('%1.0f Target(32) & Hit[RecMem] [All]',ct);
scatter2(ct,TargetHR,RecMemHR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f NonTarget(128) & Hit[RecMem] [All]',ct);
scatter2(ct,NonTarget,RecMemHR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

%t = sprintf('Overall_TLN: Hit[N-Back] & FA[RecMem] [All]');
%scatter2(ct,NbackX_HR,RecMemFA,gray_matrix(20,:),gray_matrix(gray_index,:),t)
%ct = ct+1;

t = sprintf('%1.0f Lure(40) & Hit[RecMem] [All]',ct);
scatter2(ct,Lure,RecMemHR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f Nonlure(88) & Hit[RecMem] [All]',ct);
scatter2(ct,Nonlure,RecMemHR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;
close all

t = sprintf('%1.0f 0Back & Hit[RecMem] [All]',ct);
scatter2(ct,Nback0_HR,RecMemHR,gray_matrix(20,:),gray_matrix(gray_index,:),t);
ct = ct+1;

t = sprintf('%1.0f 2Back & Hit[RecMem] [All]',ct);
scatter2(ct,Nback2_HR,RecMemHR,gray_matrix(20,:),gray_matrix(gray_index,:),t);
ct = ct+1;

t = sprintf('%1.0f XBack & Hit[RecMem] [All]',ct);
scatter2(ct,NbackX_HR,RecMemHR,gray_matrix(20,:),gray_matrix(gray_index,:),t);
ct = ct+1;
close all

%%
t = sprintf('%1.0f 0Back & Hit[RecMem] [Happy]',ct);
scatter2(ct,Nback0_HR,Happy_HR,gray_matrix(20,:),gray_matrix(gray_index,:),t);
ct = ct+1;

t = sprintf('%1.0f 2Back & Hit[RecMem] [Happy]',ct);
scatter2(ct,Nback2_HR,Happy_HR,gray_matrix(20,:),gray_matrix(gray_index,:),t);
ct = ct+1;

t = sprintf('%1.0f 0Back & Hit[RecMem] [Fear]',ct);
scatter2(ct,Nback0_HR,Fear_HR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f 2Back & Hit[RecMem] [Fear]',ct);
scatter2(ct,Nback2_HR,Fear_HR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f 0Back & Hit[RecMem] [Neut]',ct);
scatter2(ct,Nback0_HR,Neut_HR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f 2Back & Hit[RecMem] [Neut]',ct);
scatter2(ct,Nback2_HR,Neut_HR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f 0Back & Hit[RecMem] [Place]',ct);
scatter2(ct,Nback0_HR,Place_HR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f 2Back & Hit[RecMem] [Place]',ct);
scatter2(ct,Nback2_HR,Place_HR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;
close all

%% Targets
t = sprintf('%1.0f Target(32) & Hit[RecMem] [Happy]',ct);
scatter2(ct,TargetHR,Happy_HR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f Target(32) & Hit[RecMem] [Fear]',ct);
scatter2(ct,TargetHR,Fear_HR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f Target(32) & Hit[RecMem] [Neut]',ct);
scatter2(ct,TargetHR,Neut_HR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f Target(32) & Hit[RecMem] [Place]',ct);
scatter2(ct,TargetHR,Place_HR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;
close all

%% NonTarget
t = sprintf('%1.0f NonTarget(128) & Hit[RecMem] [Happy]',ct);
scatter2(ct,NonTarget,Happy_HR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f NonTarget(128) & Hit[RecMem] [Fear]',ct);
scatter2(ct,NonTarget,Fear_HR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f NonTarget(128) & Hit[RecMem] [Neut]',ct);
scatter2(ct,NonTarget,Neut_HR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f NonTarget(128) & Hit[RecMem] [Place]',ct);
scatter2(ct,NonTarget,Place_HR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;
close all

%% Lure

t = sprintf('%1.0f Lure(40) & Hit[RecMem] [Happy]',ct);
scatter2(ct,Lure,Happy_HR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f Lure(40) & Hit[RecMem] [Fear]',ct);
scatter2(ct,Lure,Fear_HR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f Lure(40) & Hit[RecMem] [Neut]',ct);
scatter2(ct,Lure,Neut_HR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f Lure(40) & Hit[RecMem] [Place]',ct);
scatter2(ct,Lure,Place_HR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;
close all

%% Nonlure
t = sprintf('%1.0f Nonlure(88) & Hit[RecMem] [Happy]',ct);
scatter2(ct,Nonlure,Happy_HR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f Nonlure(88) & Hit[RecMem] [Fear]',ct);
scatter2(ct,Nonlure,Fear_HR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f Nonlure(88) & Hit[RecMem] [Neut]',ct);
scatter2(ct,Nonlure,Neut_HR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;

t = sprintf('%1.0f Nonlure(88) & Hit[RecMem] [Place]',ct);
scatter2(ct,Nonlure,Place_HR,gray_matrix(20,:),gray_matrix(gray_index,:),t)
ct = ct+1;
close all
%}

%% Local Functions
function scatter2(ct,X,Y,color1,color2,t)
    % Creates scatter plots w/o the subplot feature
    figure(ct)
    %ann_dim = [.15, .775, .1, .1; .15, .3, .1, .1];
    saveDir = '/Users/tc587/fMRI/ABCD/NBack Analaysis Package/Output/NBack/20170210';
    ann_dim = [.15, .775, .1, .1; .15, .775, .1, .1];
    hold on
    ti = title(t,'Fontsize',20);
    set(ti,'interpreter','none')
    scatter(X,Y,[],color1,'filled')
    p = polyfit(X,Y,1);
    y = polyval(p,linspace(0,1,length(X)));
    [R,~] = corrcoef(X,Y);
    plot(linspace(0,1,length(X)),y,'color',color2)
    annotation('textbox',ann_dim(2,:),'String',...
        sprintf('y = %0.3fx + %0.3f\nr = %0.3f\nr^2 = %0.3f',...
        p(1),p(2),R(2),R(2)^2),'LineWidth',1.5);
%{
    if isempty(strfind(t,'NonTarget')) || isempty(strfind(t,'Lure')) || isempty(strfind(t,'Nonlure'))
        HM = 'Hit';
    else
        HM = 'FA';
    end
%}
    label_ind = findstr(' ',t);
    %t(label_ind(1)+1:label_ind(2)-1)
    xl = xlabel(t(label_ind(1)+1:label_ind(2)-1),'Fontsize',16);
    if strfind(t,'Dprime')
        yl = ylabel('Dprime [RecMem]','Fontsize',16);
    else
        %ylabel(sprintf('%s [RecMem]',HM),'Fontsize',16)
        %ylabel('[RecMem]','Fontsize',16)
        try
            yl = ylabel(t(label_ind(3)+1:label_ind(4)-1),'Fontsize',16);
        catch
            yl = ylabel(t(label_ind(3)+1:end),'Fontsize',16);
        end
        set(xl,'interpreter','none')
        set(yl,'interpreter','none')
        if max(X) > 1
            xlim([floor(min(X)) ceil(max(X))])
            xticks(floor(min(X)):ceil(max(X)))
        else
            xlim([0 1])
            xticks(0:0.1:1)
        end
        
        if max(Y) > 1
            ylim([floor(min(Y)) ceil(max(Y))])
            yticks(floor(min(Y)):ceil(max(Y)))
        else
            ylim([0 1])
            yticks(0:0.1:1)
        end

    end
    hold off
    saveas(gcf,fullfile(saveDir,'Plots',t),'jpg')
end

function scatter3(ct,X,Y,color1,color2,t,subplot_ind)
    % Creates scatter plots with subplots by subplot_ind
    saveDir = '/Users/tc587/fMRI/ABCD/NBack Analaysis Package/Output/NBack/20170123';
    ann_dim = [.15, .775, .1, .1; .15, .3, .1, .1];
    
    if subplot_ind == 1
        ann_dim = ann_dim(1,:);
        fig = figure(ct);
    else
        ann_dim = ann_dim(2,:);
    end
    
    subplot(2,1,subplot_ind)
    hold on
    title(t,'Fontsize',20)
    scatter(X,Y,[],color1,'filled')
    p = polyfit(X,Y,1);
    y = polyval(p,linspace(0,1,length(X)));
    [R,~] = corrcoef(X,Y);
    plot(linspace(0,1,length(X)),y,'color',color2)
    xlim([0 1])
    xticks(0:0.2:1)
    ylim([0 1])
    yticks(0:0.2:1)
    annotation('textbox',ann_dim,'String',...
        sprintf('y = %0.3fx + %0.3f\nr = %0.3f\nr^2 = %0.3f',...
        p(1),p(2),R(2),R(2)^2),'LineWidth',1.5);
    xlabel('[NBack]','Fontsize',16)
    ylabel('[RecMem]','Fontsize',16)
    hold off
    
    if subplot_ind == 2
        saveas(gcf,fullfile(saveDir,'Plots/SubPlots',t),'jpg')
    end
end
