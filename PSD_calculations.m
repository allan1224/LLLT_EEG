%% PSD
% PSD across each frequency component from 0-256 Hz 
% Each frequency component in f1 is normalized

for sub = 1:numSubjects_tls
    for chan = 1:numChannels

        [pxx_tls_base(chan,:,sub) f1] = pwelch(tls_base(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
        [pxx_pbo_base(chan,:,sub) f1] = pwelch(pbo_base(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');

        [pxx_tls_first(chan,:,sub) f1] = pwelch(tls_first(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
        [pxx_pbo_first(chan,:,sub) f1] = pwelch(pbo_first(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
         
        [pxx_tls_second(chan,:,sub) f1] = pwelch(tls_second(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
        [pxx_pbo_second(chan,:,sub) f1] = pwelch(pbo_second(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
         
        [pxx_tls_rec(chan,:,sub) f1] = pwelch(tls_rec(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
        [pxx_pbo_rec(chan,:,sub) f1] = pwelch(pbo_rec(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
    end
end

%% PSD changes relative to baseline
% Percent Change = (New Number-Original Number) / Original Number

nodB_nor_pxx_tls_first = (pxx_tls_first./pxx_tls_base)-1;
nodB_nor_pxx_pbo_first = (pxx_pbo_first./pxx_pbo_base)-1;
 
nodB_nor_pxx_tls_second = (pxx_tls_second./pxx_tls_base)-1;
nodB_nor_pxx_pbo_second = (pxx_pbo_second./pxx_pbo_base)-1;
 
nodB_nor_pxx_tls_rec = (pxx_tls_rec./pxx_tls_base)-1;
nodB_nor_pxx_pbo_rec = (pxx_pbo_rec./pxx_pbo_base)-1;


%% PSD Sub-bands
% Calculate DWT beforehand

for sub = 1:numSubjects_tls
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

%% PSD Subband changes relative to baseline
% Percent Change = (New Number-Original Number) / Original Number

change_pxx_aSig_tls_second = (pxx_aSig_tls_second./pxx_aSig_tls_base)-1;
change_pxx_aSig_pbo_second = (pxx_aSig_pbo_second./pxx_aSig_pbo_base)-1;

