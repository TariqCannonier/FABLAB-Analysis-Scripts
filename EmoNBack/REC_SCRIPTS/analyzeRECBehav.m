format longg

%initialize the csv output file
fidREC = fopen(fullfile(outputDir,['EmoNback_RECBehaviorABCD_',datestr(now,'yyyymmdd'),'.csv']),'a');
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
else foo2='2016';
end
SessionDate = [foo(1:end-4) foo2];


%Run scripts to create remaining variables
calcRECBehav;

%Define variable type e.g. character, numeric, cell
%if numeric, specify digits to print
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
