function subDataMID = importSubjDataMIDGE(filename, startRow, endRow)
%IMPORTFILE Import numeric data from a text file as a matrix.
%   NDARINV1DZWFKCGMID = IMPORTFILE(FILENAME) Reads data from text file
%   FILENAME for the default selection.
%
%   NDARINV1DZWFKCGMID = IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data
%   from rows STARTROW through ENDROW of text file FILENAME.
%
% Example:
%   NDARINV1DZWFKCGMID = importfile('NDAR_INV1DZWFKCG_MID.txt', 2, 136);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2017/03/16 17:50:31

%% Initialize variables.
delimiter = {'\t',','};
if nargin<=2
    startRow = 2;
    endRow = inf;
end

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%[^\n\r]';

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

for col=[1,2,3,4,7,9,11,12,13,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,39,40,41,42,43,44,45,46,47,48,49,50,51,52,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129]
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

% Convert the contents of columns with dates to MATLAB datetimes using the
% specified date format.
try
    dates{19} = datetime(dataArray{19}, 'Format', 'HH:mm:ss', 'InputFormat', 'HH:mm:ss');
catch
    try
        % Handle dates surrounded by quotes
        dataArray{19} = cellfun(@(x) x(2:end-1), dataArray{19}, 'UniformOutput', false);
        dates{19} = datetime(dataArray{19}, 'Format', 'HH:mm:ss', 'InputFormat', 'HH:mm:ss');
    catch
        dates{19} = repmat(datetime([NaN NaN NaN]), size(dataArray{19}));
    end
end

anyBlankDates = cellfun(@isempty, dataArray{19});
anyInvalidDates = isnan(dates{19}.Hour) - anyBlankDates;
dates = dates(:,19);

%% Split data into numeric and cell columns.
rawNumericColumns = raw(:, [1,2,3,4,7,9,11,12,13,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,39,40,41,42,43,44,45,46,47,48,49,50,51,52,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129]);
rawCellColumns = raw(:, [5,6,8,10,14,15,16,17,18,20,37,38,53,69,70,97]);


