format longg

%initiate variables
Happy_HR = []; Happy_FA = []; Happy_Pr = []; Happy_Br = [];
Fear_HR = []; Fear_FA = []; Fear_Pr = []; Fear_Br = [];
Neut_HR = []; Neut_FA = []; Neut_Pr = []; Neut_Br = [];
Place_HR = []; Place_FA = []; Place_Pr = []; Place_Br = [];
Happy_Miss = []; Happy_CR = []; Fear_Miss = []; Fear_CR = [];
Neut_Miss = []; Neut_CR = []; Place_Miss = []; Place_CR = [];
Happy_HRd = []; Happy_FAd = []; Happy_dprime = [];
Fear_HRd = []; Fear_FAd = []; Fear_dprime = [];
Neut_HRd = []; Neut_FAd = []; Neut_dprime = [];
Place_HRd = []; Place_FAd = []; Place_dprime = [];
Happy_TargetHR = []; Happy_LureHR = []; Happy_NonlureHR = [];
Fear_TargetHR = []; Fear_LureHR = []; Fear_NonlureHR = [];
Neut_TargetHR = []; Neut_LureHR = []; Neut_NonlureHR = [];
Place_TargetHR = []; Place_LureHR = []; Place_NonlureHR = [];
ThreeExposure0backTargetStim = []; TwoExposure2backTargetStim = [];
TwoExposure0backLureStim = []; TwoExposure2backLureStim = [];
OneExposure0backStim = []; OneExposure2backStim = [];

HappyOldACCvec = []; HappyNewACCvec = []; HappyFAvec = [];
FearOldACCvec = []; FearNewACCvec = []; FearFAvec = [];
NeutOldACCvec = []; NeutNewACCvec = []; NeutFAvec = [];
PlaceOldACCvec = []; PlaceNewACCvec = []; PlaceFAvec = [];

Happy0back_HR = []; Fear0back_HR = []; Neut0back_HR = []; Place0back_HR = [];
HappyOld0backACCvec = []; FearOld0backACCvec = []; NeutOld0backACCvec = [];
PlaceOld0backACCvec = [];

Happy2back_HR = []; Fear2back_HR = []; Neut2back_HR = []; Place2back_HR = [];
HappyOld2backACCvec = []; FearOld2backACCvec = []; NeutOld2backACCvec = [];
PlaceOld2backACCvec = [];

HappyOldTargetACCvec = []; HappyOldLureACCvec = []; HappyOldNonlureACCvec = [];
FearOldTargetACCvec = []; FearOldLureACCvec = []; FearOldNonlureACCvec = [];
NeutOldTargetACCvec = []; NeutOldLureACCvec = []; NeutOldNonlureACCvec = [];
PlaceOldTargetACCvec = []; PlaceOldLureACCvec = []; PlaceOldNonlureACCvec = [];

HappyOldTarget0backACCvec = []; HappyOldTarget2backACCvec = []; HappyOldLure0backACCvec= [];
HappyOldLure2backACCvec = []; HappyOldNonlure0backACCvec = []; HappyOldNonlure2backACCvec = [];
FearOldTarget0backACCvec = []; FearOldTarget2backACCvec = []; FearOldLure0backACCvec = [];
FearOldLure2backACCvec = []; FearOldNonlure0backACCvec = []; FearOldNonlure2backACCvec = [];
NeutOldTarget0backACCvec = []; NeutOldTarget2backACCvec = []; NeutOldLure0backACCvec = [];
NeutOldLure2backACCvec = []; NeutOldNonlure0backACCvec = []; NeutOldNonlure2backACCvec = [];
PlaceOldTarget0backACCvec = []; PlaceOldTarget2backACCvec = []; PlaceOldLure0backACCvec = [];
PlaceOldLure2backACCvec = []; PlaceOldNonlure0backACCvec = []; PlaceOldNonlure2backACCvec = [];

%Stim_ACC_Block_REC = [];
Stim_ACC_Convert = Stim_ACC_Block_REC;
Stim_RT_Convert = Stim_RT_Block_REC;
Stim_ACC_Block_REC = [];
Stim_RT_Block_REC = [];


