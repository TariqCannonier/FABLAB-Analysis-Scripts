format longg

%initiate/clear variables
HappyBlocks_RT = []; HappyBlocks_ACC = []; HappyBlocksRTvec = []; HappyBlocksACCvec = [];
FearBlocks_RT = []; FearBlocks_ACC = []; FearBlocksRTvec = []; FearBlocksACCvec = [];
NeutBlocks_RT = []; NeutBlocks_ACC = []; NeutBlocksRTvec = []; NeutBlocksACCvec = [];
PlaceBlocks_RT = []; PlaceBlocks_ACC = []; PlaceBlocksRTvec = []; PlaceBlocksACCvec = [];

Happy0back_RT = []; Happy0back_ACC = []; Happy0backRTvec = []; Happy0backACCvec = [];
Fear0back_RT = []; Fear0back_ACC = []; Fear0backRTvec = []; Fear0backACCvec = [];
Neut0back_RT = []; Neut0back_ACC = []; Neut0backRTvec = []; Neut0backACCvec = [];
Place0back_RT = []; Place0back_ACC = []; Place0backRTvec = []; Place0backACCvec = [];

Happy2back_RT = []; Happy2back_ACC = []; Happy2backRTvec = []; Happy2backACCvec = [];
Fear2back_RT = []; Fear2back_ACC = []; Fear2backRTvec = []; Fear2backACCvec = [];
Neut2back_RT = []; Neut2back_ACC = []; Neut2backRTvec = []; Neut2backACCvec = [];
Place2back_RT = []; Place2back_ACC = []; Place2backRTvec = []; Place2backACCvec = [];

run1HappyBlocks_RT = []; run1HappyBlocks_ACC = []; run1HappyBlocksRTvec = []; run1HappyBlocksACCvec = [];
run1FearBlocks_RT = []; run1FearBlocks_ACC = []; run1FearBlocksRTvec = []; run1FearBlocksACCvec = [];
run1NeutBlocks_RT = []; run1NeutBlocks_ACC = []; run1NeutBlocksRTvec = []; run1NeutBlocksACCvec = [];
run1PlaceBlocks_RT = []; run1PlaceBlocks_ACC = []; run1PlaceBlocksRTvec = []; run1PlaceBlocksACCvec = [];

run1Happy0back_RT = []; run1Happy0back_ACC = []; run1Happy0backRTvec = []; run1Happy0backACCvec = [];
run1Fear0back_RT = []; run1Fear0back_ACC = []; run1Fear0backRTvec = []; run1Fear0backACCvec = [];
run1Neut0back_RT = []; run1Neut0back_ACC = []; run1Neut0backRTvec = []; run1Neut0backACCvec = [];
run1Place0back_RT = []; run1Place0back_ACC = []; run1Place0backRTvec = []; run1Place0backACCvec = [];

run1Happy2back_RT = []; run1Happy2back_ACC = []; run1Happy2backRTvec = []; run1Happy2backACCvec = [];
run1Fear2back_RT = []; run1Fear2back_ACC = []; run1Fear2backRTvec = []; run1Fear2backACCvec = [];
run1Neut2back_RT = []; run1Neut2back_ACC = []; run1Neut2backRTvec = []; run1Neut2backACCvec = [];
run1Place2back_RT = []; run1Place2back_ACC = []; run1Place2backRTvec = []; run1Place2backACCvec = [];

run2HappyBlocks_RT = []; run2HappyBlocks_ACC = []; run2HappyBlocksRTvec = []; run2HappyBlocksACCvec = [];
run2FearBlocks_RT = []; run2FearBlocks_ACC = []; run2FearBlocksRTvec = []; run2FearBlocksACCvec = [];
run2NeutBlocks_RT = []; run2NeutBlocks_ACC = []; run2NeutBlocksRTvec = []; run2NeutBlocksACCvec = [];
run2PlaceBlocks_RT = []; run2PlaceBlocks_ACC = []; run2PlaceBlocksRTvec = []; run2PlaceBlocksACCvec = [];

run2Happy0back_RT = []; run2Happy0back_ACC = []; run2Happy0backRTvec = []; run2Happy0backACCvec = [];
run2Fear0back_RT = []; run2Fear0back_ACC = []; run2Fear0backRTvec = []; run2Fear0backACCvec = [];
run2Neut0back_RT = []; run2Neut0back_ACC = []; run2Neut0backRTvec = []; run2Neut0backACCvec = [];
run2Place0back_RT = []; run2Place0back_ACC = []; run2Place0backRTvec = []; run2Place0backACCvec = [];

run2Happy2back_RT = []; run2Happy2back_ACC = []; run2Happy2backRTvec = []; run2Happy2backACCvec = [];
run2Fear2back_RT = []; run2Fear2back_ACC = []; run2Fear2backRTvec = []; run2Fear2backACCvec = [];
run2Neut2back_RT = []; run2Neut2back_ACC = []; run2Neut2backRTvec = []; run2Neut2backACCvec = [];
run2Place2back_RT = []; run2Place2back_ACC = []; run2Place2backRTvec = []; run2Place2backACCvec = [];

