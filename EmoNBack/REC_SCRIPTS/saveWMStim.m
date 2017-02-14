
WMHappyStim0back = []; WMHappyStim2back = [];
WMFearStim0back = []; WMFearStim2back = [];
WMNeutStim0back = []; WMNeutStim2back = [];
WMPlaceStim0back = []; WMPlaceStim2back = [];

HappyTargetStim = []; HappyLureStim = []; HappyNonlureStim = [];
FearTargetStim = []; FearLureStim = []; FearNonlureStim = [];
NeutTargetStim = []; NeutLureStim = []; NeutNonlureStim = [];
PlaceTargetStim = []; PlaceLureStim = []; PlaceNonlureStim = [];

%Block_WM = [];
%BlockType_WM = [];
%StimType_WM = [];
%Stimulus_WM = [];

for i = 1:length(Block_WM)
    if isempty(BlockType_WM{i})
        continue
    end
    if strcmpi(BlockType_WM{i}, '0-Back') || any(BlockType_WM{i} == 0)
        if strcmpi(StimType_WM{i}, 'PosFace')
            WMHappyStim0back{end+1} = Stimulus_WM{i};
        elseif strcmpi(StimType_WM{i}, 'NegFace')
            WMFearStim0back{end+1} = Stimulus_WM{i};
        elseif strcmpi(StimType_WM{i}, 'NeutFace')
            WMNeutStim0back{end+1} = Stimulus_WM{i};
        elseif strcmpi(StimType_WM{i}, 'Place')
            WMPlaceStim0back{end+1} = Stimulus_WM{i};
        end
    elseif strcmpi(BlockType_WM{i}, '2-Back') || any(BlockType_WM{i} == 2)
        if strcmpi(StimType_WM{i}, 'PosFace')
            WMHappyStim2back{end+1} = Stimulus_WM{i};
        elseif strcmpi(StimType_WM{i}, 'NegFace')
            WMFearStim2back{end+1} = Stimulus_WM{i};
        elseif strcmpi(StimType_WM{i}, 'NeutFace')
            WMNeutStim2back{end+1} = Stimulus_WM{i};
        elseif strcmpi(StimType_WM{i}, 'Place')
            WMPlaceStim2back{end+1} = Stimulus_WM{i};
        end
    end
end
%TargetType_WM = [];
for i = 1:length(Block_WM)
    if strcmpi(TargetType_WM{i}, 'target')
        if strcmpi(StimType_WM{i}, 'PosFace')
            HappyTargetStim{end+1} = Stimulus_WM{i};
        elseif strcmpi(StimType_WM{i}, 'NegFace')
            FearTargetStim{end+1} = Stimulus_WM{i};
        elseif strcmpi(StimType_WM{i}, 'NeutFace')
            NeutTargetStim{end+1} = Stimulus_WM{i};
        elseif strcmpi(StimType_WM{i}, 'Place')
            PlaceTargetStim{end+1} = Stimulus_WM{i};
        end
    elseif strcmpi(TargetType_WM{i}, 'lure')
        if strcmpi(StimType_WM{i}, 'PosFace')
            HappyLureStim{end+1} = Stimulus_WM{i};
        elseif strcmpi(StimType_WM{i}, 'NegFace')
            FearLureStim{end+1} = Stimulus_WM{i};
        elseif strcmpi(StimType_WM{i}, 'NeutFace')
            NeutLureStim{end+1} = Stimulus_WM{i};
        elseif strcmpi(StimType_WM{i}, 'Place')
            PlaceLureStim{end+1} = Stimulus_WM{i};
        end
    elseif strcmpi(TargetType_WM{i}, 'nonlure')
        if strcmpi(StimType_WM{i}, 'PosFace')
            HappyNonlureStim{end+1} = Stimulus_WM{i};
        elseif strcmpi(StimType_WM{i}, 'NegFace')
            FearNonlureStim{end+1} = Stimulus_WM{i};
        elseif strcmpi(StimType_WM{i}, 'NeutFace')
            NeutNonlureStim{end+1} = Stimulus_WM{i};
        elseif strcmpi(StimType_WM{i}, 'Place')
            PlaceNonlureStim{end+1} = Stimulus_WM{i};
        end
    end