%Create vectors with revelant values to calculate HR, FA, Pr, and Br
for i = 1:length(Block_REC)
    %Stimulus_Block_REC = Stimulus_Block_REC(~cellfun(@isempty,Stimulus_Block_REC)); StimType_Block_REC = StimType_Block_REC(~cellfun(@isempty,StimType_Block_REC));
    %for i = 1:length(Stimulus_Block_REC)
    try
        Stim_ACC_Block_REC(i) = str2double(Stim_ACC_Convert{i});%str2double(Stim_ACC_Convert{i});
        Stim_RT_Block_REC(i) = str2double(Stim_RT_Convert{i});
    catch
        try
            Stim_ACC_Block_REC(i) = Stim_ACC_Convert(i); % Data is sometimes in cell or array
            Stim_RT_Block_REC(i) = Stim_RT_Convert(i); % Data is sometimes in cell or array
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
            continue;
        end
    end
    
    % Sort positive stim from N-Back Targets, Lures and Nonlures.
    % Sort positive stim from N-Back 0/2-Back games
    if strcmpi(StimType_Block_REC{i}, 'oldposface')                                  %If certain old stim type (here old happy faces)
        if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                             %Pull correct & incorrect trials
            HappyOldACCvec(end+1) = Stim_ACC_Block_REC(i);                            %Place in accuracy vector
        end
        if any(ismember(WMHappyStim0back, Stimulus_Block_REC{i})) == 1         %If 0-back stim intersects Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                HappyOld0backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        elseif any(ismember(WMHappyStim2back, Stimulus_Block_REC{i})) == 1     %If 2-back stim intersects Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                HappyOld2backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 2-back accuracy vector
            end
        end
        if any(ismember(HappyTargetStim, Stimulus_Block_REC{i})) == 1          %If target trial
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                HappyOldTargetACCvec(end+1) = Stim_ACC_Block_REC(i);                  %Place in Target accuracy vector
            end
        end
        if any(ismember(HappyLureStim, Stimulus_Block_REC{i})) == 1                              %If lure trial
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                HappyOldLureACCvec(end+1) = Stim_ACC_Block_REC(i);                    %Place in Lure accuracy vector
            end
        end
        if any(ismember(HappyNonlureStim, Stimulus_Block_REC{i})) == 1                           %If nonlure trial
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                HappyOldNonlureACCvec(end+1) = Stim_ACC_Block_REC(i);                    %Place in Nonlure accuracy vector
            end
        end
        if any(ismember(HappyTarget0backStim, Stimulus_Block_REC{i})) == 1         %If 0-back Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                HappyOldTarget0backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        end
        if any(ismember(HappyTarget2backStim, Stimulus_Block_REC{i})) == 1         %If 0-back Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                HappyOldTarget2backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        end
        if any(ismember(HappyLure0backStim, Stimulus_Block_REC{i})) == 1         %If 0-back Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                        %Pull correct & incorrect trials
                HappyOldLure0backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        end
        if any(ismember(HappyLure2backStim, Stimulus_Block_REC{i})) == 1         %If 0-back Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                HappyOldLure2backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        end
        if any(ismember(HappyNonlure0backStim, Stimulus_Block_REC{i})) == 1         %If 0-back Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                HappyOldNonlure0backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        end
        if any(ismember(HappyNonlure2backStim, Stimulus_Block_REC{i})) == 1         %If 0-back Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                HappyOldNonlure2backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        end
    elseif strcmpi(StimType_Block_REC{i}, 'newposface')                              %else if certain new stim type (here new happy faces)
        if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                             %Pull correct & incorrect trials
            HappyNewACCvec(end+1) = Stim_ACC_Block_REC(i);                            %Place in accuracy vector
        end
        if Stim_ACC_Block_REC(i) == 0                                                 %Pull incorrect trials
            HappyFAvec(end+1) = 1;                                          %Place a 1 for each incorrect trial in False Alarm vector
        end
    elseif strcmpi(StimType_Block_REC{i}, 'oldnegface')                              %See annotations above-- repeated for each stim type
        if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1
            FearOldACCvec(end+1) = Stim_ACC_Block_REC(i);
        end
        if any(ismember(WMFearStim0back, Stimulus_Block_REC{i})) == 1
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1
                FearOld0backACCvec(end+1) = Stim_ACC_Block_REC(i);
            end
        elseif any(ismember(WMFearStim2back, Stimulus_Block_REC{i})) == 1
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1
                FearOld2backACCvec(end+1) = Stim_ACC_Block_REC(i);
            end
        end
        if any(ismember(FearTargetStim, Stimulus_Block_REC{i})) == 1
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1
                FearOldTargetACCvec(end+1) = Stim_ACC_Block_REC(i);
            end
        end
        if any(ismember(FearLureStim, Stimulus_Block_REC{i})) == 1
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1
                FearOldLureACCvec(end+1) = Stim_ACC_Block_REC(i);
            end
        end
        if any(ismember(FearNonlureStim, Stimulus_Block_REC{i})) == 1
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1
                FearOldNonlureACCvec(end+1) = Stim_ACC_Block_REC(i);
            end
        end
        if any(ismember(FearTarget0backStim, Stimulus_Block_REC{i})) == 1         %If 0-back Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                FearOldTarget0backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        end
        if any(ismember(FearTarget2backStim, Stimulus_Block_REC{i})) == 1         %If 0-back Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                FearOldTarget2backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        end
        if any(ismember(FearLure0backStim, Stimulus_Block_REC{i})) == 1         %If 0-back Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                FearOldLure0backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        end
        if any(ismember(FearLure2backStim, Stimulus_Block_REC{i})) == 1         %If 0-back Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                FearOldLure2backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        end
        if any(ismember(FearNonlure0backStim, Stimulus_Block_REC{i})) == 1         %If 0-back Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                FearOldNonlure0backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        end
        if any(ismember(FearNonlure2backStim, Stimulus_Block_REC{i})) == 1         %If 0-back Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                FearOldNonlure2backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        end
    elseif strcmpi(StimType_Block_REC{i}, 'newnegface')
        if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1
            FearNewACCvec(end+1) = Stim_ACC_Block_REC(i);
        end
        if Stim_ACC_Block_REC(i) == 0
            FearFAvec(end+1) = 1;
        end
    elseif strcmpi(StimType_Block_REC{i}, 'oldneutface')
        if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1
            NeutOldACCvec(end+1) = Stim_ACC_Block_REC(i);
        end
        if any(ismember(WMNeutStim0back, Stimulus_Block_REC{i})) == 1
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1
                NeutOld0backACCvec(end+1) = Stim_ACC_Block_REC(i);
            end
        elseif any(ismember(WMNeutStim2back, Stimulus_Block_REC{i})) == 1
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1
                NeutOld2backACCvec(end+1) = Stim_ACC_Block_REC(i);
            end
        end
        if any(ismember(NeutTargetStim, Stimulus_Block_REC{i})) == 1
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1
                NeutOldTargetACCvec(end+1) = Stim_ACC_Block_REC(i);
            end
        end
        if any(ismember(NeutLureStim, Stimulus_Block_REC{i})) == 1
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1
                NeutOldLureACCvec(end+1) = Stim_ACC_Block_REC(i);
            end
        end
        if any(ismember(NeutNonlureStim, Stimulus_Block_REC{i})) == 1
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1
                NeutOldNonlureACCvec(end+1) = Stim_ACC_Block_REC(i);
            end
        end
        if any(ismember(NeutTarget0backStim, Stimulus_Block_REC{i})) == 1         %If 0-back Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                NeutOldTarget0backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        end
        if any(ismember(NeutTarget2backStim, Stimulus_Block_REC{i})) == 1         %If 0-back Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                NeutOldTarget2backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        end
        if any(ismember(NeutLure0backStim, Stimulus_Block_REC{i})) == 1         %If 0-back Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 || Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                NeutOldLure0backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        end
        if any(ismember(NeutLure2backStim, Stimulus_Block_REC{i})) == 1         %If 0-back Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 || Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                NeutOldLure2backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        end
        if any(ismember(NeutNonlure0backStim, Stimulus_Block_REC{i})) == 1         %If 0-back Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                NeutOldNonlure0backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        end
        if any(ismember(NeutNonlure2backStim, Stimulus_Block_REC{i})) == 1         %If 0-back Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                NeutOldNonlure2backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        end
    elseif strcmpi(StimType_Block_REC{i}, 'newneutface')
        if Stim_ACC_Block_REC(i) == 0 || Stim_ACC_Block_REC(i) == 1
            NeutNewACCvec(end+1) = Stim_ACC_Block_REC(i);
        end
        if Stim_ACC_Block_REC(i) == 0
            NeutFAvec(end+1) = 1;
        end
    elseif strcmpi(StimType_Block_REC{i}, 'oldplace')
        if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1
            PlaceOldACCvec(end+1) = Stim_ACC_Block_REC(i);
        end
        if any(ismember(WMPlaceStim0back, Stimulus_Block_REC{i})) == 1
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1
                PlaceOld0backACCvec(end+1) = Stim_ACC_Block_REC(i);
            end
        elseif any(ismember(WMPlaceStim2back, Stimulus_Block_REC{i})) == 1
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1
                PlaceOld2backACCvec(end+1) = Stim_ACC_Block_REC(i);
            end
        end
        if any(ismember(PlaceTargetStim, Stimulus_Block_REC{i})) == 1
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1
                PlaceOldTargetACCvec(end+1) = Stim_ACC_Block_REC(i);
            end
        end
        if any(ismember(PlaceLureStim, Stimulus_Block_REC{i})) == 1
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1
                PlaceOldLureACCvec(end+1) = Stim_ACC_Block_REC(i);
            end
        end
        if any(ismember(PlaceNonlureStim, Stimulus_Block_REC{i})) == 1
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1
                PlaceOldNonlureACCvec(end+1) = Stim_ACC_Block_REC(i);
            end
        end
        if any(ismember(PlaceTarget0backStim, Stimulus_Block_REC{i})) == 1         %If 0-back Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                PlaceOldTarget0backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        end
        if any(ismember(PlaceTarget2backStim, Stimulus_Block_REC{i})) == 1         %If 0-back Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                PlaceOldTarget2backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        end
        if any(ismember(PlaceLure0backStim, Stimulus_Block_REC{i})) == 1         %If 0-back Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                PlaceOldLure0backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        end
        if any(ismember(PlaceLure2backStim, Stimulus_Block_REC{i})) == 1         %If 0-back Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                PlaceOldLure2backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        end
        if any(ismember(PlaceNonlure0backStim, Stimulus_Block_REC{i})) == 1         %If 0-back Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                PlaceOldNonlure0backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        end
        if any(ismember(PlaceNonlure2backStim, Stimulus_Block_REC{i})) == 1         %If 0-back Stimulus_Block_REC
            if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1                         %Pull correct & incorrect trials
                PlaceOldNonlure2backACCvec(end+1) = Stim_ACC_Block_REC(i);                   %Place in 0-back accuracy vector
            end
        end
    elseif strcmpi(StimType_Block_REC{i}, 'newplace')
        if Stim_ACC_Block_REC(i) == 0 | Stim_ACC_Block_REC(i) == 1
            PlaceNewACCvec(end+1) = Stim_ACC_Block_REC(i);
        end
        if Stim_ACC_Block_REC(i) == 0
            PlaceFAvec(end+1) = 1;
        end
    end
