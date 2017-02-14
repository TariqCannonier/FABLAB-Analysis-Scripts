%% EmoNback SubAnalysis

importMIDData
close all

saveDir = fullfile(pwd,'Plots/Boxplots',datestr(now,'yyyymmdd')); % Save data to designated directory
if ~exist(saveDir,'dir')
    mkdir(saveDir)
end

%% Histogram
oneDollarInd = find(OverallMoney<1);

OverallMoney(oneDollarInd) = 1;
fig(1) = figure(1);
set(fig(1),'Position',[1 100 1600 1600]);
histogram(OverallMoney,11)
title(sprintf('MID Earnings Histogram\nN = %1.0f',length(OverallMoney)),'Fontsize',36)
set(gca,'FontSize',16)
xlabel('Money in Dollars','FontSize',20)
ylabel('Frequency','FontSize',20)
%plot(

%% Plot Overall HR for Reward v Loss
signal.loss.HRdata = OverallCombinedLossHitRate(find(~isnan(OverallCombinedLossHitRate)));
signal.loss.RTdata = OverallCombinedLossMeanRT(find(~isnan(OverallCombinedLossMeanRT)));
signal.loss.HRmean = mean(signal.loss.HRdata);
signal.loss.HRstd = std(signal.loss.HRdata);
signal.loss.RTmean = mean(signal.loss.RTdata);
signal.loss.RTstd = std(signal.loss.RTdata);
signal.loss.large.HRdata = OverallLargeLossHitRate(find(~isnan(OverallLargeLossHitRate)));
signal.loss.large.RTdata = OverallLargeLossMeanRT(find(~isnan(OverallLargeLossMeanRT)));
signal.loss.large.HRmean = mean(signal.loss.large.HRdata);
signal.loss.large.RTmean = mean(signal.loss.large.RTdata);
signal.loss.large.HRstd = std(signal.loss.large.HRdata);
signal.loss.large.RTstd = std(signal.loss.large.RTdata);
signal.loss.small.HRdata = OverallSmallLossHitRate(find(~isnan(OverallSmallLossHitRate)));
signal.loss.small.RTdata = OverallSmallLossMeanRT(find(~isnan(OverallSmallLossMeanRT)));
signal.loss.small.HRmean = mean(signal.loss.small.HRdata);
signal.loss.small.RTmean = mean(signal.loss.small.RTdata);
signal.loss.small.HRstd = std(signal.loss.small.HRdata);
signal.loss.small.RTstd = std(signal.loss.small.RTdata);

signal.reward.HRdata = OverallCombinedRewardHitRate(find(~isnan(OverallCombinedRewardHitRate)));
signal.reward.RTdata = OverallCombinedRewardMeanRT(find(~isnan(OverallCombinedRewardMeanRT)));
signal.reward.HRmean= mean(signal.reward.HRdata);
signal.reward.HRstd = std(signal.reward.HRdata);
signal.reward.RTmean = mean(signal.reward.RTdata);
signal.reward.RTstd = std(signal.reward.RTdata);
signal.reward.large.HRdata = OverallLargeRewardHitRate(find(~isnan(OverallLargeRewardHitRate)));
signal.reward.large.HRmean = mean(signal.reward.large.HRdata);
signal.reward.large.HRstd = std(signal.reward.large.HRdata);
signal.reward.large.RTdata = OverallLargeRewardMeanRT(find(~isnan(OverallLargeRewardMeanRT)));
signal.reward.large.RTmean = mean(signal.reward.large.RTdata);
signal.reward.large.RTstd = std(signal.reward.large.RTdata);
signal.reward.small.HRdata = OverallSmallRewardHitRate(find(~isnan(OverallSmallRewardHitRate)));
signal.reward.small.HRmean = mean(signal.reward.small.HRdata);
signal.reward.small.HRstd = std(signal.reward.small.HRdata);
signal.reward.small.RTdata = OverallSmallRewardMeanRT(find(~isnan(OverallSmallRewardMeanRT)));
signal.reward.small.RTmean = mean(signal.reward.large.RTdata);
signal.reward.small.RTstd = std(signal.reward.large.RTdata);

signal.neutral.HRdata = OverallNeutralHitRate(find(~isnan(OverallNeutralHitRate)));
signal.neutral.RTdata = OverallNeutralMeanRT(find(~isnan(OverallNeutralMeanRT)));
signal.neutral.HRmean = mean(signal.neutral.HRdata);
signal.neutral.RTmean = mean(signal.neutral.RTdata);
signal.neutral.HRstd = std(signal.neutral.HRdata);
signal.neutral.RTstd = std(signal.neutral.RTdata);

%signal.reward.neutral.HRdata = OverallNeutralRewardHitRate(find(~isnan(OverallNeutralRewardHitRate)));
%signal.reward.neutral.RTdata = OverallSmallRewardMeanRT(find(~isnan(OverallSmallRewardMeanRT)));
%signal.reward.large = Ove
%signal.reward.small
%signal.reward.neutral

signal.run1.HRdata = run1CombinedLossHitRate(find(~isnan(run1CombinedLossHitRate)));
signal.run1.RTdata = run1CombinedLossMeanRT(find(~isnan(run1CombinedLossMeanRT)));
signal.run1.HRmean = mean(signal.run1.HRdata);
signal.run1.HRstd = std(signal.run1.HRdata);
signal.run1.RTmean = mean(signal.run1.RTdata);
signal.run1.RTstd = std(signal.run1.RTdata);
%signal.run1.large
%signal.run1.small
%signal.run1.neutral

signal.run2.HRdata = run2CombinedLossHitRate(find(~isnan(run2CombinedLossHitRate)));
signal.run2.RTdata = run2CombinedLossMeanRT(find(~isnan(run2CombinedLossMeanRT)));
signal.run2.HRmean = mean(signal.run2.HRdata);
signal.run2.HRstd = std(signal.run2.HRdata);
signal.run2.RTmean = mean(signal.run2.RTdata);
signal.run2.RTstd = std(signal.run2.RTdata);
%signal.run2.large.HR = OverallLargeLossHitRate
%signal.run2.large.RT = OverallLargeLossHit
%signal.run2.small = 
%signal.run2.neutral = 

%% Plotting Signal Detection
figNum = 1;
% Overall Loss v Reward v Neutral(Hit Rate)
fig(figNum) = figure(figNum);
bar([signal.loss.HRmean,signal.reward.HRmean,signal.neutral.HRmean])
title(sprintf('MID Overall Loss v Reward v Neutral (Hit Rate)\nN = %1.0f',length(signal.loss.HRdata)),'Fontsize',30)
xlabel('Condition','Fontsize',24)
ylabel('Hit Rate','Fontsize',24)
set(gca,'xticklabels',{'Loss','Reward','Neutral'},'Fontsize',16)
ylim([0 1.1])
hold on
ebar = errorbar([signal.loss.HRmean,signal.reward.HRmean,signal.neutral.HRmean],[signal.loss.HRstd,signal.reward.HRstd,signal.neutral.HRstd],'LineWidth',2,'Color','r');
set(ebar,'LineStyle','none');
hold off
saveas(fig(figNum),fullfile(saveDir,sprintf('MID%1.0f',figNum)),'jpeg')%difSites{i})))
figNum = figNum+1;

