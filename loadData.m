addpath '/Users/allan/Documents/MATLAB/LLLT_EEG/eeglab2021.1'
eeglab
close all
clear
clc

%% Load dataset

fs = 512;
numSubjects_tls = 6;
numSubjects_pbo = 9;
numChannels = 64; % only channels corresponding to eeg mapping 
load('chanlocs.mat')
load('labels.mat')


%% Timing
% 2 min baseline -> (1-120 seconds)
% 8 min stimulation (121 - 480 seconds) 
    % stim pt 1 (121 - 240 seconds), stim pt 2 (241-480 seconds)
% 3 min post (481 - 780 seconds)

%% TLS
for sub = 1:numSubjects_tls
        try
            EEG = pop_loadset(['sub' num2str(sub) '_ICA.set'], '/Users/allan/Documents/MATLAB/LLLT_EEG/SubjectData/tls');
        % baseline: 60 to 120 sec (last min of baseline)
            tls_base(1:70,:,sub) = EEG.data(1:70,60*fs:120*fs);
        % first 4 min of stim: 121 to 240 sec
            tls_first(1:70,:,sub) = EEG.data(1:70,121*fs:240*fs);
        % second 4 min of stim: 241 to 480 sec
            tls_second(1:70,:,sub) = EEG.data(1:70,241*fs:480*fs);
        % recovery: 481 sec to 780 sec
            tls_rec(1:70,:,sub) = EEG.data(1:70,481*fs:780*fs);
    
        catch
            msg = ['Could not load sub ' num2str(sub) '_ICA.set'];
            disp(msg)
        end
end
%% PBO
for sub = 1:numSubjects_pbo
    try
        EEG = pop_loadset(['sub' num2str(sub) '_ICA.set'], '/Users/allan/Documents/MATLAB/LLLT_EEG/SubjectData/pbo');
        pbo_base(1:70,:,sub) = EEG.data(1:70,60*fs:120*fs);
        pbo_first(1:70,:,sub) = EEG.data(1:70,121*fs:240*fs);
        pbo_second(1:70,:,sub) = EEG.data(1:70,241*fs:480*fs);
        pbo_rec(1:70,:,sub) = EEG.data(1:70,481*fs:780*fs);
    catch
        msg = ['Could not load sub ' num2str(sub) '_ICA.set'];
        disp(msg)
    end 
end
