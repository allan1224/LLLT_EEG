clear all
close all


%% Define your working folder
myFolder = '/Users/allan/Documents/MATLAB/LLLT_EEG'; 
if ~isdir(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end

%% Load files to construct data

filePattern = fullfile(myFolder, '*.set');
matFiles = dir(filePattern);

Subjects(length(matFiles)).subject = length(matFiles);

for k = 1:length(matFiles)
    baseFileName = matFiles(k).name;
    fullFileName = fullfile(myFolder, baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    matData(k) = load('-mat',fullFileName);
    
    % Laser on: 300 seconds * 512 samples/second = 153600 sample
    % Laser off: 780 seconds * 512 samples/second = 399360 sample
    
    % Pre range- start:153600 
    % During range- 15361:399360
    % Post range- 399361:end

    % Add event markers
    % 100 = laser start
    % 101 = laser stop
    events.TYP = [100,101]';
    events.POS = [153600,399360]'; 

    % Add subject data
    subjectData.eeg = matData(k).data;
    subjectData.events = events;
    subjectData.fs = 512;

    Subjects(k).subject = subjectData;
  
end




