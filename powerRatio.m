% Ratio of average power across a given channel


%% TLS

% Alpha
for sub = 1:numSubjects_tls
    for chan = 1:numChannels
        [alpha_tls_first(chan,sub)] = bandpower(pxx_tls_first(chan,:,sub),f1,[9,13],'psd') / bandpower(pxx_tls_base(chan,:,sub),f1,[9,13],'psd');
        [alpha_tls_second(chan,sub)] = bandpower(pxx_tls_second(chan,:,sub),f1,[9,13],'psd') / bandpower(pxx_tls_base(chan,:,sub),f1,[9,13],'psd');
        [alpha_tls_rec(chan,sub)] = bandpower(pxx_tls_rec(chan,:,sub),f1,[9,13],'psd') / bandpower(pxx_tls_base(chan,:,sub),f1,[9,13],'psd');
    end
end


%% PBO

% Alpha
for sub = 1:numSubjects_tls
    for chan = 1:numChannels
        [alpha_pbo_first(chan,sub)] = bandpower(pxx_pbo_first(chan,:,sub),f1,[9,13],'psd') / bandpower(pxx_pbo_base(chan,:,sub),f1,[9,13],'psd');
        [alpha_pbo_second(chan,sub)] = bandpower(pxx_pbo_second(chan,:,sub),f1,[9,13],'psd') / bandpower(pxx_pbo_base(chan,:,sub),f1,[9,13],'psd');
        [alpha_pbo_rec(chan,sub)] = bandpower(pxx_pbo_rec(chan,:,sub),f1,[9,13],'psd') / bandpower(pxx_pbo_base(chan,:,sub),f1,[9,13],'psd');
    end
end