Overall_RT = []; Overall_ACC = []; Overall0back_RT = []; Overall0back_ACC = [];
Overall2back_RT = []; Overall2back_ACC = []; run1Overall_RT = []; run1Overall_ACC = [];
run2Overall_RT = []; run2Overall_ACC = []; Nonlure_ACC = []; Lure_ACC =[]; Target_ACC = [];
HappynonlureACCvec = []; HappylureACCvec = []; HappytargetACCvec = [];
FearnonlureACCvec = []; FearlureACCvec = []; FeartargetACCvec = [];
NeutnonlureACCvec = []; NeutlureACCvec = []; NeuttargetACCvec = [];
PlacenonlureACCvec = []; PlacelureACCvec = []; PlacetargetACCvec = [];


%Create vectors with revelant values to calculate RT + ACC
%Across both runs
Stim_ACC_Convert = Stim_ACC_WM;
Stim_RT_Convert = Stim_RT_WM;
Stim_ACC_WM = [];
Stim_RT_WM = [];
for i = 1:length(Block_WM)
    try
        Stim_ACC_WM(i) = str2double(Stim_ACC_Convert{i});%str2double(Stim_ACC_Convert{i});
        Stim_RT_WM(i) = str2double(Stim_RT_Convert{i});
    catch
        try
            Stim_ACC_WM(i) = Stim_ACC_Convert(i); % Data is sometimes in cell or array
            Stim_RT_WM(i) = Stim_RT_Convert(i); % Data is sometimes in cell or array
        catch
            if eSite(1).site == 1 % Initiate error counting
                eSite(eSite_count).site = Site;
                eSite(eSite_count).ID{eID_count} = ID;
                eSite(eSite_count).ID{eID_count}.Task = 'WM';
                eSite(eSite_count).part(eID_count).eTask(1) = {'WM'};
                eID_count = eID_count+1;
            elseif strcmp(eSite(end).site,Site) % error count; log ID within site
                %eSite(eSite_count).site = Site;
                eSite(eSite_count).ID{eID_count} = ID;
                eSite(eSite_count).part(eID_count).eTask(1) = {'WM'};
                eID_count = eID_count+1;
            else % error count; initiate log within new
                eSite_count = eSite_count+1;
                eSite(eSite_count).site = Site;
                eSite(eSite_count).ID{eID_count} = ID;
                eSite(eSite_count).part(eID_count).eTask(1) = {'WM'};
                eID_count = eID_count+1;
            end
            continue;
        end
    end
    
    % Sort Positive faces into 0/2-Back and Targets, Lures, and Nonlures
    if strcmpi(StimType_WM{i}, 'PosFace')             %Pull only from Happy Face Blocks
        if Stim_ACC_WM(i) == 1                        %Pull from ALL Happy Face Blocks
            HappyBlocksRTvec(end+1) = Stim_RT_WM(i);   %Create a vector of RTs for correct trials
        end
        if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
            HappyBlocksACCvec(end+1) = Stim_ACC_WM(i); %Create a vector of accuracy for all trials
        end
        if strcmpi(BlockType_WM{i}, '0-Back')              %Pull from ONLY 0-back Happy Face block
            if Stim_ACC_WM(i) == 1
                Happy0backRTvec(end+1) = Stim_RT_WM(i);    %Create a vector of RTs for correct trials
            end
            if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                Happy0backACCvec(end+1) = Stim_ACC_WM(i);  %Create a vector of accuracy for all trials
            end
        end
        if strcmpi(BlockType_WM{i}, '2-Back')          %Pull from ONLY 2-back Happy Face Block
            if Stim_ACC_WM(i) == 1
                Happy2backRTvec(end+1) = Stim_RT_WM(i);    %Create a vector of RTs for correct trials
            end
            if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                Happy2backACCvec(end+1) = Stim_ACC_WM(i);  %Create a vector of accuracy for all trials
            end
        end
        if strcmpi(TargetType_WM{i}, 'nonlure')                %Pull nonlure trials
            if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1          %Irrespective of accuracy
                HappynonlureACCvec(end+1) = Stim_ACC_WM(i);    %Place in Happy nonlure accuracy vector
            end
        elseif strcmpi(TargetType_WM{i}, 'lure')               %Pull lure trials
            if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1          %Irrespective of accuracy
                HappylureACCvec(end+1) = Stim_ACC_WM(i);       %Place in Happy lure accuracy vector
            end
        elseif strcmpi(TargetType_WM{i}, 'target')             %Pull target trials
            if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1          %Irrespective of accuracy
                HappytargetACCvec(end+1) = Stim_ACC_WM(i);     %Place in Happy target accuracy vector
            end
        end
        
    % Sort Negative faces into 0/2-Back and Targets, Lures, and Nonlures
    elseif strcmpi(StimType_WM{i}, 'NegFace')          %Pull only from Fear Face Blocks
        if Stim_ACC_WM(i) == 1                         %Pull from ALL Fear Face Blocks
            FearBlocksRTvec(end+1) = Stim_RT_WM(i);    %Create a vector of RTs for correct trials
        end
        if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
            FearBlocksACCvec(end+1) = Stim_ACC_WM(i);  %Create a vector of accuracy for all trials
        end
        if strcmpi(BlockType_WM{i}, '0-Back')             %Pull from ONLY 0-back Fear Face block
            if Stim_ACC_WM(i) == 1
                Fear0backRTvec(end+1) = Stim_RT_WM(i);     %Create a vector of RTs for correct trials
            end
            if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                Fear0backACCvec(end+1) = Stim_ACC_WM(i);   %Create a vector of accuracy for all trials
            end
        end
        if strcmpi(BlockType_WM{i}, '2-Back')          %Pull from ONLY 2-back Fear Face block
            if Stim_ACC_WM(i) == 1
                Fear2backRTvec(end+1) = Stim_RT_WM(i);     %Create a vector of RTs for correct trials
            end
            if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                Fear2backACCvec(end+1) = Stim_ACC_WM(i);   %Create a vector or accuracy for all trials
            end
        end
        if strcmpi(TargetType_WM{i}, 'nonlure')                %Pull nonlure trials
            if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1         %Irrespective of accuracy
                FearnonlureACCvec(end+1) = Stim_ACC_WM(i);     %Place in Fear nonlure accuracy vector
            end
        elseif strcmpi(TargetType_WM{i}, 'lure')               %Pull lure trials
            if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1          %Irrespective of accuracy
                FearlureACCvec(end+1) = Stim_ACC_WM(i);        %Place in Fear lure accuracy vector
            end
        elseif strcmpi(TargetType_WM{i}, 'target')            %Pull target trials
            if Stim_ACC_WM(i) == 0 | Stim_ACC_WM(i) == 1         %Irrespective of accuracy
                FeartargetACCvec(end+1) = Stim_ACC_WM(i);      %Place in Fear target accuracy vector
            end
        end
        
    % Sort Neutral faces into 0/2-Back and Targets, Lures, and Nonlures
    elseif strcmpi(StimType_WM{i}, 'NeutFace')        %Pull only from Neutral Face Blocks
        if Stim_ACC_WM(i) == 1                        %Pull from ALL Neutral Face Blocks
            NeutBlocksRTvec(end+1) = Stim_RT_WM(i);    %Create a vector of RTs for correct trials
        end
        if Stim_ACC_WM(i) == 0 | Stim_ACC_WM(i) == 1
            NeutBlocksACCvec(end+1) = Stim_ACC_WM(i);  %Create a vector of accuracy for all trials
        end
        if strcmpi(BlockType_WM{i}, '0-Back')             %Pull from ONLY 0-back Neutral Face block
            if Stim_ACC_WM(i) == 1
                Neut0backRTvec(end+1) = Stim_RT_WM(i);     %Create a vector of RTs for correct trials
            end
            if Stim_ACC_WM(i) == 0 | Stim_ACC_WM(i) == 1
                Neut0backACCvec(end+1) = Stim_ACC_WM(i);   %Create a vector of accuracy for all trials
            end
        end
        if strcmpi(BlockType_WM{i}, '2-Back')         %Pull from ONLY 2-back Neutral Face block
            if Stim_ACC_WM(i) == 1
                Neut2backRTvec(end+1) = Stim_RT_WM(i);     %Create a vector of RTs for correct trials
            end
            if Stim_ACC_WM(i) == 0 | Stim_ACC_WM(i) == 1
                Neut2backACCvec(end+1) = Stim_ACC_WM(i);   %Create a vector of accuracy for all trials
            end
        end
        if strcmpi(TargetType_WM{i}, 'nonlure')               %Pull nonlure trials
            if Stim_ACC_WM(i) == 0 | Stim_ACC_WM(i) == 1         %Irrespective of accuracy
                NeutnonlureACCvec(end+1) = Stim_ACC_WM(i);     %Place in neutral nonlure accuracy vector
            end
        elseif strcmpi(TargetType_WM{i}, 'lure')              %Pull lure trials
            if Stim_ACC_WM(i) == 0 | Stim_ACC_WM(i) == 1         %Irrespective of accuracy
                NeutlureACCvec(end+1) = Stim_ACC_WM(i);        %Place in neutral lure accuracy vector
            end
        elseif strcmpi(TargetType_WM{i}, 'target')            %Pull target trials
            if Stim_ACC_WM(i) == 0 | Stim_ACC_WM(i) == 1         %Irrespective of accuracy
                NeuttargetACCvec(end+1) = Stim_ACC_WM(i);      %Place in neutral target accuracy vector
            end
        end
        
    % Sort Places into 0/2-Back and Targets, Lures, and Nonlures
    elseif strcmpi(StimType_WM{i}, 'Place')           %Pull only from Place blocks
        if Stim_ACC_WM(i) == 1                        %Pull from ALL Place blocks
            PlaceBlocksRTvec(end+1) = Stim_RT_WM(i);   %Create a vector of RTs for correct trials
        end
        if Stim_ACC_WM(i) == 0 | Stim_ACC_WM(i) == 1
            PlaceBlocksACCvec(end+1) = Stim_ACC_WM(i); %Create a vector of acuracy for all trials
        end
        if strcmpi(BlockType_WM{i}, '0-Back')             %Pull from ONLY 0-back Place block
            if Stim_ACC_WM(i) == 1
                Place0backRTvec(end+1) = Stim_RT_WM(i);    %Create a vector of RTs for correct trials
            end
            if Stim_ACC_WM(i) == 0 | Stim_ACC_WM(i) == 1
                Place0backACCvec(end+1) = Stim_ACC_WM(i);  %Create a vector of accuracy for all trials
            end
        end
        if strcmpi(BlockType_WM{i}, '2-Back')         %Pull from ONLY 2-back Place block
            if Stim_ACC_WM(i) == 1
                Place2backRTvec(end+1) = Stim_RT_WM(i);    %Create a vector of RTs for correct trials
            end
            if Stim_ACC_WM(i) == 0 | Stim_ACC_WM(i) == 1
                Place2backACCvec(end+1) = Stim_ACC_WM(i);  %Create a vector of accuracy for all trials
            end
        end
        if strcmpi(TargetType_WM{i}, 'nonlure')                %Pull nonlure trials
            if Stim_ACC_WM(i) == 0 | Stim_ACC_WM(i) == 1          %Irrespective of accuracy
                PlacenonlureACCvec(end+1) = Stim_ACC_WM(i);    %Place in place nonlure accuracy vector
            end
        elseif strcmpi(TargetType_WM{i}, 'lure')               %Pull lure trials
            if Stim_ACC_WM(i) == 0 | Stim_ACC_WM(i) == 1          %Irrespective of accuracy
                PlacelureACCvec(end+1) = Stim_ACC_WM(i);       %Place in placelure accuracy vector
            end
        elseif strcmpi(TargetType_WM{i}, 'target')             %Pull target trials
            if Stim_ACC_WM(i) == 0 | Stim_ACC_WM(i) == 1          %Irrespective of accuracy
                PlacetargetACCvec(end+1) = Stim_ACC_WM(i);     %Place in place target accuracy vector
            end
        end
    end
