function NDARINV4BAP6ERLMIDcorrected = importSubjDataMID13table(filename, startRow, endRow)
%IMPORTFILE Import numeric data from a text file as a matrix.
%   NDARINV4BAP6ERLMIDCORRECTED = IMPORTFILE(FILENAME) Reads data from text
%   file FILENAME for the default selection.
%
%   NDARINV4BAP6ERLMIDCORRECTED = IMPORTFILE(FILENAME, STARTROW, ENDROW)
%   Reads data from rows STARTROW through ENDROW of text file FILENAME.
%
% Example:
%   NDARINV4BAP6ERLMIDcorrected = importfile('NDAR_INV4BAP6ERL_MID_corrected.txt', 3, 106);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2017/03/13 18:08:10

%% Initialize variables.
delimiter = {',','\t'};
if nargin<=2
    startRow = 3;
    endRow = inf;
end

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%[^\n\r]';

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

for col=[1,2,3,4,7,9,12,13,21,23,24,25,26,27,28,29,30,31,32,33,34,35,36,39,40,41,42,43,44,45,46,47,48,49,50,51,52,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135]
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
rawNumericColumns = raw(:, [1,2,3,4,7,9,12,13,21,23,24,25,26,27,28,29,30,31,32,33,34,35,36,39,40,41,42,43,44,45,46,47,48,49,50,51,52,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135]);
rawCellColumns = raw(:, [5,6,8,10,11,14,15,16,17,18,20,22,37,38,53,54,75,76]);


