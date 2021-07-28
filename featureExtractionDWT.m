% DWT Analysis
% Returns:
    % Extracted subband coefficents for feature extraction
    % Reconstructed subband signals

%% Placebo
% Base
for sub = 1:numSubjects_tls
    for chan = 1:numChannels
        [aCoef,bCoef,aSig,bSig] = DWT(pbo_base(chan,:,sub));   
        [aCoef_pbo_base(chan,:,sub)] = aCoef;
        [bCoef_pbo_base(chan,:,sub)] = bCoef;  
        [aSig_pbo_base(chan,:,sub)] = aSig;
        [bSig_pbo_base(chan,:,sub)] = bSig;

    end
end
% First
for sub = 1:numSubjects_tls
    for chan = 1:numChannels
        [aCoef,bCoef,aSig,bSig] = DWT(pbo_first(chan,:,sub));  
        [aCoef_pbo_first(chan,:,sub)] = aCoef;
        [bCoef_pbo_first(chan,:,sub)] = bCoef;
        [aSig_pbo_first(chan,:,sub)] = aSig;
        [bSig_pbo_first(chan,:,sub)] = bSig;

    end
end
% Second
for sub = 1:numSubjects_tls
    for chan = 1:numChannels
        [aCoef,bCoef,aSig,bSig] = DWT(pbo_second(chan,:,sub));  
        [aCoef_pbo_second(chan,:,sub)] = aCoef;
        [bCoef_pbo_second(chan,:,sub)] = bCoef;
        [aSig_pbo_second(chan,:,sub)] = aSig;
        [bSig_pbo_second(chan,:,sub)] = bSig;

    end
end
% Rec
for sub = 1:numSubjects_tls
    for chan = 1:numChannels
        [aCoef,bCoef,aSig,bSig] = DWT(pbo_rec(chan,:,sub));  
        [aCoef_pbo_rec(chan,:,sub)] = aCoef;
        [bCoef_pbo_rec(chan,:,sub)] = bCoef;
        [aSig_pbo_rec(chan,:,sub)] = aSig;
        [bSig_pbo_rec(chan,:,sub)] = bSig;

    end
end

%% TLS

% Base
for sub = 1:numSubjects_tls
    for chan = 1:numChannels
        [aCoef,bCoef,aSig,bSig] = DWT(tls_base(chan,:,sub));   
        [aCoef_tls_base(chan,:,sub)] = aCoef;
        [bCoef_tls_base(chan,:,sub)] = bCoef;
        [aSig_tls_base(chan,:,sub)] = aSig;
        [bSig_tls_base(chan,:,sub)] = bSig;

    end
end
% First
for sub = 1:numSubjects_tls
    for chan = 1:numChannels
        [aCoef,bCoef,aSig,bSig] = DWT(tls_first(chan,:,sub));  
        [aCoef_tls_first(chan,:,sub)] = aCoef;
        [bCoef_tls_first(chan,:,sub)] = bCoef;
        [aSig_tls_first(chan,:,sub)] = aSig;
        [bSig_tls_first(chan,:,sub)] = bSig;

    end
end
% Second
for sub = 1:numSubjects_tls
    for chan = 1:numChannels
        [aCoef,bCoef,aSig,bSig] = DWT(tls_second(chan,:,sub));  
        [aCoef_tls_second(chan,:,sub)] = aCoef;
        [bCoef_tls_second(chan,:,sub)] = bCoef;
        [aSig_tls_second(chan,:,sub)] = aSig;
        [bSig_tls_second(chan,:,sub)] = bSig;

    end
end
% Rec
for sub = 1:numSubjects_tls
    for chan = 1:numChannels
        [aCoef,bCoef,aSig,bSig] = DWT(tls_rec(chan,:,sub));  
        [aCoef_tls_rec(chan,:,sub)] = aCoef;
        [bCoef_tls_rec(chan,:,sub)] = bCoef;
        [aSig_tls_rec(chan,:,sub)] = aSig;
        [bSig_tls_rec(chan,:,sub)] = bSig;

    end
end