end

%Create vectors with revelant values to calculate RT + ACC
%Across by run
for i = 1:length(Block_WM)
    try
        Stim_ACC_WM(i) = str2double(Stim_ACC_Convert{i});%str2double(Stim_ACC_Convert{i});
        Stim_RT_WM(i) = str2double(Stim_RT_Convert{i});
    catch
        try
            Stim_ACC_WM(i) = Stim_ACC_Convert(i); % Data is sometimes in cell or array
            Stim_ACC_WM(i) = Stim_RT_Convert(i); % Data is sometimes in cell or array
        catch
            if eSite(1).site == 1 % Initiate error counting
                eSite(eSite_count).site = Site;
                eSite(eSite_count).ID{eID_count} = ID;
                eSite(eSite_count).part(eID_count).eTask(1) = {'WM'};
                eID_count = eID_count+1;
            elseif strcmp(eSite(end).site,Site) % error count; log ID within site
                %eSite(eSite_count).site = Site;
                eSite(eSite_count).ID{eID_count} = ID;
                eSite(eSite_count).part(eID_count).eTask(1) = {'WM'};
                eID_count = eID_count+1;
            else % error count; initiate log within new
                eSite_count = eSite_count+1;
                eSite(eSite_count).site = Site;
                eSite(eSite_count).ID{eID_count} = ID;
                eSite(eSite_count).part(eID_count).eTask(1) = {'WM'};
                eID_count = eID_count+1;
            end
            continue;
        end
    end
    
    % Sort by Positive 0/2-Back Faces and Places into Run1 
    if Block_WM{i} < 94
        if strcmpi(StimType_WM{i}, 'PosFace')             %Pull only from Happy Face Blocks
            if Stim_ACC_WM(i) == 1                        %Pull from ALL Happy Face Blocks
                run1HappyBlocksRTvec(end+1) = Stim_RT_WM(i);   %Create a vector of RTs for correct trials
            end
            if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                run1HappyBlocksACCvec(end+1) = Stim_ACC_WM(i); %Create a vector of accuracy for all trials
            end
            if strcmpi(BlockType_WM{i}, '0-Back')             %Pull from ONLY 0-back Happy Face block
                if Stim_ACC_WM(i) == 1
                    run1Happy0backRTvec(end+1) = Stim_RT_WM(i);    %Create a vector of RTs for correct trials
                end
                if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                    run1Happy0backACCvec(end+1) = Stim_ACC_WM(i);  %Create a vector of accuracy for all trials
                end
            end
            if strcmpi(BlockType_WM{i}, '2-Back')         %Pull from ONLY 2-back Happy Face Block
                if Stim_ACC_WM(i) == 1
                    run1Happy2backRTvec(end+1) = Stim_RT_WM(i);    %Create a vector of RTs for correct trials
                end
                if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                    run1Happy2backACCvec(end+1) = Stim_ACC_WM(i);  %Create a vector of accuracy for all trials
                end
            end
        elseif strcmpi(StimType_WM{i}, 'NegFace')         %Pull only from Fear Face Blocks
            if Stim_ACC_WM(i) == 1                        %Pull from ALL Fear Face Blocks
                run1FearBlocksRTvec(end+1) = Stim_RT_WM(i);    %Create a vector of RTs for correct trials
            end
            if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                run1FearBlocksACCvec(end+1) = Stim_ACC_WM(i);  %Create a vector of accuracy for all trials
            end
            if strcmpi(BlockType_WM{i}, '0-Back')             %Pull from ONLY 0-back Fear Face block
                if Stim_ACC_WM(i) == 1
                    run1Fear0backRTvec(end+1) = Stim_RT_WM(i);     %Create a vector of RTs for correct trials
                end
                if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                    run1Fear0backACCvec(end+1) = Stim_ACC_WM(i);   %Create a vector of accuracy for all trials
                end
            end
            if strcmpi(BlockType_WM{i}, '2-Back')         %Pull from ONLY 2-back Fear Face block
                if Stim_ACC_WM(i) == 1
                    run1Fear2backRTvec(end+1) = Stim_RT_WM(i);     %Create a vector of RTs for correct trials
                end
                if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                    run1Fear2backACCvec(end+1) = Stim_ACC_WM(i);   %Create a vector or accuracy for all trials
                end
            end
        elseif strcmpi(StimType_WM{i}, 'NeutFace')        %Pull only from Neutral Face Blocks
            if Stim_ACC_WM(i) == 1                        %Pull from ALL Neutral Face Blocks
                run1NeutBlocksRTvec(end+1) = Stim_RT_WM(i);    %Create a vector of RTs for correct trials
            end
            if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                run1NeutBlocksACCvec(end+1) = Stim_ACC_WM(i);  %Create a vector of accuracy for all trials
            end
            if strcmpi(BlockType_WM{i}, '0-Back')             %Pull from ONLY 0-back Neutral Face block
                if Stim_ACC_WM(i) == 1
                    run1Neut0backRTvec(end+1) = Stim_RT_WM(i);     %Create a vector of RTs for correct trials
                end
                if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                    run1Neut0backACCvec(end+1) = Stim_ACC_WM(i);   %Create a vector of accuracy for all trials
                end
            end
            if strcmpi(BlockType_WM{i}, '2-Back')         %Pull from ONLY 2-back Neutral Face block
                if Stim_ACC_WM(i) == 1
                    run1Neut2backRTvec(end+1) = Stim_RT_WM(i);     %Create a vector of RTs for correct trials
                end
                if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                    run1Neut2backACCvec(end+1) = Stim_ACC_WM(i);   %Create a vector of accuracy for all trials
                end
            end
        elseif strcmpi(StimType_WM{i}, 'Place')           %Pull only from Place blocks
            if Stim_ACC_WM(i) == 1                        %Pull from ALL Place blocks
                run1PlaceBlocksRTvec(end+1) = Stim_RT_WM(i);   %Create a vector of RTs for correct trials
            end
            if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                run1PlaceBlocksACCvec(end+1) = Stim_ACC_WM(i); %Create a vector of acuracy for all trials
            end
            if strcmpi(BlockType_WM{i}, '0-Back')              %Pull from ONLY 0-back Place block
                if Stim_ACC_WM(i) == 1
                    run1Place0backRTvec(end+1) = Stim_RT_WM(i);    %Create a vector of RTs for correct trials
                end
                if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                    run1Place0backACCvec(end+1) = Stim_ACC_WM(i);  %Create a vector of accuracy for all trials
                end
            end
            if strcmpi(BlockType_WM{i}, '2-Back')         %Pull from ONLY 2-back Place block
                if Stim_ACC_WM(i) == 1
                    run1Place2backRTvec(end+1) = Stim_RT_WM(i);    %Create a vector of RTs for correct trials
                end
                if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                    run1Place2backACCvec(end+1) = Stim_ACC_WM(i);  %Create a vector of accuracy for all trials
                end
            end
        end
    end
    
    % Sort by Positive 0/2-Back Faces and Places into Run2
    if Block_WM{i} > 94
        if strcmpi(StimType_WM{i}, 'PosFace')             %Pull only from Happy Face Blocks
            if Stim_ACC_WM(i) == 1                        %Pull from ALL Happy Face Blocks
                run2HappyBlocksRTvec(end+1) = Stim_RT_WM(i);   %Create a vector of RTs for correct trials
            end
            if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                run2HappyBlocksACCvec(end+1) = Stim_ACC_WM(i); %Create a vector of accuracy for all trials
            end
            if strcmpi(BlockType_WM{i}, '0-Back')             %Pull from ONLY 0-back Happy Face block
                if Stim_ACC_WM(i) == 1
                    run2Happy0backRTvec(end+1) = Stim_RT_WM(i);    %Create a vector of RTs for correct trials
                end
                if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                    run2Happy0backACCvec(end+1) = Stim_ACC_WM(i);  %Create a vector of accuracy for all trials
                end
            end
            if strcmpi(BlockType_WM{i}, '2-Back')         %Pull from ONLY 2-back Happy Face Block
                if Stim_ACC_WM(i) == 1
                    run2Happy2backRTvec(end+1) = Stim_RT_WM(i);    %Create a vector of RTs for correct trials
                end
                if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                    run2Happy2backACCvec(end+1) = Stim_ACC_WM(i);  %Create a vector of accuracy for all trials
                end
            end
        elseif strcmpi(StimType_WM{i}, 'NegFace')         %Pull only from Fear Face Blocks
            if Stim_ACC_WM(i) == 1                        %Pull from ALL Fear Face Blocks
                run2FearBlocksRTvec(end+1) = Stim_RT_WM(i);    %Create a vector of RTs for correct trials
            end
            if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                run2FearBlocksACCvec(end+1) = Stim_ACC_WM(i);  %Create a vector of accuracy for all trials
            end
            if strcmpi(BlockType_WM{i}, '0-Back')             %Pull from ONLY 0-back Fear Face block
                if Stim_ACC_WM(i) == 1
                    run2Fear0backRTvec(end+1) = Stim_RT_WM(i);     %Create a vector of RTs for correct trials
                end
                if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                    run2Fear0backACCvec(end+1) = Stim_ACC_WM(i);   %Create a vector of accuracy for all trials
                end
            end
            if strcmpi(BlockType_WM{i}, '2-Back')         %Pull from ONLY 2-back Fear Face block
                if Stim_ACC_WM(i) == 1
                    run2Fear2backRTvec(end+1) = Stim_RT_WM(i);     %Create a vector of RTs for correct trials
                end
                if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                    run2Fear2backACCvec(end+1) = Stim_ACC_WM(i);   %Create a vector or accuracy for all trials
                end
            end
        elseif strcmpi(StimType_WM{i}, 'NeutFace')        %Pull only from Neutral Face Blocks
            if Stim_ACC_WM(i) == 1                        %Pull from ALL Neutral Face Blocks
                run2NeutBlocksRTvec(end+1) = Stim_RT_WM(i);    %Create a vector of RTs for correct trials
            end
            if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                run2NeutBlocksACCvec(end+1) = Stim_ACC_WM(i);  %Create a vector of accuracy for all trials
            end
            if strcmpi(BlockType_WM{i}, '0-Back')             %Pull from ONLY 0-back Neutral Face block
                if Stim_ACC_WM(i) == 1
                    run2Neut0backRTvec(end+1) = Stim_RT_WM(i);     %Create a vector of RTs for correct trials
                end
                if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                    run2Neut0backACCvec(end+1) = Stim_ACC_WM(i);   %Create a vector of accuracy for all trials
                end
            end
            if strcmpi(BlockType_WM{i}, '2-Back')         %Pull from ONLY 2-back Neutral Face block
                if Stim_ACC_WM(i) == 1
                    run2Neut2backRTvec(end+1) = Stim_RT_WM(i);     %Create a vector of RTs for correct trials
                end
                if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                    run2Neut2backACCvec(end+1) = Stim_ACC_WM(i);   %Create a vector of accuracy for all trials
                end
            end
        elseif strcmpi(StimType_WM{i}, 'Place')           %Pull only from Place blocks
            if Stim_ACC_WM(i) == 1                        %Pull from ALL Place blocks
                run2PlaceBlocksRTvec(end+1) = Stim_RT_WM(i);   %Create a vector of RTs for correct trials
            end
            if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                run2PlaceBlocksACCvec(end+1) = Stim_ACC_WM(i); %Create a vector of acuracy for all trials
            end
            if strcmpi(BlockType_WM{i}, '0-Back')             %Pull from ONLY 0-back Place block
                if Stim_ACC_WM(i) == 1
                    run2Place0backRTvec(end+1) = Stim_RT_WM(i);    %Create a vector of RTs for correct trials
                end
                if Stim_ACC_WM(i) == 0 || Stim_ACC_WM(i) == 1
                    run2Place0backACCvec(end+1) = Stim_ACC_WM(i);  %Create a vector of accuracy for all trials
                end
            end
            if strcmpi(BlockType_WM{i}, '2-Back')         %Pull from ONLY 2-back Place block
                if Stim_ACC_WM(i) == 1
                    run2Place2backRTvec(end+1) = Stim_RT_WM(i);    %Create a vector of RTs for correct trials
                end
                if Stim_ACC_WM(i) == 0 | Stim_ACC_WM(i) == 1
                    run2Place2backACCvec(end+1) = Stim_ACC_WM(i);  %Create a vector of accuracy for all trials
                end
            end
            %{
        else
            
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
            continue;
            %}
        end
    end
