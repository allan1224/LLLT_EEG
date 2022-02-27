%% Calculate average band power for each channel for each subject
% the average power contained in the frequency interval
% averaging of PSD within each of the 5 frequency bands

for sub = 1:numSubjects_tls
    for chan = 1:numChannels
    alphaPow_tls_base(chan,sub) = bandpower(pxx_tls_base(chan,:,sub),f1,[8,13],'psd');
    alphaPow_tls_second(chan,sub) = bandpower(pxx_tls_second(chan,:,sub),f1,[8,13],'psd');
    alphaPow_tls_rec(chan,sub) = bandpower(pxx_tls_rec(chan,:,sub),f1,[8,13],'psd');
    
    betaPow_tls_base(chan,sub) = bandpower(pxx_tls_base(chan,:,sub),f1,[13,30],'psd');
    betaPow_tls_second(chan,sub) = bandpower(pxx_tls_second(chan,:,sub),f1,[13,30],'psd');
    betaPow_tls_rec(chan,sub) = bandpower(pxx_tls_rec(chan,:,sub),f1,[13,30],'psd');
    
    deltaPow_tls_base(chan,sub) = bandpower(pxx_tls_base(chan,:,sub),f1,[0.5,4],'psd');
    deltaPow_tls_second(chan,sub) = bandpower(pxx_tls_second(chan,:,sub),f1,[0.5,4],'psd');
    deltaPow_tls_rec(chan,sub) = bandpower(pxx_tls_rec(chan,:,sub),f1,[0.5,4],'psd');
    end 
end

for sub = 1:numSubjects_pbo
    for chan = 1:numChannels
    alphaPow_pbo_base(chan,sub) = bandpower(pxx_pbo_base(chan,:,sub),f1,[8,13],'psd');
    alphaPow_pbo_second(chan,sub) = bandpower(pxx_pbo_second(chan,:,sub),f1,[8,13],'psd');
    alphaPow_pbo_rec(chan,sub) = bandpower(pxx_pbo_rec(chan,:,sub),f1,[8,13],'psd');
    
    betaPow_pbo_base(chan,sub) = bandpower(pxx_pbo_base(chan,:,sub),f1,[13,30],'psd');
    betaPow_pbo_second(chan,sub) = bandpower(pxx_pbo_second(chan,:,sub),f1,[13,30],'psd');
    betaPow_pbo_rec(chan,sub) = bandpower(pxx_pbo_rec(chan,:,sub),f1,[13,30],'psd');
    
    deltaPow_pbo_base(chan,sub) = bandpower(pxx_pbo_base(chan,:,sub),f1,[0.5,4],'psd');
    deltaPow_pbo_second(chan,sub) = bandpower(pxx_pbo_second(chan,:,sub),f1,[0.5,4],'psd');
    deltaPow_pbo_rec(chan,sub) = bandpower(pxx_pbo_rec(chan,:,sub),f1,[0.5,4],'psd');
    end 
end

%% Ratio of average band power between stimulation/recovery and baseline
% Xinlong recommends to use this normalization for further statistical
% analysis

r_alpha_tls_second = alphaPow_tls_second./alphaPow_tls_base;
r_alpha_tls_rec = alphaPow_tls_rec./alphaPow_tls_base;
r_beta_tls_second = betaPow_tls_second./betaPow_tls_base;
r_beta_tls_rec = betaPow_tls_rec./betaPow_tls_base;
r_delta_tls_second = deltaPow_tls_second./deltaPow_tls_base;
r_delta_tls_rec = deltaPow_tls_rec./deltaPow_tls_base;

r_alpha_pbo_second = alphaPow_pbo_second./alphaPow_pbo_base;
r_alpha_pbo_rec = alphaPow_pbo_rec./alphaPow_pbo_base;
r_beta_pbo_second = betaPow_pbo_second./betaPow_pbo_base;
r_beta_pbo_rec = betaPow_pbo_rec./betaPow_pbo_base;
r_delta_pbo_second = deltaPow_pbo_second./deltaPow_pbo_base;
r_delta_pbo_rec = deltaPow_pbo_rec./deltaPow_pbo_base;

