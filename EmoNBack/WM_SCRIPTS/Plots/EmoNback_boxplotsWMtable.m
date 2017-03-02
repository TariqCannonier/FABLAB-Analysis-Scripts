%% EmoNback WM SubAnalysis
%try
%    csvfile = ['Output/NBack/EmoNback_WMBehaviorABCD_',datestr(now,'yyyymmdd'),'.csv'];
%    [ExperimentName,Site,NDARGUID,Version,Overall_RT,Overall_ACC,HappyBlocks_RT,HappyBlocks_ACC,FearBlocks_RT,FearBlocks_ACC,NeutBlocks_RT,NeutBlocks_ACC,PlaceBlocks_RT,PlaceBlocks_ACC,Overall0back_RT,Overall0back_ACC,Happy0back_RT,Happy0back_ACC,Fear0back_RT,Fear0back_ACC,Neut0back_RT,Neut0back_ACC,Place0back_RT,Place0back_ACC,Overall2back_RT,Overall2back_ACC,Happy2back_RT,Happy2back_ACC,Fear2back_RT,Fear2back_ACC,Neut2back_RT,Neut2back_ACC,Place2back_RT,Place2back_ACC,run1Overall_RT,run1Overall_ACC,run1HappyBlocks_RT,run1HappyBlocks_ACC,run1FearBlocks_RT,run1FearBlocks_ACC,run1NeutBlocks_RT,run1NeutBlocks_ACC,run1PlaceBlocks_RT,run1PlaceBlocks_ACC,run1Happy0back_RT,run1Happy0back_ACC,run1Fear0back_RT,run1Fear0back_ACC,run1Neut0back_RT,run1Neut0back_ACC,run1Place0back_RT,run1Place0back_ACC,run1Happy2back_RT,run1Happy2back_ACC,run1Fear2back_RT,run1Fear2back_ACC,run1Neut2back_RT,run1Neut2back_ACC,run1Place2back_RT,run1Place2back_ACC,run2Overall_RT,run2Overall_ACC,run2HappyBlocks_RT,run2HappyBlocks_ACC,run2FearBlocks_RT,run2FearBlocks_ACC,run2NeutBlocks_RT,run2NeutBlocks_ACC,run2PlaceBlocks_RT,run2PlaceBlocks_ACC,run2Happy0back_RT,run2Happy0back_ACC,run2Fear0back_RT,run2Fear0back_ACC,run2Neut0back_RT,run2Neut0back_ACC,run2Place0back_RT,run2Place0back_ACC,run2Happy2back_RT,run2Happy2back_ACC,run2Fear2back_RT,run2Fear2back_ACC,run2Neut2back_RT,run2Neut2back_ACC,run2Place2back_RT,run2Place2back_ACC,Nonlure_ACC,Lure_ACC,Target_ACC] = importAnalysis(csvfile);%importAnalysis('EmoNback_WMBehaviorABCD_20161203.csv');
%catch
    o = outputInd(end);
    file = dir(outputDir(1:o));
    csvfile = dir(fullfile(file(end).folder,file(end).name,'EmoNback_WMBehaviorABCD*.csv'));
    %[ExperimentName,Site,NDARGUID,Version,Overall_RT,Overall_ACC,HappyBlocks_RT,HappyBlocks_ACC,FearBlocks_RT,FearBlocks_ACC,NeutBlocks_RT,NeutBlocks_ACC,PlaceBlocks_RT,PlaceBlocks_ACC,Overall0back_RT,Overall0back_ACC,Happy0back_RT,Happy0back_ACC,Fear0back_RT,Fear0back_ACC,Neut0back_RT,Neut0back_ACC,Place0back_RT,Place0back_ACC,Overall2back_RT,Overall2back_ACC,Happy2back_RT,Happy2back_ACC,Fear2back_RT,Fear2back_ACC,Neut2back_RT,Neut2back_ACC,Place2back_RT,Place2back_ACC,run1Overall_RT,run1Overall_ACC,run1HappyBlocks_RT,run1HappyBlocks_ACC,run1FearBlocks_RT,run1FearBlocks_ACC,run1NeutBlocks_RT,run1NeutBlocks_ACC,run1PlaceBlocks_RT,run1PlaceBlocks_ACC,run1Happy0back_RT,run1Happy0back_ACC,run1Fear0back_RT,run1Fear0back_ACC,run1Neut0back_RT,run1Neut0back_ACC,run1Place0back_RT,run1Place0back_ACC,run1Happy2back_RT,run1Happy2back_ACC,run1Fear2back_RT,run1Fear2back_ACC,run1Neut2back_RT,run1Neut2back_ACC,run1Place2back_RT,run1Place2back_ACC,run2Overall_RT,run2Overall_ACC,run2HappyBlocks_RT,run2HappyBlocks_ACC,run2FearBlocks_RT,run2FearBlocks_ACC,run2NeutBlocks_RT,run2NeutBlocks_ACC,run2PlaceBlocks_RT,run2PlaceBlocks_ACC,run2Happy0back_RT,run2Happy0back_ACC,run2Fear0back_RT,run2Fear0back_ACC,run2Neut0back_RT,run2Neut0back_ACC,run2Place0back_RT,run2Place0back_ACC,run2Happy2back_RT,run2Happy2back_ACC,run2Fear2back_RT,run2Fear2back_ACC,run2Neut2back_RT,run2Neut2back_ACC,run2Place2back_RT,run2Place2back_ACC,Nonlure_ACC,Lure_ACC,Target_ACC] = importAnalysis(csvfile(end).name);%importAnalysis('EmoNback_WMBehaviorABCD_20161203.csv');
    [ExperimentName,Site_WM,NDARGUID_WM,Version,Overall_RT,Overall_ACC,HappyBlocks_RT,HappyBlocks_ACC,FearBlocks_RT,FearBlocks_ACC,NeutBlocks_RT,NeutBlocks_ACC,PlaceBlocks_RT,PlaceBlocks_ACC,Overall0back_RT,Overall0back_ACC,Happy0back_RT,Happy0back_ACC,Fear0back_RT,Fear0back_ACC,Neut0back_RT,Neut0back_ACC,Place0back_RT,Place0back_ACC,Overall2back_RT,Overall2back_ACC,Happy2back_RT,Happy2back_ACC,Fear2back_RT,Fear2back_ACC,Neut2back_RT,Neut2back_ACC,Place2back_RT,Place2back_ACC,run1Overall_RT,run1Overall_ACC,run1HappyBlocks_RT,run1HappyBlocks_ACC,run1FearBlocks_RT,run1FearBlocks_ACC,run1NeutBlocks_RT,run1NeutBlocks_ACC,run1PlaceBlocks_RT,run1PlaceBlocks_ACC,run1Happy0back_RT,run1Happy0back_ACC,run1Fear0back_RT,run1Fear0back_ACC,run1Neut0back_RT,run1Neut0back_ACC,run1Place0back_RT,run1Place0back_ACC,run1Happy2back_RT,run1Happy2back_ACC,run1Fear2back_RT,run1Fear2back_ACC,run1Neut2back_RT,run1Neut2back_ACC,run1Place2back_RT,run1Place2back_ACC,run2Overall_RT,run2Overall_ACC,run2HappyBlocks_RT,run2HappyBlocks_ACC,run2FearBlocks_RT,run2FearBlocks_ACC,run2NeutBlocks_RT,run2NeutBlocks_ACC,run2PlaceBlocks_RT,run2PlaceBlocks_ACC,run2Happy0back_RT,run2Happy0back_ACC,run2Fear0back_RT,run2Fear0back_ACC,run2Neut0back_RT,run2Neut0back_ACC,run2Place0back_RT,run2Place0back_ACC,run2Happy2back_RT,run2Happy2back_ACC,run2Fear2back_RT,run2Fear2back_ACC,run2Neut2back_RT,run2Neut2back_ACC,run2Place2back_RT,run2Place2back_ACC,Nonlure_ACC,Lure_ACC,Target_ACC,HappyTargetHR,HappyLureHR,HappyNonlureHR,FearTargetHR,FearLureHR,FearNonlureHR,NeutTargetHR,NeutLureHR,NeutNonlureHR,PlaceTargetHR,PlaceLureHR,PlaceNonlureHR] = importWM(fullfile(csvfile(end).folder,csvfile(end).name));%importSubjDataWM(csvfile(end).name);