end

%Calculate overall averages
Overall_RT = mean(horzcat(HappyBlocksRTvec,FearBlocksRTvec,NeutBlocksRTvec,PlaceBlocksRTvec));
Overall_ACC = mean(horzcat(HappyBlocksACCvec,FearBlocksACCvec,NeutBlocksACCvec,PlaceBlocksACCvec));
Overall0back_RT = mean(horzcat(Happy0backRTvec,Fear0backRTvec,Neut0backRTvec,Place0backRTvec));
Overall0back_ACC = mean(horzcat(Happy0backACCvec,Fear0backACCvec,Neut0backACCvec,Place0backACCvec));
Overall2back_RT = mean(horzcat(Happy2backRTvec,Fear2backRTvec,Neut2backRTvec,Place2backRTvec));
Overall2back_ACC = mean(horzcat(Happy2backACCvec,Fear2backACCvec,Neut2backACCvec,Place2backACCvec));
run1Overall_RT = mean(horzcat(run1HappyBlocksRTvec,run1FearBlocksRTvec,run1NeutBlocksRTvec,run1PlaceBlocksRTvec));
run1Overall_ACC = mean(horzcat(run1HappyBlocksACCvec,run1FearBlocksACCvec,run1NeutBlocksACCvec,run1PlaceBlocksACCvec));
run2Overall_RT = mean(horzcat(run2HappyBlocksRTvec,run2FearBlocksRTvec,run2NeutBlocksRTvec,run2PlaceBlocksRTvec));
run2Overall_ACC = mean(horzcat(run2HappyBlocksACCvec,run2FearBlocksACCvec,run2NeutBlocksACCvec,run2PlaceBlocksACCvec));