end

try
    WMHappyStim0back = unique(WMHappyStim0back)'; WMHappyStim2back = unique(WMHappyStim2back)';
    WMFearStim0back = unique(WMFearStim0back)'; WMFearStim2back = unique(WMFearStim2back)';
    WMNeutStim0back = unique(WMNeutStim0back)'; WMNeutStim2back = unique(WMNeutStim2back)';
    WMPlaceStim0back = unique(WMPlaceStim0back)'; WMPlaceStim2back = unique(WMPlaceStim2back)';
    
    HappyTargetStim = unique(HappyTargetStim)'; HappyLureStim = unique(HappyLureStim)'; HappyNonlureStim = unique(HappyNonlureStim)';
    FearTargetStim = unique(FearTargetStim)'; FearLureStim = unique(FearLureStim)'; FearNonlureStim = unique(FearNonlureStim)';
    NeutTargetStim = unique(NeutTargetStim)'; NeutLureStim = unique(NeutLureStim)'; NeutNonlureStim = unique(NeutNonlureStim)';
    PlaceTargetStim = unique(PlaceTargetStim)'; PlaceLureStim = unique(PlaceLureStim)'; PlaceNonlureStim = unique(PlaceNonlureStim)';
    
    %{
    HappyLureStim = HappyLureStim(ismember(HappyLureStim,Stimulus_Block_REC));
    HappyNonlureStim = HappyNonlureStim(ismember(HappyNonlureStim,Stimulus_Block_REC));
    FearLureStim = FearLureStim(ismember(FearLureStim,Stimulus_Block_REC));
    FearNonlureStim = FearNonlureStim(ismember(FearNonlureStim,Stimulus_Block_REC));
    NeutLureStim = NeutLureStim(ismember(NeutLureStim,Stimulus_Block_REC));
    NeutNonlureStim = NeutNonlureStim(ismember(NeutNonlureStim,Stimulus_Block_REC));
    PlaceLureStim = PlaceLureStim(ismember(PlaceLureStim,Stimulus_Block_REC));
    PlaceNonlureStim = PlaceNonlureStim(ismember(PlaceNonlureStim,Stimulus_Block_REC));
    %
    
    % Avoid biasing results by from uneven trial nums across trial types
    HappyLureStim = HappyLureStim(randi(length(HappyLureStim),[length(HappyTargetStim),1]));
    HappyNonlureStim = HappyNonlureStim(randi(length(HappyNonlureStim),[length(HappyTargetStim),1]));
    FearLureStim = FearLureStim(randi(length(FearLureStim),[length(FearTargetStim),1]));
    FearNonlureStim = FearNonlureStim(randi(length(FearNonlureStim),[length(FearTargetStim),1]));
    NeutLureStim = NeutLureStim(randi(length(NeutLureStim),[length(NeutTargetStim),1]));
    NeutNonlureStim = NeutNonlureStim(randi(length(NeutNonlureStim),[length(NeutTargetStim),1]));
    PlaceLureStim = PlaceLureStim(randi(length(PlaceLureStim),[length(PlaceTargetStim),1]));
    PlaceNonlureStim = PlaceNonlureStim(randi(length(PlaceNonlureStim),[length(PlaceTargetStim),1]));
    %}
    
    %{
    HappyLureStim = HappyLureStim(randperm(length(HappyLureStim),length(HappyTargetStim)));
    HappyNonlureStim = HappyNonlureStim(randperm(length(HappyNonlureStim),length(HappyTargetStim)));
    FearLureStim = FearLureStim(randperm(length(FearLureStim),length(FearTargetStim)));
    FearNonlureStim = FearNonlureStim(randperm(length(FearNonlureStim),length(FearTargetStim)));
    NeutLureStim = NeutLureStim(randperm(length(NeutLureStim),length(NeutTargetStim)));
    NeutNonlureStim = NeutNonlureStim(randperm(length(NeutNonlureStim),length(NeutTargetStim)));
    PlaceLureStim = PlaceLureStim(randperm(length(PlaceLureStim),length(PlaceTargetStim)));
    PlaceNonlureStim = PlaceNonlureStim(randperm(length(PlaceNonlureStim),length(PlaceTargetStim)));
    %}
end
%}