%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),rawNumericColumns); % Find non-numeric cells
rawNumericColumns(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
NDARINV4BAP6ERLMIDcorrected = table;
NDARINV4BAP6ERLMIDcorrected.ExperimentName = cell2mat(rawNumericColumns(:, 1));
NDARINV4BAP6ERLMIDcorrected.Subject = cell2mat(rawNumericColumns(:, 2));
NDARINV4BAP6ERLMIDcorrected.Session = cell2mat(rawNumericColumns(:, 3));
NDARINV4BAP6ERLMIDcorrected.Allowed = cell2mat(rawNumericColumns(:, 4));
NDARINV4BAP6ERLMIDcorrected.ClockInformation = rawCellColumns(:, 1);
NDARINV4BAP6ERLMIDcorrected.DataFileBasename = rawCellColumns(:, 2);
NDARINV4BAP6ERLMIDcorrected.DisplayRefreshRate = cell2mat(rawNumericColumns(:, 5));
NDARINV4BAP6ERLMIDcorrected.ExperimentVersion = rawCellColumns(:, 3);
NDARINV4BAP6ERLMIDcorrected.Group = cell2mat(rawNumericColumns(:, 6));
NDARINV4BAP6ERLMIDcorrected.Handedness = rawCellColumns(:, 4);
NDARINV4BAP6ERLMIDcorrected.NARGUID = rawCellColumns(:, 5);
NDARINV4BAP6ERLMIDcorrected.PracticeRT = cell2mat(rawNumericColumns(:, 7));
NDARINV4BAP6ERLMIDcorrected.RandomSeed = cell2mat(rawNumericColumns(:, 8));
NDARINV4BAP6ERLMIDcorrected.RuntimeCapabilities = rawCellColumns(:, 6);
NDARINV4BAP6ERLMIDcorrected.RuntimeVersion = rawCellColumns(:, 7);
NDARINV4BAP6ERLMIDcorrected.RuntimeVersionExpected = rawCellColumns(:, 8);
NDARINV4BAP6ERLMIDcorrected.SessionDate = rawCellColumns(:, 9);
NDARINV4BAP6ERLMIDcorrected.SessionStartDateTimeUtc = rawCellColumns(:, 10);
NDARINV4BAP6ERLMIDcorrected.SessionTime = dates{:, 1};
NDARINV4BAP6ERLMIDcorrected.StudioVersion = rawCellColumns(:, 11);
NDARINV4BAP6ERLMIDcorrected.TrialOrder = cell2mat(rawNumericColumns(:, 9));
NDARINV4BAP6ERLMIDcorrected.triggercode = rawCellColumns(:, 12);
NDARINV4BAP6ERLMIDcorrected.Block = cell2mat(rawNumericColumns(:, 10));
NDARINV4BAP6ERLMIDcorrected.BlockList = cell2mat(rawNumericColumns(:, 11));
NDARINV4BAP6ERLMIDcorrected.BlockListCycle = cell2mat(rawNumericColumns(:, 12));
NDARINV4BAP6ERLMIDcorrected.BlockListSample = cell2mat(rawNumericColumns(:, 13));
NDARINV4BAP6ERLMIDcorrected.BlockTitle = cell2mat(rawNumericColumns(:, 14));
NDARINV4BAP6ERLMIDcorrected.EndFixDuration = cell2mat(rawNumericColumns(:, 15));
NDARINV4BAP6ERLMIDcorrected.EndFixDurationError = cell2mat(rawNumericColumns(:, 16));
NDARINV4BAP6ERLMIDcorrected.EndFixFinishTime = cell2mat(rawNumericColumns(:, 17));
NDARINV4BAP6ERLMIDcorrected.EndFixOffsetDelay = cell2mat(rawNumericColumns(:, 18));
NDARINV4BAP6ERLMIDcorrected.EndFixOffsetTime = cell2mat(rawNumericColumns(:, 19));
NDARINV4BAP6ERLMIDcorrected.EndFixOnsetDelay = cell2mat(rawNumericColumns(:, 20));
NDARINV4BAP6ERLMIDcorrected.EndFixOnsetTime = cell2mat(rawNumericColumns(:, 21));
NDARINV4BAP6ERLMIDcorrected.EndFixOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 22));
NDARINV4BAP6ERLMIDcorrected.EndFixStartTime = cell2mat(rawNumericColumns(:, 23));
NDARINV4BAP6ERLMIDcorrected.ProcedureBlock = rawCellColumns(:, 13);
NDARINV4BAP6ERLMIDcorrected.RunningBlock = rawCellColumns(:, 14);
NDARINV4BAP6ERLMIDcorrected.Trial = cell2mat(rawNumericColumns(:, 24));
NDARINV4BAP6ERLMIDcorrected.GetReadyRTTime = cell2mat(rawNumericColumns(:, 25));
NDARINV4BAP6ERLMIDcorrected.PeriodList = cell2mat(rawNumericColumns(:, 26));
NDARINV4BAP6ERLMIDcorrected.PeriodListCycle = cell2mat(rawNumericColumns(:, 27));
NDARINV4BAP6ERLMIDcorrected.PeriodListSample = cell2mat(rawNumericColumns(:, 28));
NDARINV4BAP6ERLMIDcorrected.PrepTimeDuration = cell2mat(rawNumericColumns(:, 29));
NDARINV4BAP6ERLMIDcorrected.PrepTimeDurationError = cell2mat(rawNumericColumns(:, 30));
NDARINV4BAP6ERLMIDcorrected.PrepTimeFinishTime = cell2mat(rawNumericColumns(:, 31));
NDARINV4BAP6ERLMIDcorrected.PrepTimeOffsetDelay = cell2mat(rawNumericColumns(:, 32));
NDARINV4BAP6ERLMIDcorrected.PrepTimeOffsetTime = cell2mat(rawNumericColumns(:, 33));
NDARINV4BAP6ERLMIDcorrected.PrepTimeOnsetDelay = cell2mat(rawNumericColumns(:, 34));
NDARINV4BAP6ERLMIDcorrected.PrepTimeOnsetTime = cell2mat(rawNumericColumns(:, 35));
NDARINV4BAP6ERLMIDcorrected.PrepTimeOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 36));
NDARINV4BAP6ERLMIDcorrected.PrepTimeStartTime = cell2mat(rawNumericColumns(:, 37));
NDARINV4BAP6ERLMIDcorrected.ProcedureTrial = rawCellColumns(:, 15);
NDARINV4BAP6ERLMIDcorrected.RunningTrial = rawCellColumns(:, 16);
NDARINV4BAP6ERLMIDcorrected.SiemensPadOffsetDelay = cell2mat(rawNumericColumns(:, 38));
NDARINV4BAP6ERLMIDcorrected.SiemensPadOffsetTime = cell2mat(rawNumericColumns(:, 39));
NDARINV4BAP6ERLMIDcorrected.SiemensPadOnsetDelay = cell2mat(rawNumericColumns(:, 40));
NDARINV4BAP6ERLMIDcorrected.SiemensPadOnsetTime = cell2mat(rawNumericColumns(:, 41));
NDARINV4BAP6ERLMIDcorrected.SiemensPadOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 42));
NDARINV4BAP6ERLMIDcorrected.SiemensPadRTTime = cell2mat(rawNumericColumns(:, 43));
NDARINV4BAP6ERLMIDcorrected.Waiting4Scanner = cell2mat(rawNumericColumns(:, 44));
NDARINV4BAP6ERLMIDcorrected.Waiting4ScannerCycle = cell2mat(rawNumericColumns(:, 45));
NDARINV4BAP6ERLMIDcorrected.Waiting4ScannerSample = cell2mat(rawNumericColumns(:, 46));
NDARINV4BAP6ERLMIDcorrected.SubTrial = cell2mat(rawNumericColumns(:, 47));
NDARINV4BAP6ERLMIDcorrected.AnticipationDuration = cell2mat(rawNumericColumns(:, 48));
NDARINV4BAP6ERLMIDcorrected.AnticipationDurationError = cell2mat(rawNumericColumns(:, 49));
NDARINV4BAP6ERLMIDcorrected.AnticipationFinishTime = cell2mat(rawNumericColumns(:, 50));
NDARINV4BAP6ERLMIDcorrected.AnticipationOffsetDelay = cell2mat(rawNumericColumns(:, 51));
NDARINV4BAP6ERLMIDcorrected.AnticipationOffsetTime = cell2mat(rawNumericColumns(:, 52));
NDARINV4BAP6ERLMIDcorrected.AnticipationOnsetDelay = cell2mat(rawNumericColumns(:, 53));
NDARINV4BAP6ERLMIDcorrected.AnticipationOnsetTime = cell2mat(rawNumericColumns(:, 54));
NDARINV4BAP6ERLMIDcorrected.AnticipationOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 55));
NDARINV4BAP6ERLMIDcorrected.AnticipationStartTime = cell2mat(rawNumericColumns(:, 56));
NDARINV4BAP6ERLMIDcorrected.AnticipationDuration1 = cell2mat(rawNumericColumns(:, 57));
NDARINV4BAP6ERLMIDcorrected.Condition = rawCellColumns(:, 17);
NDARINV4BAP6ERLMIDcorrected.Cue = rawCellColumns(:, 18);
NDARINV4BAP6ERLMIDcorrected.CueCustomOnsetTime = cell2mat(rawNumericColumns(:, 58));
NDARINV4BAP6ERLMIDcorrected.CueDuration = cell2mat(rawNumericColumns(:, 59));
NDARINV4BAP6ERLMIDcorrected.CueDurationError = cell2mat(rawNumericColumns(:, 60));
NDARINV4BAP6ERLMIDcorrected.CueFinishTime = cell2mat(rawNumericColumns(:, 61));
NDARINV4BAP6ERLMIDcorrected.CueOffsetDelay = cell2mat(rawNumericColumns(:, 62));
NDARINV4BAP6ERLMIDcorrected.CueOffsetTime = cell2mat(rawNumericColumns(:, 63));
NDARINV4BAP6ERLMIDcorrected.CueOnsetDelay = cell2mat(rawNumericColumns(:, 64));
NDARINV4BAP6ERLMIDcorrected.CueOnsetTime = cell2mat(rawNumericColumns(:, 65));
NDARINV4BAP6ERLMIDcorrected.CueOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 66));
NDARINV4BAP6ERLMIDcorrected.CueStartTime = cell2mat(rawNumericColumns(:, 67));
NDARINV4BAP6ERLMIDcorrected.FeedbackDuration = cell2mat(rawNumericColumns(:, 68));
NDARINV4BAP6ERLMIDcorrected.FeedbackDurationError = cell2mat(rawNumericColumns(:, 69));
NDARINV4BAP6ERLMIDcorrected.FeedbackFinishTime = cell2mat(rawNumericColumns(:, 70));
NDARINV4BAP6ERLMIDcorrected.FeedbackOffsetDelay = cell2mat(rawNumericColumns(:, 71));
NDARINV4BAP6ERLMIDcorrected.FeedbackOffsetTime = cell2mat(rawNumericColumns(:, 72));
NDARINV4BAP6ERLMIDcorrected.FeedbackOnsetDelay = cell2mat(rawNumericColumns(:, 73));
NDARINV4BAP6ERLMIDcorrected.FeedbackOnsetTime = cell2mat(rawNumericColumns(:, 74));
NDARINV4BAP6ERLMIDcorrected.FeedbackOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 75));
NDARINV4BAP6ERLMIDcorrected.FeedbackStartTime = cell2mat(rawNumericColumns(:, 76));
NDARINV4BAP6ERLMIDcorrected.FeedbackDuration1 = cell2mat(rawNumericColumns(:, 77));
NDARINV4BAP6ERLMIDcorrected.meanrt = cell2mat(rawNumericColumns(:, 78));
NDARINV4BAP6ERLMIDcorrected.moneyamt = cell2mat(rawNumericColumns(:, 79));
NDARINV4BAP6ERLMIDcorrected.percentacc = cell2mat(rawNumericColumns(:, 80));
NDARINV4BAP6ERLMIDcorrected.prbacc = cell2mat(rawNumericColumns(:, 81));
NDARINV4BAP6ERLMIDcorrected.prbresp = cell2mat(rawNumericColumns(:, 82));
NDARINV4BAP6ERLMIDcorrected.prbrt = cell2mat(rawNumericColumns(:, 83));
NDARINV4BAP6ERLMIDcorrected.Probe = cell2mat(rawNumericColumns(:, 84));
NDARINV4BAP6ERLMIDcorrected.ProbeDuration = cell2mat(rawNumericColumns(:, 85));
NDARINV4BAP6ERLMIDcorrected.ProbeDurationError = cell2mat(rawNumericColumns(:, 86));
NDARINV4BAP6ERLMIDcorrected.ProbeFinishTime = cell2mat(rawNumericColumns(:, 87));
NDARINV4BAP6ERLMIDcorrected.ProbeOffsetDelay = cell2mat(rawNumericColumns(:, 88));
NDARINV4BAP6ERLMIDcorrected.ProbeOffsetTime = cell2mat(rawNumericColumns(:, 89));
NDARINV4BAP6ERLMIDcorrected.ProbeOnsetDelay = cell2mat(rawNumericColumns(:, 90));
NDARINV4BAP6ERLMIDcorrected.ProbeOnsetTime = cell2mat(rawNumericColumns(:, 91));
NDARINV4BAP6ERLMIDcorrected.ProbeOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 92));
NDARINV4BAP6ERLMIDcorrected.ProbeRESP = cell2mat(rawNumericColumns(:, 93));
NDARINV4BAP6ERLMIDcorrected.ProbeRT = cell2mat(rawNumericColumns(:, 94));
NDARINV4BAP6ERLMIDcorrected.ProbeRTTime = cell2mat(rawNumericColumns(:, 95));
NDARINV4BAP6ERLMIDcorrected.ProbeStartTime = cell2mat(rawNumericColumns(:, 96));
NDARINV4BAP6ERLMIDcorrected.ProbeTime = cell2mat(rawNumericColumns(:, 97));
NDARINV4BAP6ERLMIDcorrected.ProcedureSubTrial = cell2mat(rawNumericColumns(:, 98));
NDARINV4BAP6ERLMIDcorrected.ResponseCheck = cell2mat(rawNumericColumns(:, 99));
NDARINV4BAP6ERLMIDcorrected.Result = cell2mat(rawNumericColumns(:, 100));
NDARINV4BAP6ERLMIDcorrected.RunList = cell2mat(rawNumericColumns(:, 101));
NDARINV4BAP6ERLMIDcorrected.RunListCycle = cell2mat(rawNumericColumns(:, 102));
NDARINV4BAP6ERLMIDcorrected.RunListSample = cell2mat(rawNumericColumns(:, 103));
NDARINV4BAP6ERLMIDcorrected.RunMoney = cell2mat(rawNumericColumns(:, 104));
NDARINV4BAP6ERLMIDcorrected.RunningSubTrial = cell2mat(rawNumericColumns(:, 105));
NDARINV4BAP6ERLMIDcorrected.TextDisplay1Duration = cell2mat(rawNumericColumns(:, 106));
NDARINV4BAP6ERLMIDcorrected.TextDisplay1DurationError = cell2mat(rawNumericColumns(:, 107));
NDARINV4BAP6ERLMIDcorrected.TextDisplay1FinishTime = cell2mat(rawNumericColumns(:, 108));
NDARINV4BAP6ERLMIDcorrected.TextDisplay1OffsetDelay = cell2mat(rawNumericColumns(:, 109));
NDARINV4BAP6ERLMIDcorrected.TextDisplay1OffsetTime = cell2mat(rawNumericColumns(:, 110));
NDARINV4BAP6ERLMIDcorrected.TextDisplay1OnsetDelay = cell2mat(rawNumericColumns(:, 111));
NDARINV4BAP6ERLMIDcorrected.TextDisplay1OnsetTime = cell2mat(rawNumericColumns(:, 112));
NDARINV4BAP6ERLMIDcorrected.TextDisplay1OnsetToOnsetTime = cell2mat(rawNumericColumns(:, 113));
NDARINV4BAP6ERLMIDcorrected.TextDisplay1StartTime = cell2mat(rawNumericColumns(:, 114));
NDARINV4BAP6ERLMIDcorrected.TimeVersion14 = cell2mat(rawNumericColumns(:, 115));
NDARINV4BAP6ERLMIDcorrected.TimeVersion9 = cell2mat(rawNumericColumns(:, 116));

% For code requiring serial dates (datenum) instead of datetime, uncomment
% the following line(s) below to return the imported dates as datenum(s).

% NDARINV4BAP6ERLMIDcorrected.SessionTime=datenum(NDARINV4BAP6ERLMIDcorrected.SessionTime);

