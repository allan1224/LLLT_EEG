function [aSig,tSig] = DWT(signal)
    fs = 512;
    % wv = 'db4'
    % l = wmaxlev(length(pbo_first(55,:,2)),wv) = 14
    waveletFunction = 'db8';
    [C,L] = wavedec(signal,6,waveletFunction);

    %% Coefficients
    cD1 = detcoef(C,L,1); % NOISY
    cD2 = detcoef(C,L,2); % NOISY
    cD3 = detcoef(C,L,3); %GAMA
    cD4 = detcoef(C,L,4); %BETA
    cD5 = detcoef(C,L,5); %ALPHA
    cD6 = detcoef(C,L,6); %THETA
    cA6 = appcoef(C,L,waveletFunction,6); %DELTA
    
    %% Reconstructed Signals
    D1 = wrcoef('d',C,L,waveletFunction,1); % NOISY
    D2 = wrcoef('d',C,L,waveletFunction,2); % NOISY
    D3 = wrcoef('d',C,L,waveletFunction,3); %GAMMA
    D4 = wrcoef('d',C,L,waveletFunction,4); %BETA
    D5 = wrcoef('d',C,L,waveletFunction,5); %ALPHA
    D6 = wrcoef('d',C,L,waveletFunction,6); %THETA
    A6 = wrcoef('a',C,L,waveletFunction,6); %DELTA

    Gamma = D3;
    Beta = D4;
    Alpha = D5;
    Theta = D6;
    Delta = A6;
    
%     figure; subplot(5,1,1); plot((1:length(Gamma))./fs,Gamma);title('GAMMA');
%     subplot(5,1,2); plot((1:length(Beta))./fs, Beta); title('BETA');
%     subplot(5,1,3); plot((1:length(Alpha))./fs,Alpha); title('ALPHA');
%     subplot(5,1,4); plot((1:length(Theta))./fs,Theta);title('THETA');
%     subplot(5,1,5);plot((1:length(Delta))./fs,Delta);title('DELTA');
%     
   
    %% Extract features
    
    % Coefficients
    aCoef = cD5;
    bCoef = cD4; 
    gCoef = cD3;
    dCoef = cA6;
    tCoef = cD6;
    
    % Reconstructed signal
    aSig = Alpha;
    bSig = Beta;
    gSig = Gamma;
    dSig = Delta;
    tSig = Theta;
    
    
  
end