%Calculate averages by condition across both runs
HappyBlocks_RT = mean(HappyBlocksRTvec); Happy0back_RT = mean(Happy0backRTvec); Happy2back_RT = mean(Happy2backRTvec);
HappyBlocks_ACC = mean(HappyBlocksACCvec); Happy0back_ACC = mean(Happy0backACCvec); Happy2back_ACC = mean(Happy2backACCvec);

FearBlocks_RT = mean(FearBlocksRTvec); Fear0back_RT = mean(Fear0backRTvec); Fear2back_RT = mean(Fear2backRTvec);
FearBlocks_ACC = mean(FearBlocksACCvec); Fear0back_ACC = mean(Fear0backACCvec); Fear2back_ACC = mean(Fear2backACCvec);

NeutBlocks_RT = mean(NeutBlocksRTvec); Neut0back_RT = mean(Neut0backRTvec); Neut2back_RT = mean(Neut2backRTvec);
NeutBlocks_ACC = mean(NeutBlocksACCvec); Neut0back_ACC = mean(Neut0backACCvec); Neut2back_ACC = mean(Neut2backACCvec);

PlaceBlocks_RT = mean(PlaceBlocksRTvec); Place0back_RT = mean(Place0backRTvec); Place2back_RT = mean(Place2backRTvec);
PlaceBlocks_ACC = mean(PlaceBlocksACCvec); Place0back_ACC = mean(Place0backACCvec); Place2back_ACC = mean(Place2backACCvec);

