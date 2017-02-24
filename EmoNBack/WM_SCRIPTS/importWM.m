function [ExperimentName,Site,NDARGUID,Version,Overall_RT,Overall_ACC,HappyBlocks_RT,HappyBlocks_ACC,FearBlocks_RT,FearBlocks_ACC,NeutBlocks_RT,NeutBlocks_ACC,PlaceBlocks_RT,PlaceBlocks_ACC,Overall0back_RT,Overall0back_ACC,Happy0back_RT,Happy0back_ACC,Fear0back_RT,Fear0back_ACC,Neut0back_RT,Neut0back_ACC,Place0back_RT,Place0back_ACC,Overall2back_RT,Overall2back_ACC,Happy2back_RT,Happy2back_ACC,Fear2back_RT,Fear2back_ACC,Neut2back_RT,Neut2back_ACC,Place2back_RT,Place2back_ACC,run1Overall_RT,run1Overall_ACC,run1HappyBlocks_RT,run1HappyBlocks_ACC,run1FearBlocks_RT,run1FearBlocks_ACC,run1NeutBlocks_RT,run1NeutBlocks_ACC,run1PlaceBlocks_RT,run1PlaceBlocks_ACC,run1Happy0back_RT,run1Happy0back_ACC,run1Fear0back_RT,run1Fear0back_ACC,run1Neut0back_RT,run1Neut0back_ACC,run1Place0back_RT,run1Place0back_ACC,run1Happy2back_RT,run1Happy2back_ACC,run1Fear2back_RT,run1Fear2back_ACC,run1Neut2back_RT,run1Neut2back_ACC,run1Place2back_RT,run1Place2back_ACC,run2Overall_RT,run2Overall_ACC,run2HappyBlocks_RT,run2HappyBlocks_ACC,run2FearBlocks_RT,run2FearBlocks_ACC,run2NeutBlocks_RT,run2NeutBlocks_ACC,run2PlaceBlocks_RT,run2PlaceBlocks_ACC,run2Happy0back_RT,run2Happy0back_ACC,run2Fear0back_RT,run2Fear0back_ACC,run2Neut0back_RT,run2Neut0back_ACC,run2Place0back_RT,run2Place0back_ACC,run2Happy2back_RT,run2Happy2back_ACC,run2Fear2back_RT,run2Fear2back_ACC,run2Neut2back_RT,run2Neut2back_ACC,run2Place2back_RT,run2Place2back_ACC,Nonlure_ACC,Lure_ACC,Target_ACC,HappyTargetHR,HappyLureHR,HappyNonlureHR,FearTargetHR,FearLureHR,FearNonlureHR,NeutTargetHR,NeutLureHR,NeutNonlureHR,PlaceTargetHR,PlaceLureHR,PlaceNonlureHR] = importSubjDataWM(filename, startRow, endRow)
%IMPORTFILE Import numeric data from a text file as column vectors.
%   [EXPERIMENTNAME,SITE,NDARGUID,VERSION,OVERALL_RT,OVERALL_ACC,HAPPYBLOCKS_RT,HAPPYBLOCKS_ACC,FEARBLOCKS_RT,FEARBLOCKS_ACC,NEUTBLOCKS_RT,NEUTBLOCKS_ACC,PLACEBLOCKS_RT,PLACEBLOCKS_ACC,OVERALL0BACK_RT,OVERALL0BACK_ACC,HAPPY0BACK_RT,HAPPY0BACK_ACC,FEAR0BACK_RT,FEAR0BACK_ACC,NEUT0BACK_RT,NEUT0BACK_ACC,PLACE0BACK_RT,PLACE0BACK_ACC,OVERALL2BACK_RT,OVERALL2BACK_ACC,HAPPY2BACK_RT,HAPPY2BACK_ACC,FEAR2BACK_RT,FEAR2BACK_ACC,NEUT2BACK_RT,NEUT2BACK_ACC,PLACE2BACK_RT,PLACE2BACK_ACC,RUN1OVERALL_RT,RUN1OVERALL_ACC,RUN1HAPPYBLOCKS_RT,RUN1HAPPYBLOCKS_ACC,RUN1FEARBLOCKS_RT,RUN1FEARBLOCKS_ACC,RUN1NEUTBLOCKS_RT,RUN1NEUTBLOCKS_ACC,RUN1PLACEBLOCKS_RT,RUN1PLACEBLOCKS_ACC,RUN1HAPPY0BACK_RT,RUN1HAPPY0BACK_ACC,RUN1FEAR0BACK_RT,RUN1FEAR0BACK_ACC,RUN1NEUT0BACK_RT,RUN1NEUT0BACK_ACC,RUN1PLACE0BACK_RT,RUN1PLACE0BACK_ACC,RUN1HAPPY2BACK_RT,RUN1HAPPY2BACK_ACC,RUN1FEAR2BACK_RT,RUN1FEAR2BACK_ACC,RUN1NEUT2BACK_RT,RUN1NEUT2BACK_ACC,RUN1PLACE2BACK_RT,RUN1PLACE2BACK_ACC,RUN2OVERALL_RT,RUN2OVERALL_ACC,RUN2HAPPYBLOCKS_RT,RUN2HAPPYBLOCKS_ACC,RUN2FEARBLOCKS_RT,RUN2FEARBLOCKS_ACC,RUN2NEUTBLOCKS_RT,RUN2NEUTBLOCKS_ACC,RUN2PLACEBLOCKS_RT,RUN2PLACEBLOCKS_ACC,RUN2HAPPY0BACK_RT,RUN2HAPPY0BACK_ACC,RUN2FEAR0BACK_RT,RUN2FEAR0BACK_ACC,RUN2NEUT0BACK_RT,RUN2NEUT0BACK_ACC,RUN2PLACE0BACK_RT,RUN2PLACE0BACK_ACC,RUN2HAPPY2BACK_RT,RUN2HAPPY2BACK_ACC,RUN2FEAR2BACK_RT,RUN2FEAR2BACK_ACC,RUN2NEUT2BACK_RT,RUN2NEUT2BACK_ACC,RUN2PLACE2BACK_RT,RUN2PLACE2BACK_ACC,NONLURE_ACC,LURE_ACC,TARGET_ACC,HAPPYTARGETHR,HAPPYLUREHR,HAPPYNONLUREHR,FEARTARGETHR,FEARLUREHR,FEARNONLUREHR,NEUTTARGETHR,NEUTLUREHR,NEUTNONLUREHR,PLACETARGETHR,PLACELUREHR,PLACENONLUREHR]
%   = IMPORTFILE(FILENAME) Reads data from text file FILENAME for the
%   default selection.
%
%   [EXPERIMENTNAME,SITE,NDARGUID,VERSION,OVERALL_RT,OVERALL_ACC,HAPPYBLOCKS_RT,HAPPYBLOCKS_ACC,FEARBLOCKS_RT,FEARBLOCKS_ACC,NEUTBLOCKS_RT,NEUTBLOCKS_ACC,PLACEBLOCKS_RT,PLACEBLOCKS_ACC,OVERALL0BACK_RT,OVERALL0BACK_ACC,HAPPY0BACK_RT,HAPPY0BACK_ACC,FEAR0BACK_RT,FEAR0BACK_ACC,NEUT0BACK_RT,NEUT0BACK_ACC,PLACE0BACK_RT,PLACE0BACK_ACC,OVERALL2BACK_RT,OVERALL2BACK_ACC,HAPPY2BACK_RT,HAPPY2BACK_ACC,FEAR2BACK_RT,FEAR2BACK_ACC,NEUT2BACK_RT,NEUT2BACK_ACC,PLACE2BACK_RT,PLACE2BACK_ACC,RUN1OVERALL_RT,RUN1OVERALL_ACC,RUN1HAPPYBLOCKS_RT,RUN1HAPPYBLOCKS_ACC,RUN1FEARBLOCKS_RT,RUN1FEARBLOCKS_ACC,RUN1NEUTBLOCKS_RT,RUN1NEUTBLOCKS_ACC,RUN1PLACEBLOCKS_RT,RUN1PLACEBLOCKS_ACC,RUN1HAPPY0BACK_RT,RUN1HAPPY0BACK_ACC,RUN1FEAR0BACK_RT,RUN1FEAR0BACK_ACC,RUN1NEUT0BACK_RT,RUN1NEUT0BACK_ACC,RUN1PLACE0BACK_RT,RUN1PLACE0BACK_ACC,RUN1HAPPY2BACK_RT,RUN1HAPPY2BACK_ACC,RUN1FEAR2BACK_RT,RUN1FEAR2BACK_ACC,RUN1NEUT2BACK_RT,RUN1NEUT2BACK_ACC,RUN1PLACE2BACK_RT,RUN1PLACE2BACK_ACC,RUN2OVERALL_RT,RUN2OVERALL_ACC,RUN2HAPPYBLOCKS_RT,RUN2HAPPYBLOCKS_ACC,RUN2FEARBLOCKS_RT,RUN2FEARBLOCKS_ACC,RUN2NEUTBLOCKS_RT,RUN2NEUTBLOCKS_ACC,RUN2PLACEBLOCKS_RT,RUN2PLACEBLOCKS_ACC,RUN2HAPPY0BACK_RT,RUN2HAPPY0BACK_ACC,RUN2FEAR0BACK_RT,RUN2FEAR0BACK_ACC,RUN2NEUT0BACK_RT,RUN2NEUT0BACK_ACC,RUN2PLACE0BACK_RT,RUN2PLACE0BACK_ACC,RUN2HAPPY2BACK_RT,RUN2HAPPY2BACK_ACC,RUN2FEAR2BACK_RT,RUN2FEAR2BACK_ACC,RUN2NEUT2BACK_RT,RUN2NEUT2BACK_ACC,RUN2PLACE2BACK_RT,RUN2PLACE2BACK_ACC,NONLURE_ACC,LURE_ACC,TARGET_ACC,HAPPYTARGETHR,HAPPYLUREHR,HAPPYNONLUREHR,FEARTARGETHR,FEARLUREHR,FEARNONLUREHR,NEUTTARGETHR,NEUTLUREHR,NEUTNONLUREHR,PLACETARGETHR,PLACELUREHR,PLACENONLUREHR]
%   = IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data from rows STARTROW
%   through ENDROW of text file FILENAME.
%
% Example:
%   [ExperimentName,Site,NDARGUID,Version,Overall_RT,Overall_ACC,HappyBlocks_RT,HappyBlocks_ACC,FearBlocks_RT,FearBlocks_ACC,NeutBlocks_RT,NeutBlocks_ACC,PlaceBlocks_RT,PlaceBlocks_ACC,Overall0back_RT,Overall0back_ACC,Happy0back_RT,Happy0back_ACC,Fear0back_RT,Fear0back_ACC,Neut0back_RT,Neut0back_ACC,Place0back_RT,Place0back_ACC,Overall2back_RT,Overall2back_ACC,Happy2back_RT,Happy2back_ACC,Fear2back_RT,Fear2back_ACC,Neut2back_RT,Neut2back_ACC,Place2back_RT,Place2back_ACC,run1Overall_RT,run1Overall_ACC,run1HappyBlocks_RT,run1HappyBlocks_ACC,run1FearBlocks_RT,run1FearBlocks_ACC,run1NeutBlocks_RT,run1NeutBlocks_ACC,run1PlaceBlocks_RT,run1PlaceBlocks_ACC,run1Happy0back_RT,run1Happy0back_ACC,run1Fear0back_RT,run1Fear0back_ACC,run1Neut0back_RT,run1Neut0back_ACC,run1Place0back_RT,run1Place0back_ACC,run1Happy2back_RT,run1Happy2back_ACC,run1Fear2back_RT,run1Fear2back_ACC,run1Neut2back_RT,run1Neut2back_ACC,run1Place2back_RT,run1Place2back_ACC,run2Overall_RT,run2Overall_ACC,run2HappyBlocks_RT,run2HappyBlocks_ACC,run2FearBlocks_RT,run2FearBlocks_ACC,run2NeutBlocks_RT,run2NeutBlocks_ACC,run2PlaceBlocks_RT,run2PlaceBlocks_ACC,run2Happy0back_RT,run2Happy0back_ACC,run2Fear0back_RT,run2Fear0back_ACC,run2Neut0back_RT,run2Neut0back_ACC,run2Place0back_RT,run2Place0back_ACC,run2Happy2back_RT,run2Happy2back_ACC,run2Fear2back_RT,run2Fear2back_ACC,run2Neut2back_RT,run2Neut2back_ACC,run2Place2back_RT,run2Place2back_ACC,Nonlure_ACC,Lure_ACC,Target_ACC,HappyTargetHR,HappyLureHR,HappyNonlureHR,FearTargetHR,FearLureHR,FearNonlureHR,NeutTargetHR,NeutLureHR,NeutNonlureHR,PlaceTargetHR,PlaceLureHR,PlaceNonlureHR] = importfile('EmoNback_WMBehaviorABCD_20170203.csv',2, 167);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2017/02/03 19:21:57

