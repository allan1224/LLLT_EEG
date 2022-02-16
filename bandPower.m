bandpower(pxx_tls_second(34,:,1),f1,[8,15],'psd') 
bandpower(pxx_tls_base(34,:,1),f1,[8,15],'psd')
bandpower(pxx_pbo_second(34,:,1),f1,[8,15],'psd')
bandpower(pxx_pbo_base(34,:,1),f1,[8,15],'psd')


ratio = bandpower(pxx_aSig_tls_second(34,:,1),f1,[9,13],'psd') / bandpower(pxx_aSig_tls_second(34,:,1),f1,[9,13],'psd')


%% 
bandpower(pxx_aSig_tls_second(34,:,5),f2,[8,11],'psd')
bandpower(pxx_aSig_tls_base(34,:,5),f2,[8,11],'psd')
bandpower(pxx_aSig_pbo_second(34,:,5),f2,[8,11],'psd')
bandpower(pxx_aSig_pbo_base(34,:,5),f2,[8,11],'psd')



%%

%% PSD 
% Mean of subjects across a given channel 
channel = 34;

for sub = 1:1
    figure;
    plot(f1,(pxx_tls_second(channel,:,1)), 'color','r')
    xlabel('Frequency (Hz)')
    ylabel('PSD (dB/Hz)')
    xlim([5 15])
    title('Light',labels{channel})
end
%%
for sub = 1:5
    figure;
    plot(f1,10*log10(pxx_pbo_second(channel,:,sub)), 'color','r')
    hold on;
    plot(f1,10*log10(pxx_pbo_base(channel,:,sub)), 'color','b')
    xlabel('Frequency (Hz)')
    ylabel('PSD (dB/Hz)')
    xlim([5 15])
    title('PBO',labels{channel})
end




