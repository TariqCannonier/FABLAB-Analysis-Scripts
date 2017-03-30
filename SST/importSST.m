function SST = importSST(filename, startRow, endRow)
%IMPORTFILE Import numeric data from a text file as a matrix.
%   SST = IMPORTFILE(FILENAME) Reads data from text file FILENAME for the
%   default selection.
%
%   SST = IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data from rows
%   STARTROW through ENDROW of text file FILENAME.
%
% Example:
%   SST = importfile('2HYAENE6_SST.csv', 3, 368);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2017/03/02 17:08:56

%% Initialize variables.
delimiter = {',','\t'};
if nargin<=2
    startRow = 3;
    endRow = inf;
end

%% Read columns of data as text:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%q%[^\n\r]';

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

for col=[1,2,3,4,7,9,11,13,14,22,23,26,27,28,32,33,34,35,36,37,38,39,40,41,42,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,81,82,83,84,85,86,87,89,90,91,92,94,95,96,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128]
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

dateFormats = {'MM/dd/yyyy', 'HH:mm:ss'};
dateFormatIndex = 1;
blankDates = cell(1,size(raw,2));
anyBlankDates = false(size(raw,1),1);
invalidDates = cell(1,size(raw,2));
anyInvalidDates = false(size(raw,1),1);
for col=[18,20]% Convert the contents of columns with dates to MATLAB datetimes using the specified date format.
    try
        dates{col} = datetime(dataArray{col}, 'Format', dateFormats{col==[18,20]}, 'InputFormat', dateFormats{col==[18,20]}); %#ok<SAGROW>
    catch
        try
            % Handle dates surrounded by quotes
            dataArray{col} = cellfun(@(x) x(2:end-1), dataArray{col}, 'UniformOutput', false);
            dates{col} = datetime(dataArray{col}, 'Format', dateFormats{col==[18,20]}, 'InputFormat', dateFormats{col==[18,20]}); %%#ok<SAGROW>
        catch
            dates{col} = repmat(datetime([NaN NaN NaN]), size(dataArray{col})); %#ok<SAGROW>
        end
    end
    
    dateFormatIndex = dateFormatIndex + 1;
    blankDates{col} = cellfun(@isempty, dataArray{col});
    anyBlankDates = blankDates{col} | anyBlankDates;
    invalidDates{col} = isnan(dates{col}.Hour) - blankDates{col};
    anyInvalidDates = invalidDates{col} | anyInvalidDates;
end
dates = dates(:,[18,20]);
blankDates = blankDates(:,[18,20]);
invalidDates = invalidDates(:,[18,20]);

%% Split data into numeric and cell columns.
rawNumericColumns = raw(:, [1,2,3,4,7,9,11,13,14,22,23,26,27,28,32,33,34,35,36,37,38,39,40,41,42,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,81,82,83,84,85,86,87,89,90,91,92,94,95,96,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128]);
rawCellColumns = raw(:, [5,6,8,10,12,15,16,17,19,21,24,25,29,30,31,43,44,45,46,47,48,49,50,51,79,80,88,93,97]);


%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),rawNumericColumns); % Find non-numeric cells
rawNumericColumns(R) = {NaN}; % Replace non-numeric cells