%% Initialize variables.
delimiter = {'\t',','};
if nargin<=2
    startRow = 2;
    endRow = inf;
end

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to the format.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(block)-1, 'ReturnOnError', false, 'EndOfLine', '\r\n');
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric text to numbers.
% Replace non-numeric text with NaN.
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = dataArray{col};
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101]
    % Converts text in the input cell array to numbers. Replaced non-numeric
    % text with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1);
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData{row}, regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if any(numbers==',');
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'));
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric text to numbers.
            if ~invalidThousandsSeparator;
                numbers = textscan(strrep(numbers, ',', ''), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch me
        end
    end
end


%% Split data into numeric and cell columns.
rawNumericColumns = raw(:, [1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101]);
rawCellColumns = raw(:, [2,3]);


%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),rawNumericColumns); % Find non-numeric cells
rawNumericColumns(R) = {NaN}; % Replace non-numeric cells

%% Allocate imported array to column variable names
ExperimentName = cell2mat(rawNumericColumns(:, 1));
Site = rawCellColumns(:, 1);
NDARGUID = rawCellColumns(:, 2);
Version = cell2mat(rawNumericColumns(:, 2));
Overall_RT = cell2mat(rawNumericColumns(:, 3));
Overall_ACC = cell2mat(rawNumericColumns(:, 4));
HappyBlocks_RT = cell2mat(rawNumericColumns(:, 5));
HappyBlocks_ACC = cell2mat(rawNumericColumns(:, 6));
FearBlocks_RT = cell2mat(rawNumericColumns(:, 7));
FearBlocks_ACC = cell2mat(rawNumericColumns(:, 8));
NeutBlocks_RT = cell2mat(rawNumericColumns(:, 9));
NeutBlocks_ACC = cell2mat(rawNumericColumns(:, 10));
PlaceBlocks_RT = cell2mat(rawNumericColumns(:, 11));
PlaceBlocks_ACC = cell2mat(rawNumericColumns(:, 12));
Overall0back_RT = cell2mat(rawNumericColumns(:, 13));
Overall0back_ACC = cell2mat(rawNumericColumns(:, 14));
Happy0back_RT = cell2mat(rawNumericColumns(:, 15));
Happy0back_ACC = cell2mat(rawNumericColumns(:, 16));
Fear0back_RT = cell2mat(rawNumericColumns(:, 17));
Fear0back_ACC = cell2mat(rawNumericColumns(:, 18));
Neut0back_RT = cell2mat(rawNumericColumns(:, 19));
Neut0back_ACC = cell2mat(rawNumericColumns(:, 20));
Place0back_RT = cell2mat(rawNumericColumns(:, 21));
Place0back_ACC = cell2mat(rawNumericColumns(:, 22));
Overall2back_RT = cell2mat(rawNumericColumns(:, 23));
Overall2back_ACC = cell2mat(rawNumericColumns(:, 24));
Happy2back_RT = cell2mat(rawNumericColumns(:, 25));
Happy2back_ACC = cell2mat(rawNumericColumns(:, 26));
Fear2back_RT = cell2mat(rawNumericColumns(:, 27));
Fear2back_ACC = cell2mat(rawNumericColumns(:, 28));
Neut2back_RT = cell2mat(rawNumericColumns(:, 29));
Neut2back_ACC = cell2mat(rawNumericColumns(:, 30));
Place2back_RT = cell2mat(rawNumericColumns(:, 31));
Place2back_ACC = cell2mat(rawNumericColumns(:, 32));
run1Overall_RT = cell2mat(rawNumericColumns(:, 33));
run1Overall_ACC = cell2mat(rawNumericColumns(:, 34));
run1HappyBlocks_RT = cell2mat(rawNumericColumns(:, 35));
run1HappyBlocks_ACC = cell2mat(rawNumericColumns(:, 36));
run1FearBlocks_RT = cell2mat(rawNumericColumns(:, 37));
run1FearBlocks_ACC = cell2mat(rawNumericColumns(:, 38));
run1NeutBlocks_RT = cell2mat(rawNumericColumns(:, 39));
run1NeutBlocks_ACC = cell2mat(rawNumericColumns(:, 40));
run1PlaceBlocks_RT = cell2mat(rawNumericColumns(:, 41));
run1PlaceBlocks_ACC = cell2mat(rawNumericColumns(:, 42));
run1Happy0back_RT = cell2mat(rawNumericColumns(:, 43));
run1Happy0back_ACC = cell2mat(rawNumericColumns(:, 44));
run1Fear0back_RT = cell2mat(rawNumericColumns(:, 45));
run1Fear0back_ACC = cell2mat(rawNumericColumns(:, 46));
run1Neut0back_RT = cell2mat(rawNumericColumns(:, 47));
run1Neut0back_ACC = cell2mat(rawNumericColumns(:, 48));
run1Place0back_RT = cell2mat(rawNumericColumns(:, 49));
run1Place0back_ACC = cell2mat(rawNumericColumns(:, 50));
run1Happy2back_RT = cell2mat(rawNumericColumns(:, 51));
run1Happy2back_ACC = cell2mat(rawNumericColumns(:, 52));
run1Fear2back_RT = cell2mat(rawNumericColumns(:, 53));
run1Fear2back_ACC = cell2mat(rawNumericColumns(:, 54));
run1Neut2back_RT = cell2mat(rawNumericColumns(:, 55));
run1Neut2back_ACC = cell2mat(rawNumericColumns(:, 56));
run1Place2back_RT = cell2mat(rawNumericColumns(:, 57));
run1Place2back_ACC = cell2mat(rawNumericColumns(:, 58));
run2Overall_RT = cell2mat(rawNumericColumns(:, 59));
run2Overall_ACC = cell2mat(rawNumericColumns(:, 60));
run2HappyBlocks_RT = cell2mat(rawNumericColumns(:, 61));
run2HappyBlocks_ACC = cell2mat(rawNumericColumns(:, 62));
run2FearBlocks_RT = cell2mat(rawNumericColumns(:, 63));
run2FearBlocks_ACC = cell2mat(rawNumericColumns(:, 64));
run2NeutBlocks_RT = cell2mat(rawNumericColumns(:, 65));
run2NeutBlocks_ACC = cell2mat(rawNumericColumns(:, 66));
run2PlaceBlocks_RT = cell2mat(rawNumericColumns(:, 67));
run2PlaceBlocks_ACC = cell2mat(rawNumericColumns(:, 68));
run2Happy0back_RT = cell2mat(rawNumericColumns(:, 69));
run2Happy0back_ACC = cell2mat(rawNumericColumns(:, 70));
run2Fear0back_RT = cell2mat(rawNumericColumns(:, 71));
run2Fear0back_ACC = cell2mat(rawNumericColumns(:, 72));
run2Neut0back_RT = cell2mat(rawNumericColumns(:, 73));
run2Neut0back_ACC = cell2mat(rawNumericColumns(:, 74));
run2Place0back_RT = cell2mat(rawNumericColumns(:, 75));
run2Place0back_ACC = cell2mat(rawNumericColumns(:, 76));
run2Happy2back_RT = cell2mat(rawNumericColumns(:, 77));
run2Happy2back_ACC = cell2mat(rawNumericColumns(:, 78));
run2Fear2back_RT = cell2mat(rawNumericColumns(:, 79));
run2Fear2back_ACC = cell2mat(rawNumericColumns(:, 80));
run2Neut2back_RT = cell2mat(rawNumericColumns(:, 81));
run2Neut2back_ACC = cell2mat(rawNumericColumns(:, 82));
run2Place2back_RT = cell2mat(rawNumericColumns(:, 83));
run2Place2back_ACC = cell2mat(rawNumericColumns(:, 84));
Nonlure_ACC = cell2mat(rawNumericColumns(:, 85));
Lure_ACC = cell2mat(rawNumericColumns(:, 86));
Target_ACC = cell2mat(rawNumericColumns(:, 87));
HappyTargetHR = cell2mat(rawNumericColumns(:, 88));
HappyLureHR = cell2mat(rawNumericColumns(:, 89));
HappyNonlureHR = cell2mat(rawNumericColumns(:, 90));
FearTargetHR = cell2mat(rawNumericColumns(:, 91));
FearLureHR = cell2mat(rawNumericColumns(:, 92));
FearNonlureHR = cell2mat(rawNumericColumns(:, 93));
NeutTargetHR = cell2mat(rawNumericColumns(:, 94));
NeutLureHR = cell2mat(rawNumericColumns(:, 95));
NeutNonlureHR = cell2mat(rawNumericColumns(:, 96));
PlaceTargetHR = cell2mat(rawNumericColumns(:, 97));
PlaceLureHR = cell2mat(rawNumericColumns(:, 98));
PlaceNonlureHR = cell2mat(rawNumericColumns(:, 99));