end

%Calculate average Hit Rate and False Alarm Rate by condition
%Calculate overall Pr and Response Bias (Br) per stim type
%Calculate Dprime -- use 1/(2N) for 0 and 1 - 1/(2N) for 1 where N = 96 (96 old and 96 new stim)

Happy_HR = mean(HappyOldACCvec); Happy_FA = sum(HappyFAvec)/length(HappyNewACCvec);
Happy_Miss = 1 - mean(HappyOldACCvec); Happy_CR = mean(HappyNewACCvec);
Happy_Pr = Happy_HR - Happy_FA; Happy_Br = (Happy_FA/(1-(Happy_HR - Happy_FA))) - 0.5;
if Happy_HR == 1                                              %1s or 0s in norminv return infinity
    Happy_HRd = 0.9948;
elseif Happy_HR == 0
    Happy_HRd = 0.0052;
else
    Happy_HRd = Happy_HR;
end

if Happy_FA == 1
    Happy_FAd = 0.9948;
elseif Happy_FA == 0
    Happy_FAd = 0.0052;
else
    Happy_FAd = Happy_FA;
end
Happy_dprime = norminv(Happy_HRd) - norminv(Happy_FAd);          %Dprime = z(Happy_HRd) - z(Happy_FAd)
Happy0back_HR = mean(HappyOld0backACCvec); Happy2back_HR = mean(HappyOld2backACCvec);
Happy_TargetHR = mean(HappyOldTargetACCvec); Happy_LureHR = mean(HappyOldLureACCvec); Happy_NonlureHR = mean(HappyOldNonlureACCvec);

