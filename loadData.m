addpath '/Users/allan/Documents/MATLAB/LLLT_EEG/eeglab2021.1'
eeglab
close all
clear
clc

%% Load dataset

fs = 512;
numSubjects_tls = 32;
numSubjects_pbo = 35;
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
            EEG = pop_loadset(['subject' num2str(sub) '_tls_ica.set'], '/Users/allan/Documents/MATLAB/LLLT_EEG/SubjectData/tls');
            
            % resample if srate != fs
            if(EEG.srate ~= fs)
                EEG = pop_resample(EEG,fs);
            end
            disp(EEG.srate)
            
            % baseline: 60 to 120 sec (last min of baseline)
            tls_base(1:64,:,sub) = EEG.data(1:64,60*fs:120*fs);
            % first 4 min of stim: 121 to 240 sec
            tls_first(1:64,:,sub) = EEG.data(1:64,121*fs:240*fs);
            % second 4 min of stim: 241 to 480 sec
            tls_second(1:64,:,sub) = EEG.data(1:64,241*fs:480*fs);
            % recovery: 481 sec to 780 sec
            tls_rec(1:64,:,sub) = EEG.data(1:64,481*fs:780*fs);
    catch
        
        msg = ['Error: cannot load data for subject:',  num2str(sub)];
        warning(msg)
        error_tls(sub) = sub;
        
    end
       
       
end
%% PBO
for sub = 1:numSubjects_pbo
    try
        EEG = pop_loadset(['subject' num2str(sub) '_pbo_ica.set'], '/Users/allan/Documents/MATLAB/LLLT_EEG/SubjectData/pbo');
        if(EEG.srate ~= 512)
            EEG = pop_resample(EEG,fs);
        end
        disp(EEG.srate)
        pbo_base(1:64,:,sub) = EEG.data(1:64,60*fs:120*fs);
        pbo_first(1:64,:,sub) = EEG.data(1:64,121*fs:240*fs);
        pbo_second(1:64,:,sub) = EEG.data(1:64,241*fs:480*fs);
        pbo_rec(1:64,:,sub) = EEG.data(1:64,481*fs:780*fs);
    catch
        msg = ['Error: cannot load data for subject:',  num2str(sub)];
        warning(msg)
        error_pbo(sub) = sub;
    end
        
    
end

%% Get rid of bad files and remap numSubjects

error_tls = error_tls(error_tls~=0);
error_pbo = error_pbo(error_pbo~=0);

for sub = 1:numSubjects_tls
    if ~ismember(sub,error_tls)
       newSubs_tls(sub) = sub ; 
    end   
end
[newSubs_tls] = newSubs_tls(newSubs_tls~=0);

for sub = 1:numSubjects_pbo
    if ~ismember(sub,error_pbo)
       newSubs_pbo(sub) = sub; 
    end   
end
[newSubs_pbo] = newSubs_pbo(newSubs_pbo~=0);

