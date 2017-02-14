function [ExperimentName1,Site1,NDARGUID1,Version1,Overall_RT1,Overall_ACC1,HappyBlocks_RT1,HappyBlocks_ACC1,FearBlocks_RT1,FearBlocks_ACC1,NeutBlocks_RT1,NeutBlocks_ACC1,PlaceBlocks_RT1,PlaceBlocks_ACC1,Overall0back_RT1,Overall0back_ACC1,Happy0back_RT1,Happy0back_ACC1,Fear0back_RT1,Fear0back_ACC1,Neut0back_RT1,Neut0back_ACC1,Place0back_RT1,Place0back_ACC1,Overall2back_RT1,Overall2back_ACC1,Happy2back_RT1,Happy2back_ACC1,Fear2back_RT1,Fear2back_ACC1,Neut2back_RT1,Neut2back_ACC1,Place2back_RT1,Place2back_ACC1,run1Overall_RT1,run1Overall_ACC1,run1HappyBlocks_RT1,run1HappyBlocks_ACC1,run1FearBlocks_RT1,run1FearBlocks_ACC1,run1NeutBlocks_RT1,run1NeutBlocks_ACC1,run1PlaceBlocks_RT1,run1PlaceBlocks_ACC1,run1Happy0back_RT1,run1Happy0back_ACC1,run1Fear0back_RT1,run1Fear0back_ACC1,run1Neut0back_RT1,run1Neut0back_ACC1,run1Place0back_RT1,run1Place0back_ACC1,run1Happy2back_RT1,run1Happy2back_ACC1,run1Fear2back_RT1,run1Fear2back_ACC1,run1Neut2back_RT1,run1Neut2back_ACC1,run1Place2back_RT1,run1Place2back_ACC1,run2Overall_RT1,run2Overall_ACC1,run2HappyBlocks_RT1,run2HappyBlocks_ACC1,run2FearBlocks_RT1,run2FearBlocks_ACC1,run2NeutBlocks_RT1,run2NeutBlocks_ACC1,run2PlaceBlocks_RT1,run2PlaceBlocks_ACC1,run2Happy0back_RT1,run2Happy0back_ACC1,run2Fear0back_RT1,run2Fear0back_ACC1,run2Neut0back_RT1,run2Neut0back_ACC1,run2Place0back_RT1,run2Place0back_ACC1,run2Happy2back_RT1,run2Happy2back_ACC1,run2Fear2back_RT1,run2Fear2back_ACC1,run2Neut2back_RT1,run2Neut2back_ACC1,run2Place2back_RT1,run2Place2back_ACC1,Nonlure_ACC1,Lure_ACC1,Target_ACC1] = importfile(filename, startRow, endRow)
%IMPORTFILE Import numeric data from a text file as column vectors.
%   [EXPERIMENTNAME1,SITE1,NDARGUID1,VERSION1,OVERALL_RT1,OVERALL_ACC1,HAPPYBLOCKS_RT1,HAPPYBLOCKS_ACC1,FEARBLOCKS_RT1,FEARBLOCKS_ACC1,NEUTBLOCKS_RT1,NEUTBLOCKS_ACC1,PLACEBLOCKS_RT1,PLACEBLOCKS_ACC1,OVERALL0BACK_RT1,OVERALL0BACK_ACC1,HAPPY0BACK_RT1,HAPPY0BACK_ACC1,FEAR0BACK_RT1,FEAR0BACK_ACC1,NEUT0BACK_RT1,NEUT0BACK_ACC1,PLACE0BACK_RT1,PLACE0BACK_ACC1,OVERALL2BACK_RT1,OVERALL2BACK_ACC1,HAPPY2BACK_RT1,HAPPY2BACK_ACC1,FEAR2BACK_RT1,FEAR2BACK_ACC1,NEUT2BACK_RT1,NEUT2BACK_ACC1,PLACE2BACK_RT1,PLACE2BACK_ACC1,RUN1OVERALL_RT1,RUN1OVERALL_ACC1,RUN1HAPPYBLOCKS_RT1,RUN1HAPPYBLOCKS_ACC1,RUN1FEARBLOCKS_RT1,RUN1FEARBLOCKS_ACC1,RUN1NEUTBLOCKS_RT1,RUN1NEUTBLOCKS_ACC1,RUN1PLACEBLOCKS_RT1,RUN1PLACEBLOCKS_ACC1,RUN1HAPPY0BACK_RT1,RUN1HAPPY0BACK_ACC1,RUN1FEAR0BACK_RT1,RUN1FEAR0BACK_ACC1,RUN1NEUT0BACK_RT1,RUN1NEUT0BACK_ACC1,RUN1PLACE0BACK_RT1,RUN1PLACE0BACK_ACC1,RUN1HAPPY2BACK_RT1,RUN1HAPPY2BACK_ACC1,RUN1FEAR2BACK_RT1,RUN1FEAR2BACK_ACC1,RUN1NEUT2BACK_RT1,RUN1NEUT2BACK_ACC1,RUN1PLACE2BACK_RT1,RUN1PLACE2BACK_ACC1,RUN2OVERALL_RT1,RUN2OVERALL_ACC1,RUN2HAPPYBLOCKS_RT1,RUN2HAPPYBLOCKS_ACC1,RUN2FEARBLOCKS_RT1,RUN2FEARBLOCKS_ACC1,RUN2NEUTBLOCKS_RT1,RUN2NEUTBLOCKS_ACC1,RUN2PLACEBLOCKS_RT1,RUN2PLACEBLOCKS_ACC1,RUN2HAPPY0BACK_RT1,RUN2HAPPY0BACK_ACC1,RUN2FEAR0BACK_RT1,RUN2FEAR0BACK_ACC1,RUN2NEUT0BACK_RT1,RUN2NEUT0BACK_ACC1,RUN2PLACE0BACK_RT1,RUN2PLACE0BACK_ACC1,RUN2HAPPY2BACK_RT1,RUN2HAPPY2BACK_ACC1,RUN2FEAR2BACK_RT1,RUN2FEAR2BACK_ACC1,RUN2NEUT2BACK_RT1,RUN2NEUT2BACK_ACC1,RUN2PLACE2BACK_RT1,RUN2PLACE2BACK_ACC1,NONLURE_ACC1,LURE_ACC1,TARGET_ACC1]
%   = IMPORTFILE(FILENAME) Reads data from text file FILENAME for the
%   default selection.
%
%   [EXPERIMENTNAME1,SITE1,NDARGUID1,VERSION1,OVERALL_RT1,OVERALL_ACC1,HAPPYBLOCKS_RT1,HAPPYBLOCKS_ACC1,FEARBLOCKS_RT1,FEARBLOCKS_ACC1,NEUTBLOCKS_RT1,NEUTBLOCKS_ACC1,PLACEBLOCKS_RT1,PLACEBLOCKS_ACC1,OVERALL0BACK_RT1,OVERALL0BACK_ACC1,HAPPY0BACK_RT1,HAPPY0BACK_ACC1,FEAR0BACK_RT1,FEAR0BACK_ACC1,NEUT0BACK_RT1,NEUT0BACK_ACC1,PLACE0BACK_RT1,PLACE0BACK_ACC1,OVERALL2BACK_RT1,OVERALL2BACK_ACC1,HAPPY2BACK_RT1,HAPPY2BACK_ACC1,FEAR2BACK_RT1,FEAR2BACK_ACC1,NEUT2BACK_RT1,NEUT2BACK_ACC1,PLACE2BACK_RT1,PLACE2BACK_ACC1,RUN1OVERALL_RT1,RUN1OVERALL_ACC1,RUN1HAPPYBLOCKS_RT1,RUN1HAPPYBLOCKS_ACC1,RUN1FEARBLOCKS_RT1,RUN1FEARBLOCKS_ACC1,RUN1NEUTBLOCKS_RT1,RUN1NEUTBLOCKS_ACC1,RUN1PLACEBLOCKS_RT1,RUN1PLACEBLOCKS_ACC1,RUN1HAPPY0BACK_RT1,RUN1HAPPY0BACK_ACC1,RUN1FEAR0BACK_RT1,RUN1FEAR0BACK_ACC1,RUN1NEUT0BACK_RT1,RUN1NEUT0BACK_ACC1,RUN1PLACE0BACK_RT1,RUN1PLACE0BACK_ACC1,RUN1HAPPY2BACK_RT1,RUN1HAPPY2BACK_ACC1,RUN1FEAR2BACK_RT1,RUN1FEAR2BACK_ACC1,RUN1NEUT2BACK_RT1,RUN1NEUT2BACK_ACC1,RUN1PLACE2BACK_RT1,RUN1PLACE2BACK_ACC1,RUN2OVERALL_RT1,RUN2OVERALL_ACC1,RUN2HAPPYBLOCKS_RT1,RUN2HAPPYBLOCKS_ACC1,RUN2FEARBLOCKS_RT1,RUN2FEARBLOCKS_ACC1,RUN2NEUTBLOCKS_RT1,RUN2NEUTBLOCKS_ACC1,RUN2PLACEBLOCKS_RT1,RUN2PLACEBLOCKS_ACC1,RUN2HAPPY0BACK_RT1,RUN2HAPPY0BACK_ACC1,RUN2FEAR0BACK_RT1,RUN2FEAR0BACK_ACC1,RUN2NEUT0BACK_RT1,RUN2NEUT0BACK_ACC1,RUN2PLACE0BACK_RT1,RUN2PLACE0BACK_ACC1,RUN2HAPPY2BACK_RT1,RUN2HAPPY2BACK_ACC1,RUN2FEAR2BACK_RT1,RUN2FEAR2BACK_ACC1,RUN2NEUT2BACK_RT1,RUN2NEUT2BACK_ACC1,RUN2PLACE2BACK_RT1,RUN2PLACE2BACK_ACC1,NONLURE_ACC1,LURE_ACC1,TARGET_ACC1]
%   = IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data from rows STARTROW
%   through ENDROW of text file FILENAME.
%
% Example:
%   [ExperimentName1,Site1,NDARGUID1,Version1,Overall_RT1,Overall_ACC1,HappyBlocks_RT1,HappyBlocks_ACC1,FearBlocks_RT1,FearBlocks_ACC1,NeutBlocks_RT1,NeutBlocks_ACC1,PlaceBlocks_RT1,PlaceBlocks_ACC1,Overall0back_RT1,Overall0back_ACC1,Happy0back_RT1,Happy0back_ACC1,Fear0back_RT1,Fear0back_ACC1,Neut0back_RT1,Neut0back_ACC1,Place0back_RT1,Place0back_ACC1,Overall2back_RT1,Overall2back_ACC1,Happy2back_RT1,Happy2back_ACC1,Fear2back_RT1,Fear2back_ACC1,Neut2back_RT1,Neut2back_ACC1,Place2back_RT1,Place2back_ACC1,run1Overall_RT1,run1Overall_ACC1,run1HappyBlocks_RT1,run1HappyBlocks_ACC1,run1FearBlocks_RT1,run1FearBlocks_ACC1,run1NeutBlocks_RT1,run1NeutBlocks_ACC1,run1PlaceBlocks_RT1,run1PlaceBlocks_ACC1,run1Happy0back_RT1,run1Happy0back_ACC1,run1Fear0back_RT1,run1Fear0back_ACC1,run1Neut0back_RT1,run1Neut0back_ACC1,run1Place0back_RT1,run1Place0back_ACC1,run1Happy2back_RT1,run1Happy2back_ACC1,run1Fear2back_RT1,run1Fear2back_ACC1,run1Neut2back_RT1,run1Neut2back_ACC1,run1Place2back_RT1,run1Place2back_ACC1,run2Overall_RT1,run2Overall_ACC1,run2HappyBlocks_RT1,run2HappyBlocks_ACC1,run2FearBlocks_RT1,run2FearBlocks_ACC1,run2NeutBlocks_RT1,run2NeutBlocks_ACC1,run2PlaceBlocks_RT1,run2PlaceBlocks_ACC1,run2Happy0back_RT1,run2Happy0back_ACC1,run2Fear0back_RT1,run2Fear0back_ACC1,run2Neut0back_RT1,run2Neut0back_ACC1,run2Place0back_RT1,run2Place0back_ACC1,run2Happy2back_RT1,run2Happy2back_ACC1,run2Fear2back_RT1,run2Fear2back_ACC1,run2Neut2back_RT1,run2Neut2back_ACC1,run2Place2back_RT1,run2Place2back_ACC1,Nonlure_ACC1,Lure_ACC1,Target_ACC1] = importfile('EmoNback_WMBehaviorABCD_20161203.csv',2, 172);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2016/12/03 17:41:06