Fear_HR = mean(FearOldACCvec); Fear_FA = sum(FearFAvec)/length(FearNewACCvec);
Fear_Pr = Fear_HR - Fear_FA; Fear_Br = (Fear_FA/(1-(Fear_HR - Fear_FA))) - 0.5;
Fear_Miss = 1 - mean(FearOldACCvec); Fear_CR = mean(FearNewACCvec);
if Fear_HR == 1                                              %1s or 0s in norminv return infinity
    Fear_HRd = 0.9948;
elseif Fear_HR == 0
    Fear_HRd = 0.0052;
else
    Fear_HRd = Fear_HR;
end
if Fear_FA == 1
    Fear_FAd = 0.9948;
elseif Fear_FA == 0
    Fear_FAd = 0.0052;
else
    Fear_FAd = Fear_FA;
end
Fear_dprime = norminv(Fear_HRd) - norminv(Fear_FAd);          %Dprime = z(Fear_HRd) - z(Fear_FAd)
Fear0back_HR = mean(FearOld0backACCvec); Fear2back_HR = mean(FearOld2backACCvec);
Fear_TargetHR = mean(FearOldTargetACCvec); Fear_LureHR = mean(FearOldLureACCvec); Fear_NonlureHR = mean(FearOldNonlureACCvec);

