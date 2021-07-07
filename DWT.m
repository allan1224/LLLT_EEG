function [alphaCoef,betaCoef,alphaSig,betaSig] = DWT(signal)
    fs = 512;
    % wv = 'db4'
    % l = wmaxlev(length(eeg(1).PRE),wv) = 13
    waveletFunction = 'db4';
    [C,L] = wavedec(signal,8,waveletFunction);

    %% Coefficients
    cD1 = detcoef(C,L,1); % NOISY
    cD2 = detcoef(C,L,2); % NOISY
    cD3 = detcoef(C,L,3); % NOISY
    cD4 = detcoef(C,L,4); % NOISY
    cD5 = detcoef(C,L,5); %GAMA
    cD6 = detcoef(C,L,6); %BETA
    cD7 = detcoef(C,L,7); %ALPHA
    cD8 = detcoef(C,L,8); %THETA
    cA8 = appcoef(C,L,waveletFunction,8); %DELTA
    
    %% Reconstructed Signals
    D1 = wrcoef('d',C,L,waveletFunction,1); % NOISY
    D2 = wrcoef('d',C,L,waveletFunction,2); % NOISY
    D3 = wrcoef('d',C,L,waveletFunction,3); % NOISY
    D4 = wrcoef('d',C,L,waveletFunction,4); % NOISY
    D5 = wrcoef('d',C,L,waveletFunction,5); %GAMMA
    D6 = wrcoef('d',C,L,waveletFunction,6); %BETA
    D7 = wrcoef('d',C,L,waveletFunction,7); %ALPHA
    D8 = wrcoef('d',C,L,waveletFunction,8); %THETA
    A8 = wrcoef('a',C,L,waveletFunction,8); %DELTA

    Gamma = D5;
    Beta = D6;
    Alpha = D7;
    Theta = D8;
    Delta = A8;
    
%     figure; subplot(5,1,1); plot((1:length(Gamma))./fs,Gamma);title('GAMMA');
%     subplot(5,1,2); plot((1:length(Beta))./fs, Beta); title('BETA');
%     subplot(5,1,3); plot((1:length(Alpha))./fs,Alpha); title('ALPHA');
%     subplot(5,1,4); plot((1:length(Theta))./fs,Theta);title('THETA');
%     subplot(5,1,5);plot((1:length(Delta))./fs,Delta);title('DELTA');
    
   
    %% Extract features
    alphaCoef = cD7;
    betaCoef = cD6;
    alphaSig = Alpha;
    betaSig = Beta;
  
end