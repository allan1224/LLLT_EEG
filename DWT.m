function [alphaPower,betaPower,alphaSig,betaSig] = DWT(signal)

    waveletFunction = 'db4';
    [C,L] = wavedec(signal,6,waveletFunction);

    %% Coefficients
    cD1 = detcoef(C,L,1); % NOISY
    cD2 = detcoef(C,L,2); % NOISY
    cD3 = detcoef(C,L,3); % NOISY
    cD4 = detcoef(C,L,4); % NOISY
    cD5 = detcoef(C,L,5); % NOISY
    cD6 = detcoef(C,L,6); % NOISY
    cD7 = detcoef(C,L,7); % NOISY
    cD8 = detcoef(C,L,8); % NOISY
    cD9 = detcoef(C,L,9); % NOISY
    cD10 = detcoef(C,L,10); %GAMA
    cD11 = detcoef(C,L,11); %BETA
    cD12 = detcoef(C,L,12); %ALPHA
    cD13 = detcoef(C,L,13); %THETA
    cA13 = appcoef(C,L,waveletFunction,13); %DELTA
    
    %% Reconstructed Signals
    D1 = wrcoef('d',C,L,waveletFunction,1); % NOISY
    D2 = wrcoef('d',C,L,waveletFunction,2); % NOISY
    D3 = wrcoef('d',C,L,waveletFunction,3); % NOISY
    D4 = wrcoef('d',C,L,waveletFunction,4); % NOISY
    D5 = wrcoef('d',C,L,waveletFunction,5); % NOISY
    D6 = wrcoef('d',C,L,waveletFunction,6); % NOISY
    D7 = wrcoef('d',C,L,waveletFunction,7); % NOISY
    D8 = wrcoef('d',C,L,waveletFunction,8); % NOISY
    D9 = wrcoef('d',C,L,waveletFunction,9); % NOISY
    D10 = wrcoef('d',C,L,waveletFunction,10); %GAMMA
    D11 = wrcoef('d',C,L,waveletFunction,11); %BETA
    D12 = wrcoef('d',C,L,waveletFunction,12); %ALPHA
    D13 = wrcoef('d',C,L,waveletFunction,13); %THETA
    A13 = wrcoef('a',C,L,waveletFunction,13); %DELTA

    Gamma = D3;
    figure; subplot(5,1,1); plot(1:1:length(Gamma),Gamma);title('GAMMA');

     Beta = D4;
    subplot(5,1,2); plot(1:1:length(Beta), Beta); title('BETA');
     
     Alpha = D5;
    subplot(5,1,3); plot(1:1:length(Alpha),Alpha); title('ALPHA');

    Theta = D6;
    subplot(5,1,4); plot(1:1:length(Theta),Theta);title('THETA');

    Delta = A6;
    subplot(5,1,5);plot(1:1:length(Delta),Delta);title('DELTA');
    
    %% Extract features
    
    % Alpha
    n = length(cD5); % # of computed coefficients at each sub-band
    meanPowerAlpha = (sum(abs(cD5).^2))/n;
    
    % Beta
    n = length(cD4); % # of computed coefficients at each sub-band
    meanPowerBeta = (sum(abs(cD4).^2))/n;

    % return
    alphaPower = meanPowerAlpha;
    betaPower = meanPowerBeta;

    alphaSig = Alpha;
    betaSig = Beta;
    
    alphaMean  = mean(Alpha);
    
    betaMean = mean(Beta);
   
    
    
    
    
end