close all

% Visualizations

%% PSD - Select specific channels
figure('units','normalized','Position',[0.2,0.65,0.3,0.3])
h = spectrum.welch; % creates the Welch spectrum estimator
% 2 sec segment length -> 1024 samples
% more frequency resolution at higher sample rate 
h.SegmentLength = 1024;
% PRE
signal=psd(h,eeg(1).PRE(35,:),'Fs',fs); % calculates and plot the one sided PSD
plot(signal); % Plot the one-sided PSD. 
temp = get(gca);
temp.Children(1).Color = 'b';
hold on;
% DURING
signal=psd(h,eeg(1).DURING(35,:),'Fs',fs); % calculates and plot the one sided PSD
plot(signal); % Plot the one-sided PSD. 
temp = get(gca);
temp.Children(1).Color = 'r';
hold on;
% POST
signal=psd(h,eeg(1).POST(35,:),'Fs',fs); % calculates and plot the one sided PSD
plot(signal); % Plot the one-sided PSD. 
temp = get(gca);
temp.Children(1).Color = 'g';
hold on;