% Overall Loss v Reward v Nuetral (Reaction Time)
fig(figNum) = figure(figNum);
bar([signal.loss.RTmean,signal.reward.RTmean,signal.neutral.RTmean])
title(sprintf('MID Overall Loss v Reward v Neutral (Reaction Time)\nN = %1.0f',length(signal.loss.HRdata)),'Fontsize',30)
xlabel('Condition','Fontsize',24)
ylabel('Reaction Time (ms)','Fontsize',24)
set(gca,'xticklabels',{'Loss','Reward','Neutral'},'Fontsize',16)
ylim([ 0 ceil(max([signal.loss.RTmean signal.reward.RTmean,signal.neutral.RTmean]))*1.4])
hold on
ebar = errorbar([signal.loss.RTmean,signal.reward.RTmean,signal.neutral.RTmean],[signal.loss.RTstd,signal.reward.RTstd,signal.neutral.RTstd],'LineWidth',2,'Color','r');
set(ebar,'LineStyle','none');
hold off
saveas(fig(figNum),fullfile(saveDir,sprintf('MID%1.0f',figNum)),'jpeg')%difSites{i})))
figNum = figNum+1;

% Overall Run1 v Run2 (Hit Rate)
fig(figNum) = figure(figNum);
bar([signal.run1.HRmean,signal.run2.HRmean])
title(sprintf('MID Overall Run1 v Run2 (Hit Rate)\nN = %1.0f',length(signal.loss.HRdata)),'Fontsize',30)
xlabel('Condition','Fontsize',24)
ylabel('Hit Rate','Fontsize',24)
set(gca,'xticklabels',{'Run1','Run2'},'Fontsize',16)
ylim([0 1.1])
hold on
ebar = errorbar([signal.run1.HRmean,signal.run2.HRmean],[signal.run1.HRstd,signal.run2.HRstd],'LineWidth',2,'Color','r');
set(ebar,'LineStyle','none');
hold off
saveas(fig(figNum),fullfile(saveDir,sprintf('MID%1.0f',figNum)),'jpeg')%difSites{i})))
figNum = figNum+1;