%% Initialize variables.
delimiter = ',';
if nargin<=2
    startRow = 2;
    endRow = inf;
end

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%[^\n\r]';

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

for col=[1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89]
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
rawNumericColumns = raw(:, [1,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89]);
rawCellColumns = raw(:, [2,3]);


%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),rawNumericColumns); % Find non-numeric cells
rawNumericColumns(R) = {NaN}; % Replace non-numeric cells

%% Allocate imported array to column variable names
ExperimentName1 = cell2mat(rawNumericColumns(:, 1));
Site1 = rawCellColumns(:, 1);
NDARGUID1 = rawCellColumns(:, 2);
Version1 = cell2mat(rawNumericColumns(:, 2));
Overall_RT1 = cell2mat(rawNumericColumns(:, 3));
Overall_ACC1 = cell2mat(rawNumericColumns(:, 4));
HappyBlocks_RT1 = cell2mat(rawNumericColumns(:, 5));
HappyBlocks_ACC1 = cell2mat(rawNumericColumns(:, 6));
FearBlocks_RT1 = cell2mat(rawNumericColumns(:, 7));
FearBlocks_ACC1 = cell2mat(rawNumericColumns(:, 8));
NeutBlocks_RT1 = cell2mat(rawNumericColumns(:, 9));
NeutBlocks_ACC1 = cell2mat(rawNumericColumns(:, 10));
PlaceBlocks_RT1 = cell2mat(rawNumericColumns(:, 11));
PlaceBlocks_ACC1 = cell2mat(rawNumericColumns(:, 12));
Overall0back_RT1 = cell2mat(rawNumericColumns(:, 13));
Overall0back_ACC1 = cell2mat(rawNumericColumns(:, 14));
Happy0back_RT1 = cell2mat(rawNumericColumns(:, 15));
Happy0back_ACC1 = cell2mat(rawNumericColumns(:, 16));
Fear0back_RT1 = cell2mat(rawNumericColumns(:, 17));
Fear0back_ACC1 = cell2mat(rawNumericColumns(:, 18));
Neut0back_RT1 = cell2mat(rawNumericColumns(:, 19));
Neut0back_ACC1 = cell2mat(rawNumericColumns(:, 20));
Place0back_RT1 = cell2mat(rawNumericColumns(:, 21));
Place0back_ACC1 = cell2mat(rawNumericColumns(:, 22));
Overall2back_RT1 = cell2mat(rawNumericColumns(:, 23));
Overall2back_ACC1 = cell2mat(rawNumericColumns(:, 24));
Happy2back_RT1 = cell2mat(rawNumericColumns(:, 25));
Happy2back_ACC1 = cell2mat(rawNumericColumns(:, 26));
Fear2back_RT1 = cell2mat(rawNumericColumns(:, 27));
Fear2back_ACC1 = cell2mat(rawNumericColumns(:, 28));
Neut2back_RT1 = cell2mat(rawNumericColumns(:, 29));
Neut2back_ACC1 = cell2mat(rawNumericColumns(:, 30));
Place2back_RT1 = cell2mat(rawNumericColumns(:, 31));
Place2back_ACC1 = cell2mat(rawNumericColumns(:, 32));
run1Overall_RT1 = cell2mat(rawNumericColumns(:, 33));
run1Overall_ACC1 = cell2mat(rawNumericColumns(:, 34));
run1HappyBlocks_RT1 = cell2mat(rawNumericColumns(:, 35));
run1HappyBlocks_ACC1 = cell2mat(rawNumericColumns(:, 36));
run1FearBlocks_RT1 = cell2mat(rawNumericColumns(:, 37));
run1FearBlocks_ACC1 = cell2mat(rawNumericColumns(:, 38));
run1NeutBlocks_RT1 = cell2mat(rawNumericColumns(:, 39));
run1NeutBlocks_ACC1 = cell2mat(rawNumericColumns(:, 40));
run1PlaceBlocks_RT1 = cell2mat(rawNumericColumns(:, 41));
run1PlaceBlocks_ACC1 = cell2mat(rawNumericColumns(:, 42));
run1Happy0back_RT1 = cell2mat(rawNumericColumns(:, 43));
run1Happy0back_ACC1 = cell2mat(rawNumericColumns(:, 44));
run1Fear0back_RT1 = cell2mat(rawNumericColumns(:, 45));
run1Fear0back_ACC1 = cell2mat(rawNumericColumns(:, 46));
run1Neut0back_RT1 = cell2mat(rawNumericColumns(:, 47));
run1Neut0back_ACC1 = cell2mat(rawNumericColumns(:, 48));
run1Place0back_RT1 = cell2mat(rawNumericColumns(:, 49));
run1Place0back_ACC1 = cell2mat(rawNumericColumns(:, 50));
run1Happy2back_RT1 = cell2mat(rawNumericColumns(:, 51));
run1Happy2back_ACC1 = cell2mat(rawNumericColumns(:, 52));
run1Fear2back_RT1 = cell2mat(rawNumericColumns(:, 53));
run1Fear2back_ACC1 = cell2mat(rawNumericColumns(:, 54));
run1Neut2back_RT1 = cell2mat(rawNumericColumns(:, 55));
run1Neut2back_ACC1 = cell2mat(rawNumericColumns(:, 56));
run1Place2back_RT1 = cell2mat(rawNumericColumns(:, 57));
run1Place2back_ACC1 = cell2mat(rawNumericColumns(:, 58));
run2Overall_RT1 = cell2mat(rawNumericColumns(:, 59));
run2Overall_ACC1 = cell2mat(rawNumericColumns(:, 60));
run2HappyBlocks_RT1 = cell2mat(rawNumericColumns(:, 61));
run2HappyBlocks_ACC1 = cell2mat(rawNumericColumns(:, 62));
run2FearBlocks_RT1 = cell2mat(rawNumericColumns(:, 63));
run2FearBlocks_ACC1 = cell2mat(rawNumericColumns(:, 64));
run2NeutBlocks_RT1 = cell2mat(rawNumericColumns(:, 65));
run2NeutBlocks_ACC1 = cell2mat(rawNumericColumns(:, 66));
run2PlaceBlocks_RT1 = cell2mat(rawNumericColumns(:, 67));
run2PlaceBlocks_ACC1 = cell2mat(rawNumericColumns(:, 68));
run2Happy0back_RT1 = cell2mat(rawNumericColumns(:, 69));
run2Happy0back_ACC1 = cell2mat(rawNumericColumns(:, 70));
run2Fear0back_RT1 = cell2mat(rawNumericColumns(:, 71));
run2Fear0back_ACC1 = cell2mat(rawNumericColumns(:, 72));
run2Neut0back_RT1 = cell2mat(rawNumericColumns(:, 73));
run2Neut0back_ACC1 = cell2mat(rawNumericColumns(:, 74));
run2Place0back_RT1 = cell2mat(rawNumericColumns(:, 75));
run2Place0back_ACC1 = cell2mat(rawNumericColumns(:, 76));
run2Happy2back_RT1 = cell2mat(rawNumericColumns(:, 77));
run2Happy2back_ACC1 = cell2mat(rawNumericColumns(:, 78));
run2Fear2back_RT1 = cell2mat(rawNumericColumns(:, 79));
run2Fear2back_ACC1 = cell2mat(rawNumericColumns(:, 80));
run2Neut2back_RT1 = cell2mat(rawNumericColumns(:, 81));
run2Neut2back_ACC1 = cell2mat(rawNumericColumns(:, 82));
run2Place2back_RT1 = cell2mat(rawNumericColumns(:, 83));
run2Place2back_ACC1 = cell2mat(rawNumericColumns(:, 84));
Nonlure_ACC1 = cell2mat(rawNumericColumns(:, 85));
Lure_ACC1 = cell2mat(rawNumericColumns(:, 86));
Target_ACC1 = cell2mat(rawNumericColumns(:, 87));


