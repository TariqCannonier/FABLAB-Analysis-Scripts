function HYAENE6MID = importSubjDataMIDtable(filename, startRow, endRow)
%IMPORTFILE Import numeric data from a text file as a matrix.
%   HYAENE6MID = IMPORTFILE(FILENAME) Reads data from text file FILENAME
%   for the default selection.
%
%   HYAENE6MID = IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data from
%   rows STARTROW through ENDROW of text file FILENAME.
%
% Example:
%   HYAENE6MID = importfile('2HYAENE6_MID.csv', 2, 106);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2017/03/08 13:45:47

%% Initialize variables.
delimiter = {'\t',','};
if nargin<=2
    startRow = 2;
    endRow = inf;
end

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%[^\n\r]';

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

for col=[14,15,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,41,42,43,44,45,46,47,48,49,50,51,52,53,54,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137]
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
rawNumericColumns = raw(:, [14,15,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,41,42,43,44,45,46,47,48,49,50,51,52,53,54,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137]);
rawCellColumns = raw(:, [1,2,3,4,5,6,7,8,9,10,11,12,13,16,17,18,19,20,21,22,23,39,40,55,56,77,78]);


%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),rawNumericColumns); % Find non-numeric cells
rawNumericColumns(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
HYAENE6MID = table;
HYAENE6MID.ExperimentName = rawCellColumns(:, 1);
HYAENE6MID.Subject = rawCellColumns(:, 2);
HYAENE6MID.Session = rawCellColumns(:, 3);
HYAENE6MID.Allowed = rawCellColumns(:, 4);
HYAENE6MID.ClockInformation = rawCellColumns(:, 5);
HYAENE6MID.DataFileBasename = rawCellColumns(:, 6);
HYAENE6MID.DisplayRefreshRate = rawCellColumns(:, 7);
HYAENE6MID.ExperimentVersion = rawCellColumns(:, 8);
HYAENE6MID.Group = rawCellColumns(:, 9);
HYAENE6MID.Handedness = rawCellColumns(:, 10);
HYAENE6MID.ImgPath = rawCellColumns(:, 11);
HYAENE6MID.MIDVERSION = rawCellColumns(:, 12);
HYAENE6MID.NARGUID = rawCellColumns(:, 13);
HYAENE6MID.PracticeRT = cell2mat(rawNumericColumns(:, 1));
HYAENE6MID.RandomSeed = cell2mat(rawNumericColumns(:, 2));
HYAENE6MID.RuntimeCapabilities = rawCellColumns(:, 14);
HYAENE6MID.RuntimeVersion = rawCellColumns(:, 15);
HYAENE6MID.RuntimeVersionExpected = rawCellColumns(:, 16);
HYAENE6MID.SessionDate = rawCellColumns(:, 17);
HYAENE6MID.SessionStartDateTimeUtc = rawCellColumns(:, 18);
HYAENE6MID.SessionTime = rawCellColumns(:, 19);
HYAENE6MID.StudioVersion = rawCellColumns(:, 20);
HYAENE6MID.triggercode = rawCellColumns(:, 21);
HYAENE6MID.Block = cell2mat(rawNumericColumns(:, 3));
HYAENE6MID.BlockList = cell2mat(rawNumericColumns(:, 4));
HYAENE6MID.BlockListCycle = cell2mat(rawNumericColumns(:, 5));
HYAENE6MID.BlockListSample = cell2mat(rawNumericColumns(:, 6));
HYAENE6MID.BlockTitle = cell2mat(rawNumericColumns(:, 7));
HYAENE6MID.EndFixDuration = cell2mat(rawNumericColumns(:, 8));
HYAENE6MID.EndFixDurationError = cell2mat(rawNumericColumns(:, 9));
HYAENE6MID.EndFixFinishTime = cell2mat(rawNumericColumns(:, 10));
HYAENE6MID.EndFixOffsetDelay = cell2mat(rawNumericColumns(:, 11));
HYAENE6MID.EndFixOffsetTime = cell2mat(rawNumericColumns(:, 12));
HYAENE6MID.EndFixOnsetDelay = cell2mat(rawNumericColumns(:, 13));
HYAENE6MID.EndFixOnsetTime = cell2mat(rawNumericColumns(:, 14));
HYAENE6MID.EndFixOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 15));
HYAENE6MID.EndFixStartTime = cell2mat(rawNumericColumns(:, 16));
HYAENE6MID.ListName = cell2mat(rawNumericColumns(:, 17));
HYAENE6MID.ProcedureBlock = rawCellColumns(:, 22);
HYAENE6MID.RunningBlock = rawCellColumns(:, 23);
HYAENE6MID.Trial = cell2mat(rawNumericColumns(:, 18));
HYAENE6MID.GetReadyRTTime = cell2mat(rawNumericColumns(:, 19));
HYAENE6MID.PeriodList = cell2mat(rawNumericColumns(:, 20));
HYAENE6MID.PeriodListCycle = cell2mat(rawNumericColumns(:, 21));
HYAENE6MID.PeriodListSample = cell2mat(rawNumericColumns(:, 22));
HYAENE6MID.PrepTimeDuration = cell2mat(rawNumericColumns(:, 23));
HYAENE6MID.PrepTimeDurationError = cell2mat(rawNumericColumns(:, 24));
HYAENE6MID.PrepTimeFinishTime = cell2mat(rawNumericColumns(:, 25));
HYAENE6MID.PrepTimeOffsetDelay = cell2mat(rawNumericColumns(:, 26));
HYAENE6MID.PrepTimeOffsetTime = cell2mat(rawNumericColumns(:, 27));
HYAENE6MID.PrepTimeOnsetDelay = cell2mat(rawNumericColumns(:, 28));
HYAENE6MID.PrepTimeOnsetTime = cell2mat(rawNumericColumns(:, 29));
HYAENE6MID.PrepTimeOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 30));
HYAENE6MID.PrepTimeStartTime = cell2mat(rawNumericColumns(:, 31));
HYAENE6MID.ProcedureTrial = rawCellColumns(:, 24);
HYAENE6MID.RunningTrial = rawCellColumns(:, 25);
HYAENE6MID.SiemensPadOffsetDelay = cell2mat(rawNumericColumns(:, 32));
HYAENE6MID.SiemensPadOffsetTime = cell2mat(rawNumericColumns(:, 33));
HYAENE6MID.SiemensPadOnsetDelay = cell2mat(rawNumericColumns(:, 34));
HYAENE6MID.SiemensPadOnsetTime = cell2mat(rawNumericColumns(:, 35));
HYAENE6MID.SiemensPadOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 36));
HYAENE6MID.SiemensPadRTTime = cell2mat(rawNumericColumns(:, 37));
HYAENE6MID.Waiting4Scanner = cell2mat(rawNumericColumns(:, 38));
HYAENE6MID.Waiting4ScannerCycle = cell2mat(rawNumericColumns(:, 39));
HYAENE6MID.Waiting4ScannerSample = cell2mat(rawNumericColumns(:, 40));
HYAENE6MID.SubTrial = cell2mat(rawNumericColumns(:, 41));
HYAENE6MID.AnticipationDuration = cell2mat(rawNumericColumns(:, 42));
HYAENE6MID.AnticipationDurationError = cell2mat(rawNumericColumns(:, 43));
HYAENE6MID.AnticipationFinishTime = cell2mat(rawNumericColumns(:, 44));
HYAENE6MID.AnticipationOffsetDelay = cell2mat(rawNumericColumns(:, 45));
HYAENE6MID.AnticipationOffsetTime = cell2mat(rawNumericColumns(:, 46));
HYAENE6MID.AnticipationOnsetDelay = cell2mat(rawNumericColumns(:, 47));
HYAENE6MID.AnticipationOnsetTime = cell2mat(rawNumericColumns(:, 48));
HYAENE6MID.AnticipationOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 49));
HYAENE6MID.AnticipationStartTime = cell2mat(rawNumericColumns(:, 50));
HYAENE6MID.AnticipationDuration1 = cell2mat(rawNumericColumns(:, 51));
HYAENE6MID.Condition = rawCellColumns(:, 26);
HYAENE6MID.Cue = rawCellColumns(:, 27);
HYAENE6MID.CueCustomOnsetTime = cell2mat(rawNumericColumns(:, 52));
HYAENE6MID.CueDuration = cell2mat(rawNumericColumns(:, 53));
HYAENE6MID.CueDurationError = cell2mat(rawNumericColumns(:, 54));
HYAENE6MID.CueFinishTime = cell2mat(rawNumericColumns(:, 55));
HYAENE6MID.CueOffsetDelay = cell2mat(rawNumericColumns(:, 56));
HYAENE6MID.CueOffsetTime = cell2mat(rawNumericColumns(:, 57));
HYAENE6MID.CueOnsetDelay = cell2mat(rawNumericColumns(:, 58));
HYAENE6MID.CueOnsetTime = cell2mat(rawNumericColumns(:, 59));
HYAENE6MID.CueOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 60));
HYAENE6MID.CueStartTime = cell2mat(rawNumericColumns(:, 61));
HYAENE6MID.FeedbackDuration = cell2mat(rawNumericColumns(:, 62));
HYAENE6MID.FeedbackDurationError = cell2mat(rawNumericColumns(:, 63));
HYAENE6MID.FeedbackFinishTime = cell2mat(rawNumericColumns(:, 64));
HYAENE6MID.FeedbackOffsetDelay = cell2mat(rawNumericColumns(:, 65));
HYAENE6MID.FeedbackOffsetTime = cell2mat(rawNumericColumns(:, 66));
HYAENE6MID.FeedbackOnsetDelay = cell2mat(rawNumericColumns(:, 67));
HYAENE6MID.FeedbackOnsetTime = cell2mat(rawNumericColumns(:, 68));
HYAENE6MID.FeedbackOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 69));
HYAENE6MID.FeedbackStartTime = cell2mat(rawNumericColumns(:, 70));
HYAENE6MID.FeedbackDuration1 = cell2mat(rawNumericColumns(:, 71));
HYAENE6MID.meanrt = cell2mat(rawNumericColumns(:, 72));
HYAENE6MID.moneyamt = cell2mat(rawNumericColumns(:, 73));
HYAENE6MID.percentacc = cell2mat(rawNumericColumns(:, 74));
HYAENE6MID.prbacc = cell2mat(rawNumericColumns(:, 75));
HYAENE6MID.prbresp = cell2mat(rawNumericColumns(:, 76));
HYAENE6MID.prbrt = cell2mat(rawNumericColumns(:, 77));
HYAENE6MID.Probe = cell2mat(rawNumericColumns(:, 78));
HYAENE6MID.ProbeDuration = cell2mat(rawNumericColumns(:, 79));
HYAENE6MID.ProbeDurationError = cell2mat(rawNumericColumns(:, 80));
HYAENE6MID.ProbeFinishTime = cell2mat(rawNumericColumns(:, 81));
HYAENE6MID.ProbeOffsetDelay = cell2mat(rawNumericColumns(:, 82));
HYAENE6MID.ProbeOffsetTime = cell2mat(rawNumericColumns(:, 83));
HYAENE6MID.ProbeOnsetDelay = cell2mat(rawNumericColumns(:, 84));
HYAENE6MID.ProbeOnsetTime = cell2mat(rawNumericColumns(:, 85));
HYAENE6MID.ProbeOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 86));
HYAENE6MID.ProbeRESP = cell2mat(rawNumericColumns(:, 87));
HYAENE6MID.ProbeRT = cell2mat(rawNumericColumns(:, 88));
HYAENE6MID.ProbeRTTime = cell2mat(rawNumericColumns(:, 89));
HYAENE6MID.ProbeStartTime = cell2mat(rawNumericColumns(:, 90));
HYAENE6MID.ProbeTime = cell2mat(rawNumericColumns(:, 91));
HYAENE6MID.ProcedureSubTrial = cell2mat(rawNumericColumns(:, 92));
HYAENE6MID.ResponseCheck = cell2mat(rawNumericColumns(:, 93));
HYAENE6MID.Result = cell2mat(rawNumericColumns(:, 94));
HYAENE6MID.RunList = cell2mat(rawNumericColumns(:, 95));
HYAENE6MID.RunListCycle = cell2mat(rawNumericColumns(:, 96));
HYAENE6MID.RunListSample = cell2mat(rawNumericColumns(:, 97));
HYAENE6MID.RunMoney = cell2mat(rawNumericColumns(:, 98));
HYAENE6MID.RunningSubTrial = cell2mat(rawNumericColumns(:, 99));
HYAENE6MID.TextDisplay1Duration = cell2mat(rawNumericColumns(:, 100));
HYAENE6MID.TextDisplay1DurationError = cell2mat(rawNumericColumns(:, 101));
HYAENE6MID.TextDisplay1FinishTime = cell2mat(rawNumericColumns(:, 102));
HYAENE6MID.TextDisplay1OffsetDelay = cell2mat(rawNumericColumns(:, 103));
HYAENE6MID.TextDisplay1OffsetTime = cell2mat(rawNumericColumns(:, 104));
HYAENE6MID.TextDisplay1OnsetDelay = cell2mat(rawNumericColumns(:, 105));
HYAENE6MID.TextDisplay1OnsetTime = cell2mat(rawNumericColumns(:, 106));
HYAENE6MID.TextDisplay1OnsetToOnsetTime = cell2mat(rawNumericColumns(:, 107));
HYAENE6MID.TextDisplay1StartTime = cell2mat(rawNumericColumns(:, 108));
HYAENE6MID.TimeVersion3 = cell2mat(rawNumericColumns(:, 109));
HYAENE6MID.TimeVersion5 = cell2mat(rawNumericColumns(:, 110));

