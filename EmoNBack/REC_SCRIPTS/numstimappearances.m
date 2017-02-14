% WMHappyStim0back
% [uniqueWMHappyStim0back, ~, counts0back]=unique(WMHappyStim0back)
% WMHappy0backStimCounts = histc(counts0back, 1:numel(uniqueWMHappyStim0back))
%
% [uniqueWMHappyStim2back, ~, counts2back]=unique(WMHappyStim2back)
% WMHappy2backStimCounts = histc(counts2back, 1:numel(uniqueWMHappyStim2back))

WMHappyStim0back = []; WMHappyStim2back = [];
WMFearStim0back = []; WMFearStim2back = [];
WMNeutStim0back = []; WMNeutStim2back = [];
WMPlaceStim0back = []; WMPlaceStim2back = [];

HappyTarget0backStim = []; HappyLure0backStim = []; HappyNonlure0backStim = [];
FearTarget0backStim = []; FearLure0backStim = []; FearNonlure0backStim = [];
NeutTarget0backStim = []; NeutLure0backStim = []; NeutNonlure0backStim = [];
PlaceTarget0backStim = []; PlaceLure0backStim = []; PlaceNonlure0backStim = [];

HappyTarget2backStim = []; HappyLure2backStim = []; HappyNonlure2backStim = [];
FearTarget2backStim = []; FearLure2backStim = []; FearNonlure2backStim = [];
NeutTarget2backStim = []; NeutLure2backStim = []; NeutNonlure2backStim = [];
PlaceTarget2backStim = []; PlaceLure2backStim = []; PlaceNonlure2backStim = [];

%Block_WM = [];
%BlockType_WM = [];
%StimType_WM = [];
%Stimulus_WM = [];
%TargetType_WM = [];

for i = 1:length(Block_WM)
    if isempty(BlockType_WM{i})
        continue
    end
    if strcmpi(BlockType_WM{i}, '0-Back') || any(BlockType_WM{i} == 0) % If blocktype is a 0-Back game
        % Sort by face emotion
        if strcmpi(StimType_WM{i}, 'PosFace')
            WMHappyStim0back{end+1} = Stimulus_WM{i};
            if strcmpi(TargetType_WM{i}, 'target') % Sorty be game type [target, lure, nonlure]
                HappyTarget0backStim{end+1} = Stimulus_WM{i};
            elseif strcmpi(TargetType_WM{i}, 'lure')
                HappyLure0backStim{end+1} = Stimulus_WM{i};
            elseif strcmpi(TargetType_WM{i}, 'nonlure')
                HappyNonlure0backStim{end+1} = Stimulus_WM{i};
            end
        % Sort negative faces by targets, lure, and nonlure
        elseif strcmpi(StimType_WM{i}, 'NegFace')
            WMFearStim0back{end+1} = Stimulus_WM{i};
            if strcmpi(TargetType_WM{i}, 'target')
                FearTarget0backStim{end+1} = Stimulus_WM{i};
            elseif strcmpi(TargetType_WM{i}, 'lure')
                FearLure0backStim{end+1} = Stimulus_WM{i};
            elseif strcmpi(TargetType_WM{i}, 'nonlure')
                FearNonlure0backStim{end+1} = Stimulus_WM{i};
            end
            
        % Sort Neutral faces by targets, lure, and nonlure
        elseif strcmpi(StimType_WM{i}, 'NeutFace')
            WMNeutStim0back{end+1} = Stimulus_WM{i};
            if strcmpi(TargetType_WM{i}, 'target')
                NeutTarget0backStim{end+1} = Stimulus_WM{i};
            elseif strcmpi(TargetType_WM{i}, 'lure')
                NeutLure0backStim{end+1} = Stimulus_WM{i};
            elseif strcmpi(TargetType_WM{i}, 'nonlure')
                NeutNonlure0backStim{end+1} = Stimulus_WM{i};
            end
        % Sort places by targets, lure, and nonlure
        elseif strcmpi(StimType_WM{i}, 'Place')
            WMPlaceStim0back{end+1} = Stimulus_WM{i};
            if strcmpi(TargetType_WM{i}, 'target')
                PlaceTarget0backStim{end+1} = Stimulus_WM{i};
            elseif strcmpi(TargetType_WM{i}, 'lure')
                PlaceLure0backStim{end+1} = Stimulus_WM{i};
            elseif strcmpi(TargetType_WM{i}, 'nonlure')
                PlaceNonlure0backStim{end+1} = Stimulus_WM{i};
            end
        end
        
        % Determine if playing the 2-Back game
    elseif strcmpi(BlockType_WM{i}, '2-Back') || any(BlockType_WM{27} == 2)
        
        % Sort positive faces by target, lure, and nonlure
        if strcmpi(StimType_WM{i}, 'PosFace')
            WMHappyStim2back{end+1} = Stimulus_WM{i};
            if strcmpi(TargetType_WM{i}, 'target')
                HappyTarget2backStim{end+1} = Stimulus_WM{i};
            elseif strcmpi(TargetType_WM{i}, 'lure')
                HappyLure2backStim{end+1} = Stimulus_WM{i};
            elseif strcmpi(TargetType_WM{i}, 'nonlure')
                HappyNonlure2backStim{end+1} = Stimulus_WM{i};
            end
            
        % Sort Negative faces by target, lure, and nonlure
        elseif strcmpi(StimType_WM{i}, 'NegFace')
            WMFearStim2back{end+1} = Stimulus_WM{i};
            if strcmpi(TargetType_WM{i}, 'target')
                FearTarget2backStim{end+1} = Stimulus_WM{i};
            elseif strcmpi(TargetType_WM{i}, 'lure')
                FearLure2backStim{end+1} = Stimulus_WM{i};
            elseif strcmpi(TargetType_WM{i}, 'nonlure')
                FearNonlure2backStim{end+1} = Stimulus_WM{i};
            end
        % Sort neutral faces by target, lure, and nonlure
        elseif strcmpi(StimType_WM{i}, 'NeutFace')
            WMNeutStim2back{end+1} = Stimulus_WM{i};
            if strcmpi(TargetType_WM{i}, 'target')
                NeutTarget2backStim{end+1} = Stimulus_WM{i};
            elseif strcmpi(TargetType_WM{i}, 'lure')
                NeutLure2backStim{end+1} = Stimulus_WM{i};
            elseif strcmpi(TargetType_WM{i}, 'nonlure')
                NeutNonlure2backStim{end+1} = Stimulus_WM{i};
            end
            
        % Sort places by target, lure, and nonlure
        elseif strcmpi(StimType_WM{i}, 'Place')
            WMPlaceStim2back{end+1} = Stimulus_WM{i};
            if strcmpi(TargetType_WM{i}, 'target')
                PlaceTarget2backStim{end+1} = Stimulus_WM{i};
            elseif strcmpi(TargetType_WM{i}, 'lure')
                PlaceLure2backStim{end+1} = Stimulus_WM{i};
            elseif strcmpi(TargetType_WM{i}, 'nonlure')
                PlaceNonlure2backStim{end+1} = Stimulus_WM{i};
            end
        end
    end