Neut_HR = mean(NeutOldACCvec); Neut_FA = sum(NeutFAvec)/length(NeutNewACCvec);
Neut_Pr = Neut_HR - Neut_FA; Neut_Br = (Neut_FA/(1-(Neut_HR - Neut_FA))) - 0.5;
Neut_Miss = 1 - mean(NeutOldACCvec); Neut_CR = mean(NeutNewACCvec);
if Neut_HR == 1                                              %1s or 0s in norminv return infinity
    Neut_HRd = 0.9948;
elseif Neut_HR == 0
    Neut_HRd = 0.0052;
else
    Neut_HRd = Neut_HR;
end
if Neut_FA == 1
    Neut_FAd = 0.9948;
elseif Neut_FA == 0
    Neut_FAd = 0.0052;
else
    Neut_FAd = Neut_FA;
end
Neut_dprime = norminv(Neut_HRd) - norminv(Neut_FAd);          %Dprime = z(Neut_HRd) - z(Neut_FAd)
Neut0back_HR = mean(NeutOld0backACCvec); Neut2back_HR = mean(NeutOld2backACCvec);
Neut_TargetHR = mean(NeutOldTargetACCvec); Neut_LureHR = mean(NeutOldLureACCvec); Neut_NonlureHR = mean(NeutOldNonlureACCvec);


Place_HR = mean(PlaceOldACCvec); Place_FA = sum(PlaceFAvec)/length(PlaceNewACCvec);
Place_Pr = Place_HR - Place_FA; Place_Br = (Place_FA/(1-(Place_HR - Place_FA))) - 0.5;
Place_Miss = 1 - mean(PlaceOldACCvec); Place_CR = mean(PlaceNewACCvec);
if Place_HR == 1                                              %1s or 0s in norminv return infinity
    Place_HRd = 0.9948;
elseif Place_HR == 0
    Place_HRd = 0.0052;
else
    Place_HRd = Place_HR;
end
if Place_FA == 1
    Place_FAd = 0.9948;
elseif Place_FA == 0
    Place_FAd = 0.0052;
else
    Place_FAd = Place_FA;
end
Place_dprime = norminv(Place_HRd) - norminv(Place_FAd);          %Dprime = z(Place_HRd) - z(Place_FAd)
Place0back_HR = mean(PlaceOld0backACCvec); Place2back_HR = mean(PlaceOld2backACCvec);
Place_TargetHR = mean(PlaceOldTargetACCvec); Place_LureHR = mean(PlaceOldLureACCvec); Place_NonlureHR = mean(PlaceOldNonlureACCvec);

checkNAN = [Happy_TargetHR, Happy_LureHR, Happy_NonlureHR, Fear_TargetHR,...
    Fear_LureHR, Fear_NonlureHR, Neut_TargetHR, Neut_LureHR, Neut_NonlureHR,...
    Place_TargetHR, Place_LureHR, Place_NonlureHR];

if any(isnan(checkNAN))
    1
    return;
