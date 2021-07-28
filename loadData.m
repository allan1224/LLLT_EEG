addpath '/Users/allan/Documents/MATLAB/LLLT_EEG/eeglab2021.0'
eeglab
close all
clear
clc

%% Load dataset

fs = 512;
numSubjects_tls = 5;
numSubjects_pbo = 5;
numChannels = 70;
load('chanlocs.mat', 'labels')

for sub = 1:numSubjects_tls
    EEG = pop_loadset(['sub' num2str(sub) '_ICA.set'], '/Users/allan/Documents/MATLAB/LLLT_EEG/SubjectData/tls');
    % baseline: 240 to 300 sec (last min of baseline)
    tls_base(1:70,:,sub) = EEG.data(1:70,240*fs:300*fs);
    % first 4 min of stim: 301 to 540 sec
    tls_first(1:70,:,sub) = EEG.data(1:70,301*fs:540*fs);
    % second 4 min of stim: 541 to 780 sec
    tls_second(1:70,:,sub) = EEG.data(1:70,541*fs:780*fs);
    % recovery: 781 sec to 900 sec (first 2 min of recovery)
    % use 430081 bc it is currently the size of the smallest dataset
    % in order to stay consistent so all the data has the same length
    tls_rec(1:70,:,sub) = EEG.data(1:70,781*fs:430081);
end

for sub = 1:numSubjects_pbo
    EEG = pop_loadset(['sub' num2str(sub) '_ICA.set'], '/Users/allan/Documents/MATLAB/LLLT_EEG/SubjectData/pbo');
    pbo_base(1:70,:,sub) = EEG.data(1:70,240*fs:300*fs);
    pbo_first(1:70,:,sub) = EEG.data(1:70,301*fs:540*fs);
    pbo_second(1:70,:,sub) = EEG.data(1:70,541*fs:780*fs);
    pbo_rec(1:70,:,sub) = EEG.data(1:70,781*fs:430081);
end