%end
close all

%saveDir = fullfile(pwd,'Plots/Boxplots',datestr(now,'yyyymmdd')); % Save data to designated directory
saveDir = fullfile(file(end).folder,file(end).name); % Save data to designated directory
if ~exist(saveDir,'dir')
    mkdir(saveDir)
end
if ~exist(fullfile(saveDir,'Boxplots/WM'),'dir')
    mkdir(fullfile(saveDir,'Boxplots/WM'))
end
if ~exist(fullfile(saveDir,'Boxplots/REC'),'dir')
    mkdir(fullfile(saveDir,'Boxplots/REC'))
end
if ~exist(fullfile(saveDir,'Plots'),'dir')
    mkdir(fullfile(saveDir,'Plots'))
end

% Create a grayscale and index into the row with desired shade of gray.
gray_matrix = gray;
gray_index = 35; % Lower is darker, Higher is lighter
%% WM: Group data by Overall performance in EventType and Run and place in boxplots
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

% Plot individual data points within boxplots
plot(1,Overall(:,1)','x','Color',gray_matrix(gray_index,:),'LineWidth',2)%[.01, .01, .01]*65,'LineWidth',2)
plot(2,Overall(:,2)','x','Color',gray_matrix(gray_index,:),'LineWidth',2)%[.01, .01, .01]*65,'LineWidth',2)
plot(3,Overall(:,3)','x','Color',gray_matrix(gray_index,:),'LineWidth',2)%[.01, .01, .01]*65,'LineWidth',2)
plot(4,Overall(:,4)','x','Color',gray_matrix(gray_index,:),'LineWidth',2)%[.01, .01, .01]*65,'LineWidth',2)
saveas(fig(1),fullfile(saveDir,'Boxplots/WM',sprintf('EmoNbackWM_Overall_Accuracy')),'jpeg')
hold off

%% WM Boxplots by Sites
difSites = unique(Site_WM); %Determine unique site names
ct = 2;
for i = 1:length(difSites)
    ind = find(ismember(Site_WM,difSites(i))); % Find index for each site
    if length(ind)>3
        fig(ct) = figure(ct); %#ok<SAGROW>
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
        saveas(fig(ct),fullfile(saveDir,'Boxplots/WM',sprintf('EmoNbackWM_%s',difSites{i})),'jpeg')%difSites{i})))
        ct = ct+1;
    end
end
close all


