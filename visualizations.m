close all;

% Visualizations


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

%% TLS
subject = 6;
figure; 
sgtitle("average alpha power, subject: " + subject);
subplot(1,3,1)
topoplot(alphaPow_tls_base(:,:,subject),chanlocs(1:64));
title("baseline");
hcb=colorbar;
hcb.Title.String = "power";
subplot(1,3,2)
topoplot(alphaPow_tls_second(:,:,subject),chanlocs(1:64));
title("tls min 4-8");
hcb=colorbar;
hcb.Title.String = "power";
subplot(1,3,3)
topoplot(alphaPow_tls_rec(:,:,subject),chanlocs(1:64));
title("recovery")
hcb=colorbar;
hcb.Title.String = "power";

figure; 
sgtitle("average beta power, subject: " + subject);
subplot(1,3,1)
topoplot(betaPow_tls_base(:,:,subject),chanlocs(1:64));
title("baseline");
hcb=colorbar;
hcb.Title.String = "power";
subplot(1,3,2)
topoplot(betaPow_tls_second(:,:,subject),chanlocs(1:64));
title("tls min 4-8");
hcb=colorbar;
hcb.Title.String = "power";
subplot(1,3,3)
topoplot(betaPow_tls_rec(:,:,subject),chanlocs(1:64));
title("recovery")
hcb=colorbar;
hcb.Title.String = "power";

%% PBO
subject = 6;
figure; 
sgtitle("average alpha power, subject: " + subject);
subplot(1,3,1)
topoplot(alphaPow_pbo_base(:,:,subject),chanlocs(1:64));
title("baseline");
hcb=colorbar;
hcb.Title.String = "power";
subplot(1,3,2)
topoplot(alphaPow_pbo_second(:,:,subject),chanlocs(1:64));
title("tls min 4-8");
hcb=colorbar;
hcb.Title.String = "power";
subplot(1,3,3)
topoplot(alphaPow_pbo_rec(:,:,subject),chanlocs(1:64));
title("recovery")
hcb=colorbar;
hcb.Title.String = "power";
figure; 
sgtitle("average beta power, subject: " + subject);
subplot(1,3,1)
topoplot(betaPow_pbo_base(:,:,subject),chanlocs(1:64));
title("baseline");
hcb=colorbar;
hcb.Title.String = "power";
subplot(1,3,2)
topoplot(betaPow_pbo_second(:,:,subject),chanlocs(1:64));
title("tls min 4-8");
hcb=colorbar;
hcb.Title.String = "power";
subplot(1,3,3)
topoplot(betaPow_pbo_rec(:,:,subject),chanlocs(1:64));
title("recovery")
hcb=colorbar;
hcb.Title.String = "power";
