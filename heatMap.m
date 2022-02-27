%% HEAT MAP

chan = 34;

%% Split into 30 sec intervals

n = 30*fs; % 30 sec * 512 samples/sec = 15360 samples = n

% TLS
for sub = 1:numSubjects_tls
   [segments_tls(:,:,sub)] = buffer(tls_second(chan,:,sub),n); 
end

% PBO
for sub = 1:numSubjects_pbo
   [segments_pbo(:,:,sub)] = buffer(pbo_second(chan,:,sub),n);
end

%% Calculate PSD for each segment

% TLS
for sub = 1:numSubjects_tls
    baselinePSD_tls(:,sub) = pwelch(tls_base(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
    for segment = 1:8
        [segPSD_tls(:,segment,sub) f3] = pwelch(segments_tls(:,segment,sub),4*fs,3*fs,4*fs,fs,'psd');
    end
end

% PBO
for sub = 1:numSubjects_pbo
    baselinePSD_pbo(:,sub) = pwelch(pbo_base(chan,:,sub),4*fs,3*fs,4*fs,fs,'psd');
    for segment = 1:8
        [segPSD_pbo(:,segment,sub) f3] = pwelch(segments_pbo(:,segment,sub),4*fs,3*fs,4*fs,fs,'psd');
    end
end


%% Percent change for normalization from subject's individual baseline

% TLS
for sub = 1:numSubjects_tls
    for seg = 1:8
        segPSD_tls(:,seg,sub) = 100*((segPSD_tls(:,seg,sub)./baselinePSD_tls(:,sub)) - 1);
    end 
end

% PBO
for sub = 1:numSubjects_pbo
    for seg = 1:8
        segPSD_pbo(:,seg,sub) = 100*((segPSD_pbo(:,seg,sub)./baselinePSD_pbo(:,sub)) - 1);
    end 
end

%% Average among all subjects per group

meanSegPSD_tls = mean(segPSD_tls,3);
meanSegPSD_pbo = mean(segPSD_pbo,3);

diff = meanSegPSD_tls-meanSegPSD_pbo;

%%

% Extract every 4th row
N = 4;
B = diff(1:N:121,:);

clims = [-1.5 1];
imagesc(B,clims);
colorbar
ylabel("Difference between % change from basline TLS vs PBO");
xlabel("time");