%% Create output variable
SST = table;
SST.ExperimentName = cell2mat(rawNumericColumns(:, 1));
SST.Subject = cell2mat(rawNumericColumns(:, 2));
SST.Session = cell2mat(rawNumericColumns(:, 3));
SST.Allowed = cell2mat(rawNumericColumns(:, 4));
SST.ClockInformation = rawCellColumns(:, 1);
SST.DataFileBasename = rawCellColumns(:, 2);
SST.DisplayRefreshRate = cell2mat(rawNumericColumns(:, 5));
SST.ExperimentVersion = rawCellColumns(:, 3);
SST.Group = cell2mat(rawNumericColumns(:, 6));
SST.Handedness = rawCellColumns(:, 4);
SST.leftarrow = cell2mat(rawNumericColumns(:, 7));
SST.NARGUID = rawCellColumns(:, 5);
SST.RandomSeed = cell2mat(rawNumericColumns(:, 8));
SST.rightarrow = cell2mat(rawNumericColumns(:, 9));
SST.RuntimeCapabilities = rawCellColumns(:, 6);
SST.RuntimeVersion = rawCellColumns(:, 7);
SST.RuntimeVersionExpected = rawCellColumns(:, 8);
SST.SessionDate = dates{:, 1};
SST.SessionStartDateTimeUtc = rawCellColumns(:, 9);
SST.SessionTime = dates{:, 2};
SST.StudioVersion = rawCellColumns(:, 10);
SST.triggercode = cell2mat(rawNumericColumns(:, 10));
SST.Block = cell2mat(rawNumericColumns(:, 11));
SST.ProcedureBlock = rawCellColumns(:, 11);
SST.RunningBlock = rawCellColumns(:, 12);
SST.TestBlockA = cell2mat(rawNumericColumns(:, 12));
SST.TestBlockACycle = cell2mat(rawNumericColumns(:, 13));
SST.TestBlockASample = cell2mat(rawNumericColumns(:, 14));
SST.TestBlockB = rawCellColumns(:, 13);
SST.TestBlockBCycle = rawCellColumns(:, 14);
SST.TestBlockBSample = rawCellColumns(:, 15);
SST.Trial = cell2mat(rawNumericColumns(:, 15));
SST.BeginFixDuration = cell2mat(rawNumericColumns(:, 16));
SST.BeginFixDurationError = cell2mat(rawNumericColumns(:, 17));
SST.BeginFixFinishTime = cell2mat(rawNumericColumns(:, 18));
SST.BeginFixOffsetDelay = cell2mat(rawNumericColumns(:, 19));
SST.BeginFixOffsetTime = cell2mat(rawNumericColumns(:, 20));
SST.BeginFixOnsetDelay = cell2mat(rawNumericColumns(:, 21));
SST.BeginFixOnsetTime = cell2mat(rawNumericColumns(:, 22));
SST.BeginFixOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 23));
SST.BeginFixStartTime = cell2mat(rawNumericColumns(:, 24));
SST.CorrectAnswer = cell2mat(rawNumericColumns(:, 25));
SST.EndFixDuration = rawCellColumns(:, 16);
SST.EndFixDurationError = rawCellColumns(:, 17);
SST.EndFixFinishTime = rawCellColumns(:, 18);
SST.EndFixOffsetDelay = rawCellColumns(:, 19);
SST.EndFixOffsetTime = rawCellColumns(:, 20);
SST.EndFixOnsetDelay = rawCellColumns(:, 21);
SST.EndFixOnsetTime = rawCellColumns(:, 22);
SST.EndFixOnsetToOnsetTime = rawCellColumns(:, 23);
SST.EndFixStartTime = rawCellColumns(:, 24);
SST.FixDuration = cell2mat(rawNumericColumns(:, 26));
SST.FixDurationError = cell2mat(rawNumericColumns(:, 27));
SST.FixFinishTime = cell2mat(rawNumericColumns(:, 28));
SST.FixOffsetDelay = cell2mat(rawNumericColumns(:, 29));
SST.FixOffsetTime = cell2mat(rawNumericColumns(:, 30));
SST.FixOnsetDelay = cell2mat(rawNumericColumns(:, 31));
SST.FixOnsetTime = cell2mat(rawNumericColumns(:, 32));
SST.FixOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 33));
SST.FixRESP = cell2mat(rawNumericColumns(:, 34));
SST.FixRT = cell2mat(rawNumericColumns(:, 35));
SST.FixStartTime = cell2mat(rawNumericColumns(:, 36));
SST.FixDur = cell2mat(rawNumericColumns(:, 37));
SST.GoACC = cell2mat(rawNumericColumns(:, 38));
SST.GoCRESP = cell2mat(rawNumericColumns(:, 39));
SST.GoDuration = cell2mat(rawNumericColumns(:, 40));
SST.GoDurationError = cell2mat(rawNumericColumns(:, 41));
SST.GoFinishTime = cell2mat(rawNumericColumns(:, 42));
SST.GoOffsetDelay = cell2mat(rawNumericColumns(:, 43));
SST.GoOffsetTime = cell2mat(rawNumericColumns(:, 44));
SST.GoOnsetDelay = cell2mat(rawNumericColumns(:, 45));
SST.GoOnsetTime = cell2mat(rawNumericColumns(:, 46));
SST.GoOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 47));
SST.GoRESP = cell2mat(rawNumericColumns(:, 48));
SST.GoRT = cell2mat(rawNumericColumns(:, 49));
SST.GoRTTime = cell2mat(rawNumericColumns(:, 50));
SST.GoStartTime = cell2mat(rawNumericColumns(:, 51));
SST.Jitter = cell2mat(rawNumericColumns(:, 52));
SST.ProcedureTrial = rawCellColumns(:, 25);
SST.RunningTrial = rawCellColumns(:, 26);
SST.SiemensPadOffsetDelay = cell2mat(rawNumericColumns(:, 53));
SST.SiemensPadOffsetTime = cell2mat(rawNumericColumns(:, 54));
SST.SiemensPadOnsetDelay = cell2mat(rawNumericColumns(:, 55));
SST.SiemensPadOnsetTime = cell2mat(rawNumericColumns(:, 56));
SST.SiemensPadOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 57));
SST.SiemensPadRTTime = cell2mat(rawNumericColumns(:, 58));
SST.SSDACC = cell2mat(rawNumericColumns(:, 59));
SST.SSDCRESP = rawCellColumns(:, 27);
SST.SSDDurationError = cell2mat(rawNumericColumns(:, 60));
SST.SSDOnsetDelay = cell2mat(rawNumericColumns(:, 61));
SST.SSDOnsetTime = cell2mat(rawNumericColumns(:, 62));
SST.SSDOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 63));
SST.SSDRESP = rawCellColumns(:, 28);
SST.SSDRT = cell2mat(rawNumericColumns(:, 64));
SST.SSDRTTime = cell2mat(rawNumericColumns(:, 65));
SST.SSDDur = cell2mat(rawNumericColumns(:, 66));
SST.Stimulus = rawCellColumns(:, 29);
SST.Stop_nback = cell2mat(rawNumericColumns(:, 67));
SST.StopDur = cell2mat(rawNumericColumns(:, 68));
SST.StopSignalACC = cell2mat(rawNumericColumns(:, 69));
SST.StopSignalCRESP = cell2mat(rawNumericColumns(:, 70));
SST.StopSignalDuration = cell2mat(rawNumericColumns(:, 71));
SST.StopSignalDurationError = cell2mat(rawNumericColumns(:, 72));
SST.StopSignalFinishTime = cell2mat(rawNumericColumns(:, 73));
SST.StopSignalOffsetDelay = cell2mat(rawNumericColumns(:, 74));
SST.StopSignalOffsetTime = cell2mat(rawNumericColumns(:, 75));
SST.StopSignalOnsetDelay = cell2mat(rawNumericColumns(:, 76));
SST.StopSignalOnsetTime = cell2mat(rawNumericColumns(:, 77));
SST.StopSignalOnsetToOnsetTime = cell2mat(rawNumericColumns(:, 78));
SST.StopSignalRESP = cell2mat(rawNumericColumns(:, 79));
SST.StopSignalRT = cell2mat(rawNumericColumns(:, 80));
SST.StopSignalRTTime = cell2mat(rawNumericColumns(:, 81));
SST.StopSignalStartTime = cell2mat(rawNumericColumns(:, 82));
SST.TestListA = cell2mat(rawNumericColumns(:, 83));
SST.TestListACycle = cell2mat(rawNumericColumns(:, 84));
SST.TestListASample = cell2mat(rawNumericColumns(:, 85));
SST.TestListB = cell2mat(rawNumericColumns(:, 86));
SST.TestListBCycle = cell2mat(rawNumericColumns(:, 87));
SST.TestListBSample = cell2mat(rawNumericColumns(:, 88));
SST.TrialCode = cell2mat(rawNumericColumns(:, 89));
SST.Wait4ScannerRTTime = cell2mat(rawNumericColumns(:, 90));
SST.Wait4ScannerBRTTime = cell2mat(rawNumericColumns(:, 91));
SST.Waiting4Scanner = cell2mat(rawNumericColumns(:, 92));
SST.Waiting4ScannerCycle = cell2mat(rawNumericColumns(:, 93));
SST.Waiting4ScannerSample = cell2mat(rawNumericColumns(:, 94));
SST.Waiting4ScannerB = cell2mat(rawNumericColumns(:, 95));
SST.Waiting4ScannerBCycle = cell2mat(rawNumericColumns(:, 96));
SST.Waiting4ScannerBSample = cell2mat(rawNumericColumns(:, 97));

% For code requiring serial dates (datenum) instead of datetime, uncomment
% the following line(s) below to return the imported dates as datenum(s).

% SST.SessionDate=datenum(SST.SessionDate);
% SST.SessionTime=datenum(SST.SessionTime);

