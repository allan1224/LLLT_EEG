close all;

% Visualizations

%% PSD 
% Mean of subjects across a given channel 
channel = 34;
figure;
plot(f1,10*log10(mean(pxx_tls_second(channel,:,:),3)), 'color','r')
hold on;
plot(f1,10*log10(mean(pxx_tls_base(channel,:,:),3)), 'color','b')
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')
xlim([1 70])
title("PSD", labels{channel})
legend('rec','baseline')

%% Change in PSD at each frequency component (Allan way)
% Mean of subjects across a given channel 
channel = 1;
figure;
plot(f1,(mean(nodB_nor_pxx_tls_rec(channel,:,:),3)), 'color','b')
hold on;
plot(f1,(mean(nodB_nor_pxx_pbo_rec(channel,:,:),3)), 'color','r')
xlabel('Frequency (Hz)')
ylabel('% change')
xlim([1 40])
title("% Change in PSD", labels{channel})
legend('TLS min 4-8','PBO min 4-8')

%% Change in PSD at each frequency component (Xinlong way)
% Mean of subjects across a given channel 

channel = 34;
figure('color','w')
plot(f1,mean(nodB_nor_pxx_pbo_second(channel,:,:),3),'ko--','linewidth',1,'markersize',4)
xlim([1 70])
ylim([-0.6 0.4])
hold on
xlabel('Frequency (Hz)')
ylabel('change of power (%)')
plot(f1,mean(nodB_nor_pxx_tls_second(channel,:,:),3),'r*-','linewidth',1,'markersize',4)
xticks([1 4 8 13 30 70])
yticks([-0.6 -0.4 -0.2 0 0.2 0.4])
title(labels{channel})
set(gca,'xscale','log','fontsize',15,'linewidth',1,'Xcolor','k','Ycolor','k');

%% PSD of sub-bands
% Mean of subjects across a given channel 

% Alpha
channel = 34;
figure;
plot(f2,10*log10(mean(pxx_aSig_tls_second(channel,:,:),3)), 'color','r')
hold on;
plot(f2,10*log10(mean(pxx_aSig_tls_base(channel,:,:),3)), 'color','b')
xlabel('Frequency (Hz)')
ylabel('PSD (dB/Hz)')
xlim([8 15])
title("Alpha band",labels{channel})

%% Change in PSD of sub-bands
% Mean of subjects across a given channel 

% Alpha
channel = 34;
figure;
plot(f2,(mean(change_pxx_aSig_tls_second(channel,:,:),3)), 'color','r')
hold on;
plot(f2,(mean(change_pxx_aSig_pbo_second(channel,:,:),3)), 'color','b')
xlabel('Frequency (Hz)')
ylabel('% Change')
xlim([8 15])
title('Alpha band',labels{channel})


%% Reconstructed sub-band signals

channel = 34;
% PBO
figure; 
Alpha = mean(aSig_pbo_second(channel,:,:),3);
Beta = mean(bSig_pbo_second(channel,:,:),3);
subplot(2,1,1); 
plot((1:length(Beta))./fs, Beta); 
title('BETA');
subplot(2,1,2); 
plot((1:length(Alpha))./fs,Alpha);
title('ALPHA');
sgtitle("PBO")
% TLS
figure; 
Alpha = mean(aSig_tls_second(channel,:,:),3);
Beta = mean(bSig_tls_second(channel,:,:),3);
subplot(2,1,1); 
plot((1:length(Beta))./fs, Beta); 
title('BETA');
subplot(2,1,2); 
plot((1:length(Alpha))./fs,Alpha);
title('ALPHA');
sgtitle("TLS")

%% Baseline Comparisons

for chan = 1:numChannels
    
    mean_pbo_sub = mean(pbo_base(chan,:,:),3);
    mean_pbo(chan) = mean(mean_pbo_sub);

    mean_tls_sub = mean(tls_base(chan,:,:),3);
    mean_tls(chan) = mean(mean_tls_sub);

end

for chan = 1:64
    x(chan) = [chan];
    vals1(chan) = [mean_pbo(chan)]; 
    vals2(chan) = [mean_tls(chan)];
    
end

vals = [vals1 ; vals2];

h = bar(x,abs(vals))
set(h, {'DisplayName'}, {'PBO','TLS'}')
legend() 
title("Mean baseline of subjects per channel")

figure;

diff = [(vals2./vals1)-1];
h = bar(x,abs(diff))
set(h, {'DisplayName'}, {'{% Diff}'})
legend() 
title("% Difference of mean baseline of subjects per channel")