%Calculate averages by condition across for run1
run1HappyBlocks_RT = mean(run1HappyBlocksRTvec); run1Happy0back_RT = mean(run1Happy0backRTvec); run1Happy2back_RT = mean(run1Happy2backRTvec);
run1HappyBlocks_ACC = mean(run1HappyBlocksACCvec); run1Happy0back_ACC = mean(run1Happy0backACCvec); run1Happy2back_ACC = mean(run1Happy2backACCvec);

run1FearBlocks_RT = mean(run1FearBlocksRTvec); run1Fear0back_RT = mean(run1Fear0backRTvec); run1Fear2back_RT = mean(run1Fear2backRTvec);
run1FearBlocks_ACC = mean(run1FearBlocksACCvec); run1Fear0back_ACC = mean(run1Fear0backACCvec); run1Fear2back_ACC = mean(run1Fear2backACCvec);

run1NeutBlocks_RT = mean(run1NeutBlocksRTvec); run1Neut0back_RT = mean(run1Neut0backRTvec); run1Neut2back_RT = mean(run1Neut2backRTvec);
run1NeutBlocks_ACC = mean(run1NeutBlocksACCvec); run1Neut0back_ACC = mean(run1Neut0backACCvec); run1Neut2back_ACC = mean(run1Neut2backACCvec);

