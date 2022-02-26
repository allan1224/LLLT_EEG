%% MAV and VAR

% (WSize: 50,100,300ms)
% seconds -> (WSize: 0.05, 0.1, 0.3)
% (Olap: 0,0.25,0.75)
WSize = 0.1; % window size in s
Olap = 0.25; % overlap percentage

% Extracting Features over overlapping windows
WSize = floor(WSize*fs);	    % length of each data frame, 30ms
nOlap = floor(Olap*WSize);  % overlap of successive frames, half of WSize
hop = WSize-nOlap;	    % amount to advance for next data frame


%% TLS 

% Second
signal_tls_second = aSig_tls_second(:,:,:);
nx = length(signal_tls_second);	      % length of input vector
len = fix((nx - (WSize-hop))/hop);	% length of output vector = total frames
for sub = 1:numSubjects_tls
    for chan = 1:numChannels
        % take window segment, take abs value of signal and average & take variance
        % move window with certain overlap, get new feature value
        for i = 1:len
            segment_tls_second = signal_tls_second(chan,((i-1)*hop+1):((i-1)*hop+WSize),sub);
            MAV_feature_tls_second(chan,i,sub) = mean(abs(segment_tls_second));
            VAR_feature_tls_second(chan,i,sub) = (1/(length(segment_tls_second))) * sum((segment_tls_second - mean(segment_tls_second)).^2);
        end
    end
end

% Base
signal_tls_base = aSig_tls_base(:,:,:);
nx = length(signal_tls_base);	      % length of input vector
len = fix((nx - (WSize-hop))/hop);	% length of output vector = total frames
for sub = 1:numSubjects_tls
    for chan = 1:numChannels
        % take window segment, take abs value of signal and average & take variance
        % move window with certain overlap, get new feature value
        for i = 1:len
            % base
            segment_tls_base = signal_tls_base(chan,((i-1)*hop+1):((i-1)*hop+WSize),sub);
            MAV_feature_tls_base(chan,i,sub) = mean(abs(segment_tls_base));
            VAR_feature_tls_base(chan,i,sub) = (1/(length(segment_tls_base))) * sum((segment_tls_base - mean(segment_tls_base)).^2);
        end
    end
end

%% PBO

% Second
signal_pbo_second = aSig_pbo_second(:,:,:);
nx = length(signal_pbo_second);	      % length of input vector
len = fix((nx - (WSize-hop))/hop);	% length of output vector = total frames
for sub = 1:numSubjects_tls
    for chan = 1:numChannels
        % take window segment, take abs value of signal and average & take variance
        % move window with certain overlap, get new feature value
        for i = 1:len
            segment_pbo_second = signal_pbo_second(chan,((i-1)*hop+1):((i-1)*hop+WSize),sub);
            MAV_feature_pbo_second(chan,i,sub) = mean(abs(segment_pbo_second));
            VAR_feature_pbo_second(chan,i,sub) = (1/(length(segment_pbo_second))) * sum((segment_pbo_second - mean(segment_pbo_second)).^2);
        end
    end
end

% Base
signal_pbo_base = aSig_pbo_base(:,:,:);
nx = length(signal_pbo_base);	      % length of input vector
len = fix((nx - (WSize-hop))/hop);	% length of output vector = total frames
for sub = 1:numSubjects_tls
    for chan = 1:numChannels
        % take window segment, take abs value of signal and average & take variance
        % move window with certain overlap, get new feature value
        for i = 1:len
            % base
            segment_pbo_base = signal_pbo_base(chan,((i-1)*hop+1):((i-1)*hop+WSize),sub);
            MAV_feature_pbo_base(chan,i,sub) = mean(abs(segment_pbo_base));
            VAR_feature_pbo_base(chan,i,sub) = (1/(length(segment_pbo_base))) * sum((segment_pbo_base - mean(segment_pbo_base)).^2);
        end
    end
end

%% Graph

% MAV
% USE hop 
figure('units','normalized');
plot((1:length(MAV_feature_tls_second)),(MAV_feature_tls_second(34,:,7)));
hold on;
plot((1:length(MAV_feature_pbo_second)),(MAV_feature_pbo_second(34,:,7)));


%% SNR 

for sub = 1:numSubjects_tls
    for chan = 1:numChannels
        % TLS
        % Obtain SNR MAV
        ratioMAV_tls_second = mean(MAV_feature_tls_second(chan,:,sub))./mean(MAV_feature_tls_base(chan,:,sub));
        SNRmav_tls(chan,sub) = 10*log10(ratioMAV_tls_second ); %dB
        % Obtain SNR VAR
        ratioVAR_tls_second = mean(VAR_feature_tls_second(chan,:,sub))./mean(VAR_feature_tls_base(chan,:,sub));
        SNRvar_tls(chan,sub) = 10*log10(ratioVAR_tls_second); %dB


        % PBO
        % Obtain SNR MAV
        ratioMAV_pbo_second = mean(MAV_feature_pbo_second(chan,:,sub))./mean(MAV_feature_pbo_base(chan,:,sub));
        SNRmav_pbo(chan,sub) = 10*log10(ratioMAV_pbo_second); %dB
        % Obtain SNR VAR
        ratioVAR_pbo_second = mean(VAR_feature_pbo_second(chan,:,sub))./mean(VAR_feature_pbo_base(chan,:,sub));
        SNRvar_pbo(chan,sub) = 10*log10(ratioVAR_pbo_second); %dB

    end
end