% Mean difference between TLS and PBO
% For topoplots
meanDiff_alpha_second = mean(r_alpha_tls_second,2)-mean(r_alpha_pbo_second,2);
meanDiff_alpha_rec = mean(r_alpha_tls_rec,2)-mean(r_alpha_pbo_rec,2);

meanDiff_beta_second = mean(r_beta_tls_second,2)-mean(r_beta_pbo_second,2);
meanDiff_beta_rec = mean(r_beta_tls_rec,2)-mean(r_beta_pbo_rec,2);

meanDiff_delta_second = mean(r_delta_tls_second,2)-mean(r_delta_pbo_second,2);
meanDiff_delta_rec = mean(r_delta_tls_rec,2)-mean(r_delta_pbo_rec,2);



%% Plot the bandpower ratio to baseline
%% TLS 4-8

chan = 34;

figure;
sgtitle("Normalized band power TLS 4-8 min vs Sham, chan: " + labels(chan) );
subplot(1,3,1)
stem(1:6,r_alpha_tls_second(chan,:),'color','r');
hold on;
stem(1:9,r_alpha_pbo_second(chan,:),'color','b');
title("alpha band")
curtick = get(gca, 'XTick');
set(gca, 'XTick', unique(round(curtick)))
xlabel("subject")
ylabel("ratio to baseline ")
legend('TLS','PBO')
xlim([1 9])

subplot(1,3,2)
stem(1:6,r_beta_tls_second(chan,:),'color','r');
hold on;
stem(1:9,r_beta_pbo_second(chan,:),'color','b');
title("beta band")
curtick = get(gca, 'XTick');
set(gca, 'XTick', unique(round(curtick)))
xlabel("subject")
ylabel("ratio to basline")
legend('TLS','PBO')
xlim([1 9])

subplot(1,3,3)
stem(1:6,r_delta_tls_second(chan,:),'color','r');
hold on;
stem(1:9,r_delta_pbo_second(chan,:),'color','b');
title("delta band")
curtick = get(gca, 'XTick');
set(gca, 'XTick', unique(round(curtick)))
xlabel("subject")
ylabel("ratio to baseline")
legend('TLS','PBO')
xlim([1 9])

%% Recovery

chan = 34;

figure;
sgtitle("Normalized band power TLS Recovery vs Sham, chan: " + labels(chan) );
subplot(1,3,1)
stem(1:6,r_alpha_tls_rec(chan,:),'color','r');
hold on;
stem(1:9,r_alpha_pbo_rec(chan,:),'color','b');
title("alpha band")
curtick = get(gca, 'XTick');
set(gca, 'XTick', unique(round(curtick)))
xlabel("subject")
ylabel("ratio to baseline ")
legend('TLS','PBO')
xlim([1 9])

subplot(1,3,2)
stem(1:6,r_beta_tls_rec(chan,:),'color','r');
hold on;
stem(1:9,r_beta_pbo_rec(chan,:),'color','b');
title("beta band")
curtick = get(gca, 'XTick');
set(gca, 'XTick', unique(round(curtick)))
xlabel("subject")
ylabel("ratio to basline")
legend('TLS','PBO')
xlim([1 9])

subplot(1,3,3)
stem(1:6,r_delta_tls_rec(chan,:),'color','r');
hold on;
stem(1:9,r_delta_pbo_rec(chan,:),'color','b');
title("delta band")
curtick = get(gca, 'XTick');
set(gca, 'XTick', unique(round(curtick)))
xlabel("subject")
ylabel("ratio to baseline")
legend('TLS','PBO')
xlim([1 9])

%% TOPOPLOTS

% Mean difference in band power

% alpha
figure; 
sgtitle("Mean difference alpha power between TLS and PBO")
subplot(1,2,1)
topoplot(100*meanDiff_alpha_second,chanlocs(1:64));
title("TLS min 4-8");
hcb=colorbar;
hcb.Title.String = "% Diff";
subplot(1,2,2)
topoplot(100*meanDiff_alpha_rec,chanlocs(1:64));
title("recovery");
hcb=colorbar;
hcb.Title.String = "% Diff";

