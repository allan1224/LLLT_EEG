%% PSD

% PSD across each frequency component from 0-256 Hz 
% Each frequency component in f1 is normalized 
% f1: vector of frequency values from 0 to fs/2, Hz

% segment length: 2048 samples 
% overlap length: 1536 samples, 75% olap
% DFT length: 2048 points

for sub = 1:numSubjects_tls
    for chan = 1:numChannels
        [pxx_tls_base(chan,:,sub) f1] = pwelch(tls_base(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
        [pxx_tls_base(chan,:,sub) f1] = pwelch(tls_base(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
        [pxx_tls_first(chan,:,sub) f1] = pwelch(tls_first(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
        [pxx_tls_second(chan,:,sub) f1] = pwelch(tls_second(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
        [pxx_tls_rec(chan,:,sub) f1] = pwelch(tls_rec(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
    end
end

for sub = 1:numSubjects_pbo
    for chan = 1:numChannels
        [pxx_pbo_base(chan,:,sub) f1] = pwelch(pbo_base(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
        [pxx_pbo_first(chan,:,sub) f1] = pwelch(pbo_first(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
        [pxx_pbo_second(chan,:,sub) f1] = pwelch(pbo_second(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
        [pxx_pbo_rec(chan,:,sub) f1] = pwelch(pbo_rec(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd'); 
    end
end

%% PLOT PSD  
%% Average of subjects across a given channel 
channel = 34;
figure; 
plot(f1,10*log10(mean(pxx_tls_second(channel,:,newSubs_tls),3)), 'color','r')
hold on;
plot(f1,10*log10(mean(pxx_tls_base(channel,:,newSubs_tls),3)), 'color','b')
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')
xlim([1 70])
title("Average of subjects PSD", labels{channel})
legend('rec','baseline')
%% For each subject for each channel
channel = 34;
subject = 2;
figure;
plot(f1,10*log10(pxx_tls_rec(channel,:,subject)), 'color','r')
hold on;
plot(f1,10*log10(pxx_tls_base(channel,:,subject)), 'color','b')
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')
xlim([1 70])
title("PSD - subject " + subject, labels{channel})
legend('rec','baseline')

%% Percent change in PSD relative to baseline
% Percent Change = (New Number-Original Number) / Original Number
% Normlization of PSD per subject per channel
nodB_nor_pxx_tls_first = 100*((pxx_tls_first./pxx_tls_base)-1);
nodB_nor_pxx_pbo_first = 100*((pxx_pbo_first./pxx_pbo_base)-1);
nodB_nor_pxx_tls_second = 100*((pxx_tls_second./pxx_tls_base)-1);
nodB_nor_pxx_pbo_second = 100*((pxx_pbo_second./pxx_pbo_base)-1);
nodB_nor_pxx_tls_rec = 100*((pxx_tls_rec./pxx_tls_base)-1);
nodB_nor_pxx_pbo_rec = 100*((pxx_pbo_rec./pxx_pbo_base)-1);

%% PLOT Change in PSD at each frequency component (Allan way)
%% Average of subjects across a given channel 
channel = 34;
figure;
plot(f1,(mean(nodB_nor_pxx_tls_second(channel,:,newSubs_tls),3)), 'color','r')
hold on;
plot(f1,(mean(nodB_nor_pxx_pbo_second(channel,:,newSubs_pbo),3)), 'color','b')
xlabel('Frequency (Hz)')
ylabel('% change')
xlim([1 40])
title("Average Change in PSD across subjects", labels(channel))
legend('TLS min 4-8','PBO min 4-8')

%% For each subject for each channel - TLS
channel = 34;
subject = 5;
figure;
plot(f1,(nodB_nor_pxx_tls_rec(channel,:,subject)), 'color','b')
xlabel('Frequency (Hz)')
ylabel('% change')
xlim([1 40])
title("Change in PSD TLS rec - subject " + subject, labels(channel))
%% For each subject for reach channel - PBO
channel = 34;
subject = 2;
figure;
plot(f1,(nodB_nor_pxx_pbo_rec(channel,:,subject)), 'color','r')
xlabel('Frequency (Hz)')
ylabel('% change')
xlim([1 40])
title("Change in PSD PBO rec - subject " + subject, labels(channel))

%% PSD Sub-bands
% Calculate DWT beforehand

for sub = 1:newSubs_tls
    for chan = 1:numChannels
        
        % PSD alpha base
        [pxx_aSig_tls_base(chan,:,sub) f2] = pwelch(aSig_tls_base(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
        [pxx_aSig_pbo_base(chan,:,sub) f2] = pwelch(aSig_pbo_base(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
        % PSD alapha first
        [pxx_aSig_tls_first(chan,:,sub) f2] = pwelch(aSig_tls_first(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
        [pxx_aSig_pbo_first(chan,:,sub) f2] = pwelch(aSig_pbo_first(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
        % PSD alapha second
        [pxx_aSig_tls_second(chan,:,sub) f2] = pwelch(aSig_tls_second(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
        [pxx_aSig_pbo_second(chan,:,sub) f2] = pwelch(aSig_pbo_second(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
        % PSD alapha rec
        [pxx_aSig_tls_rec(chan,:,sub) f2] = pwelch(aSig_tls_rec(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
        [pxx_aSig_pbo_rec(chan,:,sub) f2] = pwelch(aSig_pbo_rec(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
    
    end
end

% PSD Subband changes relative to baseline
% Percent Change = (New Number-Original Number) / Original Number

change_pxx_aSig_tls_second = (pxx_aSig_tls_second./pxx_aSig_tls_base)-1;
change_pxx_aSig_pbo_second = (pxx_aSig_pbo_second./pxx_aSig_pbo_base)-1;