% Overall Run1 v Run2 (Reaction Time)
fig(figNum) = figure(figNum);
bar([signal.run1.RTmean,signal.run2.RTmean])
title(sprintf('MID Overall Run1 v Run2 (Reaction Time)\nN = %1.0f',length(signal.run1.HRdata)),'Fontsize',30)
xlabel('Condition','Fontsize',24)
ylabel('Reaction Time (ms)','Fontsize',24)
set(gca,'xticklabels',{'Run1','Run2'},'Fontsize',16)
ylim([0 ceil(max([signal.run1.RTmean signal.run2.RTmean]))*1.4])
hold on
ebar = errorbar([signal.run1.RTmean,signal.run2.RTmean],[signal.run1.RTstd,signal.run2.RTstd],'LineWidth',2,'Color','r');
set(ebar,'LineStyle','none');
hold off
saveas(fig(figNum),fullfile(saveDir,sprintf('MID%1.0f',figNum)),'jpeg')%difSites{i})))
figNum = figNum+1;

% Overall Loss (Small, Large) v Overall Reward (Small, Large) v Neutral (Hit Rate)
fig(figNum) = figure(figNum);
%x = [signal.loss.small.HRmean,signal.loss.large.HRmean,signal.neutral.HRmean;signal.reward.small.HRmean,signal.reward.large.HRmean,signal.neutral.HRmean];
model_series = [signal.loss.small.HRmean,signal.loss.large.HRmean,signal.neutral.HRmean;signal.reward.small.HRmean,signal.reward.large.HRmean,signal.neutral.HRmean];
model_error = [signal.loss.small.HRstd,signal.loss.large.HRstd,signal.neutral.HRstd;signal.reward.small.HRstd,signal.reward.large.HRstd,signal.neutral.HRstd];
b1 = bar(model_series);
title(sprintf('MID Loss v Reward (Hit Rate)\nN = %1.0f',length(signal.loss.small.HRmean)),'Fontsize',30)
xlabel('Condition','Fontsize',24)
ylabel('Hit Rate','Fontsize',24)
legend('Small','Large','Neutral')
set(gca,'xticklabels',{'Loss','Reward'},'Fontsize',16)
ylim([0 1.1])
hold on
% Creates errorbars for grouped barplots
numgroups = size(model_series,1);
numbars = size(model_series,2);
groupwidth = min(0.8, numbars/(numbars+1.5));
for i = 1:numbars
    x = (1:numgroups)-groupwidth/2+(2*i-1)*groupwidth / (2*numbars);
    errorbar(x,model_series(:,i), model_error(:,i), 'r','linewidth',2, 'linestyle','none');
end
% errorbar is broken for grouped bargraphs
% ebar = errorbar(x,[signal.loss.small.HRstd,signal.loss.large.HRstd,signal.neutral.HRstd;signal.reward.small.HRstd,signal.reward.large.HRstd,signal.neutral.HRstd],'LineWidth',2,'Color','r');
% set(ebar,'LineStyle','none');
hold off
saveas(fig(figNum),fullfile(saveDir,sprintf('MID%1.0f',figNum)),'jpeg')%difSites{i})))
figNum = figNum+1;

% Overall Loss (Small, Large) v Overall Reward (Small, Large) v Neutral (Reaction Time)
fig(figNum) = figure(figNum);
model_series = [signal.loss.small.RTmean,signal.loss.large.RTmean,signal.neutral.RTmean;signal.reward.small.RTmean,signal.reward.large.RTmean,signal.neutral.RTmean];
model_error = [signal.loss.small.RTstd,signal.loss.large.RTstd,signal.neutral.RTstd;signal.reward.small.RTstd,signal.reward.large.RTstd,signal.neutral.RTstd];
bar(model_series)
title(sprintf('MID Loss v Reward (Reaction Time)\nN = %1.0f', length(signal.loss.small.RTmean)),'Fontsize',30)
xlabel('Condition','Fontsize',24)
ylabel('Hit Rate','Fontsize',24)
legend('Small','Large','Neutral')
set(gca,'xticklabels',{'Loss','Reward'},'Fontsize',16)
ylim([0 ceil(max([signal.loss.small.RTmean signal.loss.large.RTmean, signal.neutral.RTmean, signal.reward.small.RTmean, signal.reward.large.RTmean,signal.neutral.RTmean]))*1.4])
hold on
% Create errorbars for grouped barplots
numgroups = size(model_series,1);
numbars = size(model_series,2);
groupwidth = min(0.8, numbars/(numbars+1.5));
for i = 1:numbars
    x = (1:numgroups)-groupwidth/2+(2*i-1)*groupwidth / (2*numbars);
    errorbar(x,model_series(:,i), model_error(:,i), 'r','linewidth',2, 'linestyle','none');