% beta
figure; 
sgtitle("Mean difference beta power between TLS and PBO")
subplot(1,2,1)
topoplot(100*meanDiff_beta_second,chanlocs(1:64));
title("TLS min 4-8");
hcb=colorbar;
hcb.Title.String = "% Diff";
subplot(1,2,2)
topoplot(100*meanDiff_beta_rec,chanlocs(1:64));
title("recovery");
hcb=colorbar;
hcb.Title.String = "% Diff";

% delta
figure; 
sgtitle("Mean difference delta power between TLS and PBO")
subplot(1,2,1)
topoplot(100*meanDiff_delta_second,chanlocs(1:64));
title("TLS min 4-8");
hcb=colorbar;
hcb.Title.String = "% Diff";
subplot(1,2,2)
topoplot(100*meanDiff_delta_rec,chanlocs(1:64));
title("recovery");
hcb=colorbar;
hcb.Title.String = "% Diff";






















%% TLS

subject = 1;

figure; 
sgtitle("alpha power ratio to basline, subject: " + subject)
subplot(1,2,1)
topoplot(r_alpha_tls_second(:,subject),chanlocs(1:64));
title("TLS min 4-8");
hcb=colorbar;
hcb.Title.String = "ratio to baseline";
subplot(1,2,2)
topoplot(r_alpha_tls_rec(:,subject),chanlocs(1:64));
title("recovery");
hcb=colorbar;
hcb.Title.String = "% change";

figure; 
sgtitle("beta power ratio to baseline, subject: " + subject);
subplot(1,2,1)
topoplot(r_beta_tls_second(:,subject),chanlocs(1:64));
title("TLS min 4-8");
hcb=colorbar;
hcb.Title.String = "ratio";
subplot(1,2,2)
topoplot(r_beta_tls_rec(:,subject),chanlocs(1:64));
title("recovery");
hcb=colorbar;
hcb.Title.String = "ratio";

figure; 
sgtitle("delta power ratio to baseline, subject: " + subject);
subplot(1,2,1)
topoplot(r_delta_tls_second(:,subject),chanlocs(1:64));
title("TLS min 4-8");
hcb=colorbar;
hcb.Title.String = "ratio";
subplot(1,2,2)
topoplot(r_delta_tls_rec(:,subject),chanlocs(1:64));
title("recovery");
hcb=colorbar;
hcb.Title.String = "ratio";


%% PBO

subject = 3;

figure; 
sgtitle("change in average alpha power, subject: " + subject);
subplot(1,2,1)
topoplot(ch_alpha_pbo_second(:,subject),chanlocs(1:64));
title("PBO min 4-8");
hcb=colorbar;
hcb.Title.String = "% change";
subplot(1,2,2)
topoplot(ch_alpha_pbo_rec(:,subject),chanlocs(1:64));
title("PBO recovery");
hcb=colorbar;
hcb.Title.String = "% change";

figure; 
sgtitle("change in average beta power, subject: " + subject);
subplot(1,2,1)
topoplot(ch_beta_pbo_second(:,subject),chanlocs(1:64));
title("PBO min 4-8");
hcb=colorbar;
hcb.Title.String = "% change";
subplot(1,2,2)
topoplot(ch_beta_pbo_rec(:,subject),chanlocs(1:64));
title("PBO recovery");
hcb=colorbar;
hcb.Title.String = "% change";

figure; 
sgtitle("change in average delta power, subject: " + subject);
subplot(1,2,1)
topoplot(ch_delta_pbo_second(:,subject),chanlocs(1:64));
title("PBO min 4-8");
hcb=colorbar;
hcb.Title.String = "% change";
subplot(1,2,2)
topoplot(ch_delta_pbo_rec(:,subject),chanlocs(1:64));
title("PBO recovery");
hcb=colorbar;
hcb.Title.String = "% change";