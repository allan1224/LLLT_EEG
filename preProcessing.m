close all

fs = Subjects(1).subject.fs;

%% Preprocessing for machine learning applicatiom

for currentSub = 1:length(Subjects)

    % Raw measurements
    signal = Subjects(currentSub).subject.eeg;
    
    % Event markers
    TYP = Subjects(currentSub).subject.events.TYP;
    POS = Subjects(currentSub).subject.events.POS;

    %% Visualize signal
    % figure;
    % for i = 1:10
    %     subplot(10,1,i);
    %     plot((1:length(signal))./fs,(signal(i,:)))
    %     title('Ch',i)
    %     hold on;  
    % end
    %%

    % Remove mean
    signal = signal - detrend(signal);

    % Remove outliers
    signal = filloutliers((signal),'nearest','mean');

    % Bandpass filter [8-30 Hz]
    % *Verify using PSD plot*
    BPF = getBPFilter;
    signal = BPF(signal);


    %% Extract time periods
    
    laserON = find(TYP == 100);
    laserOFF = find(TYP == 101);
    
    indexLaserON = POS(laserON);
    indexLaserOFF = POS(laserOFF);
    
    eeg(currentSub).PRE = signal(:,1:indexLaserON-1);
    eeg(currentSub).DURING = signal(:,indexLaserON:indexLaserOFF-1);
    eeg(currentSub).POST = signal(:,indexLaserOFF:length(signal));
    
   
end