run1PlaceBlocks_RT = mean(run1PlaceBlocksRTvec); run1Place0back_RT = mean(run1Place0backRTvec); run1Place2back_RT = mean(run1Place2backRTvec);
run1PlaceBlocks_ACC = mean(run1PlaceBlocksACCvec); run1Place0back_ACC = mean(run1Place0backACCvec); run1Place2back_ACC = mean(run1Place2backACCvec);

%Calculate averages by condition across for run2
run2HappyBlocks_RT = mean(run2HappyBlocksRTvec); run2Happy0back_RT = mean(run2Happy0backRTvec); run2Happy2back_RT = mean(run2Happy2backRTvec);
run2HappyBlocks_ACC = mean(run2HappyBlocksACCvec); run2Happy0back_ACC = mean(run2Happy0backACCvec); run2Happy2back_ACC = mean(run2Happy2backACCvec);

run2FearBlocks_RT = mean(run2FearBlocksRTvec); run2Fear0back_RT = mean(run2Fear0backRTvec); run2Fear2back_RT = mean(run2Fear2backRTvec);
run2FearBlocks_ACC = mean(run2FearBlocksACCvec); run2Fear0back_ACC = mean(run2Fear0backACCvec); run2Fear2back_ACC = mean(run2Fear2backACCvec);

run2NeutBlocks_RT = mean(run2NeutBlocksRTvec); run2Neut0back_RT = mean(run2Neut0backRTvec); run2Neut2back_RT = mean(run2Neut2backRTvec);
run2NeutBlocks_ACC = mean(run2NeutBlocksACCvec); run2Neut0back_ACC = mean(run2Neut0backACCvec); run2Neut2back_ACC = mean(run2Neut2backACCvec);