end

hold off
saveas(fig(figNum),fullfile(saveDir,sprintf('MID%1.0f',figNum)),'jpeg')%difSites{i})))




%{
% Run1 Loss and Reward v Run2 Loss and Reward (Hit Rate)

% Run1 Loss and Reward v Run2 Loss and Reward (Reaction Time)

% Run1 (small, large, and neutral) v Run2 (small, large, and neutral) (Hit Rate)

% Run1 (small, large, and neutral) v Run2 (small, large, and neutral) (Reaction Time)
%}
%%



%{
% Create a grayscale and index into the row with desired shade of gray.
gray_matrix = gray;
gray_index = 35; % Lower is darker, Higher is lighter
%% Group data by Overall performance in EventType and Run and place in boxplots
Overall = [Overall0back_ACC,Overall2back_ACC,run1Overall_ACC,run2Overall_ACC];
plotLabels = {'Overall0back_Acc','Overall2back_ACC','run1Overall_ACC','run2Overall_ACC'};

fig(1) = figure(1); % Figure handle
set(fig(1),'Position',[1 100 1600 1600]); % Determine dimensions for figure

hold on
bp1 = boxplot(Overall,'Labels',plotLabels(1:4)); % Create boxplot
ylim([0 1.1]) % Set the y-axis limits [ymin ymax]
%annotation('textbox',[.15,.3,.3,.3],'String',sprintf('N = %1.0f',length(Overall)),'FitBoxToText','on');

% Pretty-fy Boxplot title, lines, axis numbers
set(bp1,'LineWidth',2) 
set(bp1(7,:),'Visible','off')
set(gca,'FontSize',16)
title(sprintf('EmoNback Overall Accuracy\nN = %1.0f',length(Overall)),'Fontsize',30)
xlabel('EventType','Fontsize',24)
ylabel('Accuracy','Fontsize',24)

%% Plot individual dataPoints
% Plot individual data points within boxplots
plot(1,Overall(:,1)','x','Color',gray_matrix(gray_index,:),'LineWidth',2)%[.01, .01, .01]*65,'LineWidth',2)
plot(2,Overall(:,2)','x','Color',gray_matrix(gray_index,:),'LineWidth',2)%[.01, .01, .01]*65,'LineWidth',2)
plot(3,Overall(:,3)','x','Color',gray_matrix(gray_index,:),'LineWidth',2)%[.01, .01, .01]*65,'LineWidth',2)
plot(4,Overall(:,4)','x','Color',gray_matrix(gray_index,:),'LineWidth',2)%[.01, .01, .01]*65,'LineWidth',2)
saveas(fig(1),fullfile(saveDir,sprintf('EmoNback_Overall_Accuracy')),'jpeg')
hold off

%% Boxplots by Sites
difSites = unique(Site); %Determine unique site names
ct = 2;
for i = 1:length(difSites)
    ind = find(ismember(Site,difSites(i))); % Find index for each site
    if length(ind)>3
        fig(ct) = figure(ct);
        set(fig(ct),'Position',[1 100 1600 1600]);
        hold on
        bp2 = boxplot(Overall(ind,:),'Labels',plotLabels(1:4));
        ylim([0 1.1])
        set(bp2,'LineWidth',2)
        set(bp2(7,:),'Visible','off')
        set(gca,'FontSize',16)
        title(sprintf('EmoNback Overall Accuracy: %s\n n = %1.0f',difSites{i},length(ind)),'Fontsize',30)
        xlabel('EventType','Fontsize',24)
        ylabel('Accuracy','Fontsize',24)
        
        plot(1,Overall(ind,1)','x','Color',gray_matrix(gray_index,:),'LineWidth',2)%[.01, .01, .01],'LineWidth',2)
        plot(2,Overall(ind,2)','x','Color',gray_matrix(gray_index,:),'LineWidth',2)%[.01, .01, .01],'LineWidth',2)
        plot(3,Overall(ind,3)','x','Color',gray_matrix(gray_index,:),'LineWidth',2)%[.01, .01, .01],'LineWidth',2)
        plot(4,Overall(ind,4)','x','Color',gray_matrix(gray_index,:),'LineWidth',2)%[.01, .01, .01],'LineWidth',2)
        hold off
        saveas(fig(ct),fullfile(saveDir,sprintf('EmoNback_%s',difSites{i})),'jpeg')%difSites{i})))
        ct = ct+1;
    end
end
close all
%}

