close all;

% Visualizations

%% PSD - Select specific channels, subject

chan = 34;
sub = 2;
figure('units','normalized','Position',[0.2,0.65,0.3,0.3])
h = spectrum.welch; % creates the Welch spectrum estimator
% 2 sec segment length -> 1024 samples
% more frequency resolution at higher sample rate 
h.SegmentLength = 2048;
% Stim 
signal=psd(h,tls_second(chan,:,sub),'Fs',fs); % calculates and plot the one sided PSD
plot(signal); % Plot the one-sided PSD. 
temp = get(gca);
temp.Children(1).Color = 'r';
hold on;
% Placebo
signal=psd(h,pbo_second(chan,:,sub),'Fs',fs); % calculates and plot the one sided PSD
plot(signal); % Plot the one-sided PSD. 
temp = get(gca);
temp.Children(1).Color = 'b';