run2PlaceBlocks_RT = mean(run2PlaceBlocksRTvec); run2Place0back_RT = mean(run2Place0backRTvec); run2Place2back_RT = mean(run2Place2backRTvec);
run2PlaceBlocks_ACC = mean(run2PlaceBlocksACCvec); run2Place0back_ACC = mean(run2Place0backACCvec); run2Place2back_ACC = mean(run2Place2backACCvec);

% Create Hit Rates for Emotion across Target, Lure, and Nonlures
HappyTargetHR = mean(HappytargetACCvec);
HappyLureFA = mean(HappylureACCvec);
HappyNonlureFA = mean(HappynonlureACCvec);
%HappyLureFA = mean(1-HappylureACCvec);
%HappyNonlureFA = mean(1-HappynonlureACCvec);
FearTargetHR = mean(FeartargetACCvec);
FearLureFA = mean(FearlureACCvec);
FearNonlureFA = mean(FearnonlureACCvec);
%FearLureFA = mean(1-FearlureACCvec);
%FearNonlureFA = mean(1-FearnonlureACCvec);
NeutTargetHR = mean(NeuttargetACCvec);
NeutLureFA = mean(NeutlureACCvec);
NeutNonlureFA = mean(NeutnonlureACCvec);
%NeutLureFA = mean(1-NeutlureACCvec);
%NeutNonlureFA = mean(1-NeutnonlureACCvec);
PlaceTargetHR = mean(PlacetargetACCvec);
PlaceLureFA = mean(PlacelureACCvec);
PlaceNonlureFA = mean(PlacenonlureACCvec);
%PlaceLureFA = mean(1-PlacelureACCvec);
%PlaceNonlureFA = mean(1-PlacenonlureACCvec);

% Equate number of trials across targets, lures, and nonlures
% Lowest number of trials in targets per condition (8 trials)-- randomly select equal number of trials from lures and nonlures
try
    HappylureACCvec = HappylureACCvec(randi(length(HappylureACCvec),[length(HappytargetACCvec),1]));
    HappynonlureACCvec = HappynonlureACCvec(randi(length(HappynonlureACCvec),[length(HappytargetACCvec),1]));
    FearlureACCvec = FearlureACCvec(randi(length(FearlureACCvec),[length(FeartargetACCvec),1]));
    FearnonlureACCvec = FearnonlureACCvec(randi(length(FearnonlureACCvec),[length(FeartargetACCvec),1]));
    NeutlureACCvec = NeutlureACCvec(randi(length(NeutlureACCvec),[length(NeuttargetACCvec),1]));
    NeutlureACCvec = NeutnonlureACCvec(randi(length(NeutnonlureACCvec),[length(NeuttargetACCvec),1]));
    PlacelureACCvec = PlacelureACCvec(randi(length(PlacelureACCvec),[length(PlacetargetACCvec),1]));
    PlacenonlureACCvec = PlacenonlureACCvec(randi(length(PlacenonlureACCvec),[length(PlacetargetACCvec),1]));
    
    %concatenate nonlures, lures, and target accuracies across stimuli to
    %create average accuracies by trial type
    Nonlure_ACC = mean(horzcat(HappynonlureACCvec,FearnonlureACCvec,NeutnonlureACCvec,PlacenonlureACCvec));
    Lure_ACC = mean(horzcat(HappylureACCvec,FearlureACCvec,NeutlureACCvec,PlacelureACCvec));
    Target_ACC = mean(horzcat(HappytargetACCvec,FeartargetACCvec,NeuttargetACCvec,PlacetargetACCvec));
catch
    %erroneous_ID{cct} = ID;
    %
    if eSite(1).site == 1 % Initiate error counting
        eSite(eSite_count).site = Site;
        eSite(eSite_count).part(eID_count).ID = ID;
        eSite(eSite_count).part(eID_count).eTask = {'WM'};
        eID_count = eID_count+1;
    elseif strcmp(eSite(end).site,Site) % error count; log ID within site
        %eSite(eSite_count).site = Site;
        eSite(eSite_count).part(eID_count).ID = ID;
        eSite(eSite_count).part(eID_count).eTask = {'WM'};
        eID_count = eID_count+1;
    else % error count; initiate log within new
        eSite_count = eSite_count+1;
        eSite(eSite_count).site = Site;
        eSite(eSite_count).part(eID_count).ID = ID;
        eSite(eSite_count).part(eID_count).eTask = {'WM'};
        eID_count = 1;
    end
    
    %{
    if strcmp(eSite(end).site,Site) % Initiate error counting
        eSite(eSite_count-1).site = Site;
        eSite(eSite_count-1).ID{eID_count} = ID;
        eID_count = eID_count+1;
    elseif strcmp(eSite(end).site,'go')
        eSite(eSite_count).site = Site;
        eSite(eSite_count).ID{eID_count} = ID;
        eID_count = eID_count+1;
        eSite_count = eSite_count+1;
    else
        eSite(eSite_count).site = Site;
        eSite(eSite_count).ID{eID_count} = ID;
    end
    %}
end