end
try
    % Avoid biasing results from uneven trial nums across trial types
    HappyOldLure0backACCvec = HappyOldLure0backACCvec(randi(length(HappyOldLure0backACCvec),[length(HappyOldTarget0backACCvec),1]));
    %HappyOldNonlure0backACCvec = HappyOldNonlure0backACCvec(randi(length(HappyOldNonlure0backACCvec),[length(HappyOldTarget0backACCvec),1]));
    HappyOldTarget2backACCvec = HappyOldTarget2backACCvec(randi(length(HappyOldTarget2backACCvec),[length(HappyOldTarget0backACCvec),1]));
    HappyOldLure2backACCvec = HappyOldLure2backACCvec(randi(length(HappyOldLure2backACCvec),[length(HappyOldTarget0backACCvec),1]));
    %HappyOldNonlure2backACCvec = HappyOldNonlure2backACCvec(randi(length(HappyOldNonlure2backACCvec),[length(HappyOldTarget0backACCvec),1]));
    FearOldLure0backACCvec = FearOldLure0backACCvec(randi(length(FearOldLure0backACCvec),[length(FearOldTarget0backACCvec),1]));
    %FearOldNonlure0backACCvec = FearOldNonlure0backACCvec(randi(length(FearOldNonlure0backACCvec),[length(FearOldTarget0backACCvec),1]));
    FearOldTarget2backACCvec = FearOldTarget2backACCvec(randi(length(FearOldTarget2backACCvec),[length(FearOldTarget0backACCvec),1]));
    FearOldLure2backACCvec = FearOldLure2backACCvec(randi(length(FearOldLure2backACCvec),[length(FearOldTarget0backACCvec),1]));
    %FearOldNonlure2backACCvec = FearOldNonlure2backACCvec(randi(length(FearOldNonlure2backACCvec),[length(FearOldTarget0backACCvec),1]));
    NeutOldLure0backACCvec = NeutOldLure0backACCvec(randi(length(NeutOldLure0backACCvec),[length(NeutOldTarget0backACCvec),1]));
    %NeutOldNonlure0backACCvec = NeutOldNonlure0backACCvec(randi(length(NeutOldNonlure0backACCvec),[length(NeutOldTarget0backACCvec),1]));
    NeutOldTarget2backACCvec = NeutOldTarget2backACCvec(randi(length(NeutOldTarget2backACCvec),[length(NeutOldTarget0backACCvec),1]));
    NeutOldLure2backACCvec = NeutOldLure2backACCvec(randi(length(NeutOldLure2backACCvec),[length(NeutOldTarget0backACCvec),1]));
    %NeutOldNonlure2backACCvec = NeutOldNonlure2backACCvec(randi(length(NeutOldNonlure2backACCvec),[length(NeutOldTarget0backACCvec),1]));
    PlaceOldLure0backACCvec = PlaceOldLure0backACCvec(randi(length(PlaceOldLure0backACCvec),[length(PlaceOldTarget0backACCvec),1]));
    %PlaceOldNonlure0backACCvec = PlaceOldNonlure0backACCvec(randi(length(PlaceOldNonlure0backACCvec),[length(PlaceOldTarget0backACCvec),1]));
    PlaceOldTarget2backACCvec = PlaceOldTarget2backACCvec(randi(length(PlaceOldTarget2backACCvec),[length(PlaceOldTarget0backACCvec),1]));
    PlaceOldLure2backACCvec = PlaceOldLure2backACCvec(randi(length(PlaceOldLure2backACCvec),[length(PlaceOldTarget0backACCvec),1]));
    %PlaceOldNonlure2backACCvec = PlaceOldNonlure2backACCvec(randi(length(PlaceOldNonlure2backACCvec),[length(PlaceOldTarget0backACCvec),1]));
    %}
    
    %
    ThreeExposure0backTargetStim = mean(horzcat(HappyOldTarget0backACCvec,FearOldTarget0backACCvec,NeutOldTarget0backACCvec,PlaceOldTarget0backACCvec));
    TwoExposure2backTargetStim = mean(horzcat(HappyOldTarget2backACCvec,FearOldTarget2backACCvec,NeutOldTarget2backACCvec,PlaceOldTarget2backACCvec));
    TwoExposure0backLureStim = mean(horzcat(HappyOldLure0backACCvec,FearOldLure0backACCvec,NeutOldLure0backACCvec,PlaceOldLure0backACCvec));
    TwoExposure2backLureStim = mean(horzcat(HappyOldLure2backACCvec,FearOldLure2backACCvec,NeutOldLure2backACCvec,PlaceOldLure2backACCvec));
    OneExposure0backStim = mean(horzcat(HappyOldNonlure0backACCvec,FearOldNonlure0backACCvec,NeutOldNonlure0backACCvec,PlaceOldNonlure0backACCvec));
    OneExposure2backStim = mean(horzcat(HappyOldNonlure2backACCvec,FearOldNonlure2backACCvec,NeutOldNonlure2backACCvec,PlaceOldNonlure2backACCvec));
    %}
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
    %continue
    %break
end