%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),rawNumericColumns); % Find non-numeric cells
rawNumericColumns(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
subDataMID = table;
subDataMID.ExperimentName = cell2mat(rawNumericColumns(:, 1));
subDataMID.Subject = cell2mat(rawNumericColumns(:, 2));
subDataMID.Session = cell2mat(rawNumericColumns(:, 3));
subDataMID.Allowed = cell2mat(rawNumericColumns(:, 4));
subDataMID.ClockInformation = rawCellColumns(:, 1);
subDataMID.DataFileBasename = rawCellColumns(:, 2);
subDataMID.DisplayRefreshRate = cell2mat(rawNumericColumns(:, 5));
subDataMID.ExperimentVersion = rawCellColumns(:, 3);
subDataMID.Group = cell2mat(rawNumericColumns(:, 6));
subDataMID.Handedness = rawCellColumns(:, 4);
subDataMID.NARGUID = cell2mat(rawNumericColumns(:, 7));
subDataMID.PracticeRT = cell2mat(rawNumericColumns(:, 8));
subDataMID.RandomSeed = cell2mat(rawNumericColumns(:, 9));
subDataMID.RuntimeCapabilities = rawCellColumns(:, 5);
subDataMID.RuntimeVersion = rawCellColumns(:, 6);
subDataMID.RuntimeVersionExpected = rawCellColumns(:, 7);
subDataMID.SessionDate = rawCellColumns(:, 8);
subDataMID.SessionStartDateTimeUtc = rawCellColumns(:, 9);
subDataMID.SessionTime = dates{:, 1};
subDataMID.StudioVersion = rawCellColumns(:, 10);
subDataMID.TrialOrder = cell2mat(rawNumericColumns(:, 10));
subDataMID.triggercode = cell2mat(rawNumericColumns(:, 11));
subDataMID.Block = cell2mat(rawNumericColumns(:, 12));
subDataMID.BlockList = cell2mat(rawNumericColumns(:, 13));
subDataMID.BlockListCycle = cell2mat(rawNumericColumns(:, 14));
subDataMID.BlockListSample = cell2mat(rawNumericColumns(:, 15));
subDataMID.BlockTitle = cell2mat(rawNumericColumns(:, 16));
subDataMID.EndFixDuration = cell2mat(rawNumericColumns(:, 17));
subDataMID.EndFixDurationError = cell2mat(rawNumericColumns(:, 18));
subDataMID.EndFixFinishTime = cell2mat(rawNumericColumns(:, 19));
subDataMID.EndFixOffsetDelay = cell2mat(rawNumericColumns(:, 20));
subDataMID.EndFixOffsetTime = cell2mat(rawNumericColumns(:, 21));
subDataMID.EndFixOnsetDelay = cell2mat(rawNumericColumns(:, 22));
subDataMID.EndFixOnsetTime = cell2mat(rawNumericColumns(:, 23));
subDataMID.EndFixOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 24));
subDataMID.EndFixStartTime = cell2mat(rawNumericColumns(:, 25));
subDataMID.ProcedureBlock = rawCellColumns(:, 11);
subDataMID.RunningBlock = rawCellColumns(:, 12);
subDataMID.Trial = cell2mat(rawNumericColumns(:, 26));
subDataMID.GetReadyRTTime = cell2mat(rawNumericColumns(:, 27));
subDataMID.PeriodList = cell2mat(rawNumericColumns(:, 28));
subDataMID.PeriodListCycle = cell2mat(rawNumericColumns(:, 29));
subDataMID.PeriodListSample = cell2mat(rawNumericColumns(:, 30));
subDataMID.PrepTimeDuration = cell2mat(rawNumericColumns(:, 31));
subDataMID.PrepTimeDurationError = cell2mat(rawNumericColumns(:, 32));
subDataMID.PrepTimeFinishTime = cell2mat(rawNumericColumns(:, 33));
subDataMID.PrepTimeOffsetDelay = cell2mat(rawNumericColumns(:, 34));
subDataMID.PrepTimeOffsetTime = cell2mat(rawNumericColumns(:, 35));
subDataMID.PrepTimeOnsetDelay = cell2mat(rawNumericColumns(:, 36));
subDataMID.PrepTimeOnsetTime = cell2mat(rawNumericColumns(:, 37));
subDataMID.PrepTimeOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 38));
subDataMID.PrepTimeStartTime = cell2mat(rawNumericColumns(:, 39));
subDataMID.ProcedureTrial = rawCellColumns(:, 13);
subDataMID.RunningTrial = cell2mat(rawNumericColumns(:, 40));
subDataMID.Waiting4ScannerGE = cell2mat(rawNumericColumns(:, 41));
subDataMID.Waiting4ScannerGECycle = cell2mat(rawNumericColumns(:, 42));
subDataMID.Waiting4ScannerGESample = cell2mat(rawNumericColumns(:, 43));
subDataMID.SubTrial = cell2mat(rawNumericColumns(:, 44));
subDataMID.AnticipationDuration = cell2mat(rawNumericColumns(:, 45));
subDataMID.AnticipationDurationError = cell2mat(rawNumericColumns(:, 46));
subDataMID.AnticipationFinishTime = cell2mat(rawNumericColumns(:, 47));
subDataMID.AnticipationOffsetDelay = cell2mat(rawNumericColumns(:, 48));
subDataMID.AnticipationOffsetTime = cell2mat(rawNumericColumns(:, 49));
subDataMID.AnticipationOnsetDelay = cell2mat(rawNumericColumns(:, 50));
subDataMID.AnticipationOnsetTime = cell2mat(rawNumericColumns(:, 51));
subDataMID.AnticipationOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 52));
subDataMID.AnticipationStartTime = cell2mat(rawNumericColumns(:, 53));
subDataMID.AnticipationDuration1 = cell2mat(rawNumericColumns(:, 54));
subDataMID.Condition = rawCellColumns(:, 14);
subDataMID.Cue = rawCellColumns(:, 15);
subDataMID.CueCustomOnsetTime = cell2mat(rawNumericColumns(:, 55));
subDataMID.CueDuration = cell2mat(rawNumericColumns(:, 56));
subDataMID.CueDurationError = cell2mat(rawNumericColumns(:, 57));
subDataMID.CueFinishTime = cell2mat(rawNumericColumns(:, 58));
subDataMID.CueOffsetDelay = cell2mat(rawNumericColumns(:, 59));
subDataMID.CueOffsetTime = cell2mat(rawNumericColumns(:, 60));
subDataMID.CueOnsetDelay = cell2mat(rawNumericColumns(:, 61));
subDataMID.CueOnsetTime = cell2mat(rawNumericColumns(:, 62));
subDataMID.CueOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 63));
subDataMID.CueStartTime = cell2mat(rawNumericColumns(:, 64));
subDataMID.FeedbackDuration = cell2mat(rawNumericColumns(:, 65));
subDataMID.FeedbackDurationError = cell2mat(rawNumericColumns(:, 66));
subDataMID.FeedbackFinishTime = cell2mat(rawNumericColumns(:, 67));
subDataMID.FeedbackOffsetDelay = cell2mat(rawNumericColumns(:, 68));
subDataMID.FeedbackOffsetTime = cell2mat(rawNumericColumns(:, 69));
subDataMID.FeedbackOnsetDelay = cell2mat(rawNumericColumns(:, 70));
subDataMID.FeedbackOnsetTime = cell2mat(rawNumericColumns(:, 71));
subDataMID.FeedbackOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 72));
subDataMID.FeedbackStartTime = cell2mat(rawNumericColumns(:, 73));
subDataMID.FeedbackDuration1 = cell2mat(rawNumericColumns(:, 74));
subDataMID.meanrt = cell2mat(rawNumericColumns(:, 75));
subDataMID.moneyamt = cell2mat(rawNumericColumns(:, 76));
subDataMID.percentacc = cell2mat(rawNumericColumns(:, 77));
subDataMID.prbacc = cell2mat(rawNumericColumns(:, 78));
subDataMID.prbresp = cell2mat(rawNumericColumns(:, 79));
subDataMID.prbrt = cell2mat(rawNumericColumns(:, 80));
subDataMID.Probe = rawCellColumns(:, 16);
subDataMID.ProbeDuration = cell2mat(rawNumericColumns(:, 81));
subDataMID.ProbeDurationError = cell2mat(rawNumericColumns(:, 82));
subDataMID.ProbeFinishTime = cell2mat(rawNumericColumns(:, 83));
subDataMID.ProbeOffsetDelay = cell2mat(rawNumericColumns(:, 84));
subDataMID.ProbeOffsetTime = cell2mat(rawNumericColumns(:, 85));
subDataMID.ProbeOnsetDelay = cell2mat(rawNumericColumns(:, 86));
subDataMID.ProbeOnsetTime = cell2mat(rawNumericColumns(:, 87));
subDataMID.ProbeOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 88));
subDataMID.ProbeRESP = cell2mat(rawNumericColumns(:, 89));
subDataMID.ProbeRT = cell2mat(rawNumericColumns(:, 90));
subDataMID.ProbeRTTime = cell2mat(rawNumericColumns(:, 91));
subDataMID.ProbeStartTime = cell2mat(rawNumericColumns(:, 92));
subDataMID.ProbeTime = cell2mat(rawNumericColumns(:, 93));
subDataMID.ProcedureSubTrial = cell2mat(rawNumericColumns(:, 94));
subDataMID.ResponseCheck = cell2mat(rawNumericColumns(:, 95));
subDataMID.Result = cell2mat(rawNumericColumns(:, 96));
subDataMID.RunList = cell2mat(rawNumericColumns(:, 97));
subDataMID.RunListCycle = cell2mat(rawNumericColumns(:, 98));
subDataMID.RunListSample = cell2mat(rawNumericColumns(:, 99));
subDataMID.RunMoney = cell2mat(rawNumericColumns(:, 100));
subDataMID.RunningSubTrial = cell2mat(rawNumericColumns(:, 101));
subDataMID.TextDisplay1Duration = cell2mat(rawNumericColumns(:, 102));
subDataMID.TextDisplay1DurationError = cell2mat(rawNumericColumns(:, 103));
subDataMID.TextDisplay1FinishTime = cell2mat(rawNumericColumns(:, 104));
subDataMID.TextDisplay1OffsetDelay = cell2mat(rawNumericColumns(:, 105));
subDataMID.TextDisplay1OffsetTime = cell2mat(rawNumericColumns(:, 106));
subDataMID.TextDisplay1OnsetDelay = cell2mat(rawNumericColumns(:, 107));
subDataMID.TextDisplay1OnsetTime = cell2mat(rawNumericColumns(:, 108));
subDataMID.TextDisplay1OnsetToOnsetTime = cell2mat(rawNumericColumns(:, 109));
subDataMID.TextDisplay1StartTime = cell2mat(rawNumericColumns(:, 110));
subDataMID.TimeVersion10 = cell2mat(rawNumericColumns(:, 111));
subDataMID.TimeVersion2 = cell2mat(rawNumericColumns(:, 112));

% For code requiring serial dates (datenum) instead of datetime, uncomment
% the following line(s) below to return the imported dates as datenum(s).

% NDARINV1DZWFKCGMID.SessionTime=datenum(NDARINV1DZWFKCGMID.SessionTime);