end

try
    HappyTarget0backStim = unique(HappyTarget0backStim)'; HappyLure0backStim = unique(HappyLure0backStim)';
    HappyNonlure0backStim = unique(HappyNonlure0backStim)';
    FearTarget0backStim = unique(FearTarget0backStim)'; FearLure0backStim = unique(FearLure0backStim)';
    FearNonlure0backStim = unique(FearNonlure0backStim)';
    NeutTarget0backStim = unique(NeutTarget0backStim)'; NeutLure0backStim = unique(NeutLure0backStim)';
    NeutNonlure0backStim = unique(NeutNonlure0backStim)';
    PlaceTarget0backStim = unique(PlaceTarget0backStim)'; PlaceLure0backStim = unique(PlaceLure0backStim)';
    PlaceNonlure0backStim = unique(PlaceNonlure0backStim)';
    
    HappyTarget2backStim = unique(HappyTarget2backStim)'; HappyLure2backStim = unique(HappyLure2backStim)';
    HappyNonlure2backStim = unique(HappyNonlure2backStim)';
    FearTarget2backStim = unique(FearTarget2backStim)'; FearLure2backStim = unique(FearLure2backStim)';
    FearNonlure2backStim = unique(FearNonlure2backStim)';
    NeutTarget2backStim = unique(NeutTarget2backStim)'; NeutLure2backStim = unique(NeutLure2backStim)';
    NeutNonlure2backStim = unique(NeutNonlure2backStim)';
    PlaceTarget2backStim = unique(PlaceTarget2backStim)'; PlaceLure2backStim = unique(PlaceLure2backStim)';
    PlaceNonlure2backStim = unique(PlaceNonlure2backStim)';
    
    HappyNonlure0backStim = setdiff(HappyNonlure0backStim, HappyLure0backStim);
    HappyNonlure2backStim = setdiff(HappyNonlure2backStim, HappyLure2backStim);
    FearNonlure0backStim = setdiff(FearNonlure0backStim, FearLure0backStim);
    FearNonlure2backStim = setdiff(FearNonlure2backStim, FearLure2backStim);
    NeutNonlure0backStim = setdiff(NeutNonlure0backStim, NeutLure0backStim);
    NeutNonlure2backStim = setdiff(NeutNonlure2backStim, NeutLure2backStim);
    PlaceNonlure0backStim = setdiff(PlaceNonlure0backStim, PlaceLure0backStim);
    PlaceNonlure2backStim = setdiff(PlaceNonlure2backStim, PlaceLure2backStim);
    
    HappyNonlure2backStim = setdiff(HappyNonlure2backStim, HappyTarget2backStim);
    FearNonlure2backStim = setdiff(FearNonlure2backStim, FearTarget2backStim);
    NeutNonlure2backStim = setdiff(NeutNonlure2backStim, NeutTarget2backStim);
    PlaceNonlure2backStim = setdiff(PlaceNonlure2backStim, PlaceTarget2backStim);
catch
    
end
%% AnalyzeRECbehav
format longg

%initialize the csv output file
%fidREC = fopen(fullfile(outputDir,['EmoNback_RECBehaviorABCD_',datestr(now,'yyyymmdd'),'.csv']),'a');
fprintf(fidREC,'\n');

%clear these variables
ExperimentName = []; Subject = []; foo = []; SessionDate = [];

%Create variables listed above
%ExperimentName = RAW{3,1}(1:length(RAW{3,1}));
%Subject = RAW{3,30};
%Version = RAW{3,21};

foo = datestr(datenum(subDataREC{3,20}));       %matlab has trouble reading in dates...
if strcmp(foo(end),'1')
    foo2='2015';
else
    foo2='2016';
end
SessionDate = [foo(1:end-4) foo2];


%Run scripts to create remaining variables
calcRECBehav;

%Define variable type e.g. character, numeric, cell
%if numeric, specify digits to print
%{
for i = 1:length(condsREC);
    a = eval(condsREC{i});
    if ischar(a);
        outType = '%s';
    elseif isnumeric(a);
        outType = '%4.3f';
    elseif iscell(a)
        outType = '%s';
        a = cell2mat(a);
    end
    fprintf(fidREC, [outType ','], a);
end
fclose(fidREC);
%}
