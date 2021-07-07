% DWT analysis
signal = eeg.PRE;

alphaCoefAll

for currentSub = 1:length(eeg)
    for channel = 49:50
        [alphaCoef,betaCoef,alphaSig,betaSig] = DWT(signal(channel,:)); 
        alphaCoeffAll(currentSub)(channel) = 
    end
end