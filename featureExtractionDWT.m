% DWT Analysis
% Returns:
    % Extracted subband coefficents for feature extraction
    % Reconstructed subband signals

% Channel selection: find channels where mean diff in bandpower is > 0
[selectedChan] = find(meanDiff_alpha_second>0 & meanDiff_alpha_rec>0);
    
    
%% Placebo
%% Base - PBO
for sub = 1:numSubjects_pbo
    for chan = 1:length(selectedChan)
        [a_percentE,a_mean,a_var,a_std,b_mean,b_var,b_std,b_percentE] = DWT(pbo_base(selectedChan(chan),:,sub));
        
        a_percentE_pbo_base(chan,sub) = a_percentE;
        a_mean_pbo_base(chan,sub) = a_mean;
        a_var_pbo_base(chan,sub) = a_var;
        a_std_pbo_base(chan,sub) = a_std;
        
        b_percentE_pbo_base(chan,sub) = b_percentE;
        b_mean_pbo_base(chan,sub) = b_mean;
        b_var_pbo_base(chan,sub) = b_var;
        b_std_pbo_base(chan,sub) = b_std;
        

    end
end

%% Second - PBO
for sub = 1:numSubjects_pbo
    for chan = 1:length(selectedChan)
        [a_percentE,a_mean,a_var,a_std,b_mean,b_var,b_std,b_percentE] = DWT(pbo_second(selectedChan(chan),:,sub));
        
        a_percentE_pbo_second(chan,sub) = a_percentE;
        a_mean_pbo_second(chan,sub) = a_mean;
        a_var_pbo_second(chan,sub) = a_var;
        a_std_pbo_second(chan,sub) = a_std;
        
        b_percentE_pbo_second(chan,sub) = b_percentE;
        b_mean_pbo_second(chan,sub) = b_mean;
        b_var_pbo_second(chan,sub) = b_var;
        b_std_pbo_second(chan,sub) = b_std;
        
    end
end
%% Rec - PBO
for sub = 1:numSubjects_pbo
    for chan = 1:length(selectedChan)
        [a_percentE,a_mean,a_var,a_std,b_mean,b_var,b_std,b_percentE] = DWT(pbo_rec(selectedChan(chan),:,sub));

        a_percentE_pbo_rec(chan,sub) = a_percentE;
        a_mean_pbo_rec(chan,sub) = a_mean;
        a_var_pbo_rec(chan,sub) = a_var;
        a_std_pbo_rec(chan,sub) = a_std;
        
        b_percentE_pbo_rec(chan,sub) = b_percentE;
        b_mean_pbo_rec(chan,sub) = b_mean;
        b_var_pbo_rec(chan,sub) = b_var;
        b_std_pbo_rec(chan,sub) = b_std;
        
    end
end

%% TLS 
% Base - TLS
for sub = 1:numSubjects_tls
    for chan = 1:length(selectedChan)
        [a_percentE,a_mean,a_var,a_std,b_mean,b_var,b_std,b_percentE] = DWT(tls_base(selectedChan(chan),:,sub));   
        
        a_percentE_tls_base(chan,sub) = a_percentE;
        a_mean_tls_base(chan,sub) = a_mean;
        a_var_tls_base(chan,sub) = a_var;
        a_std_tls_base(chan,sub) = a_std;
        
        b_percentE_tls_base(chan,sub) = b_percentE;
        b_mean_tls_base(chan,sub) = b_mean;
        b_var_tls_base(chan,sub) = b_var;
        b_std_tls_base(chan,sub) = b_std;

    end
end

%% Second - TLS
for sub = 1:numSubjects_tls
    for chan = 1:length(selectedChan)
        [a_percentE,a_mean,a_var,a_std,b_mean,b_var,b_std,b_percentE] = DWT(tls_second(selectedChan(chan),:,sub));  

        a_percentE_tls_second(chan,sub) = a_percentE;
        a_mean_tls_second(chan,sub) = a_mean;
        a_var_tls_second(chan,sub) = a_var;
        a_std_tls_second(chan,sub) = a_std;
        
        b_percentE_tls_second(chan,sub) = b_percentE;
        b_mean_tls_second(chan,sub) = b_mean;
        b_var_tls_second(chan,sub) = b_var;
        b_std_tls_second(chan,sub) = b_std;
        
    end
end

%% Rec - TLS
for sub = 1:numSubjects_tls
    for chan = 1:length(selectedChan)
        [a_percentE,a_mean,a_var,a_std,b_mean,b_var,b_std,b_percentE] = DWT(tls_rec(selectedChan(chan),:,sub));  
        
        a_percentE_tls_rec(chan,sub) = a_percentE;
        a_mean_tls_rec(chan,sub) = a_mean;
        a_var_tls_rec(chan,sub) = a_var;
        a_std_tls_rec(chan,sub) = a_std;
        
        b_percentE_tls_rec(chan,sub) = b_percentE;
        b_mean_tls_rec(chan,sub) = b_mean;
        b_var_tls_rec(chan,sub) = b_var;
        b_std_tls_rec(chan,sub) = b_std;
        
        
    end
end

%% Plot features in 2D space
% Based on plots:
% % energy and variance provide the best discriminating features
% Maybe use QDA classifier 

%% alpha
figure;
sgtitle("alpha band features TLS vs PBO for selected channels")
subplot(1,2,1)
mean_aEnergy_tls_second = mean(a_percentE_tls_second,2);
mean_aVar_tls_second = mean(a_var_tls_second,2);
scatter(mean_aEnergy_tls_second,mean_aVar_tls_second,'filled','red')
hold on;
mean_aEnergy_pbo_second = mean(a_percentE_pbo_second,2);
mean_aVar_pbo_second = mean(a_var_pbo_second,2);
scatter(mean_aEnergy_pbo_second,mean_aVar_pbo_second,'filled','blue')
title("mean % energy and var across subjects");
ylabel('mean var');
xlabel('mean % energy');
legend('TLS','PBO')
hold on;
mean_aEnergy_tls_rec = mean(a_percentE_tls_rec,2);
mean_aVar_tls_rec = mean(a_var_tls_rec,2);
scatter(mean_aEnergy_tls_rec,mean_aVar_tls_rec,'red')
hold on;
mean_aEnergy_pbo_rec = mean(a_percentE_pbo_rec,2);
mean_aVar_pbo_rec = mean(a_var_pbo_rec,2);
scatter(mean_aEnergy_pbo_rec,mean_aVar_pbo_rec,'blue')
legend('TLS 4-8 min','PBO 4-8 min','TLS rec','PBO rec')

subplot(1,2,2)
mean_aMean_tls_second = mean(a_mean_tls_second,2);
mean_aStd_tls_second = mean(a_std_tls_second,2);
scatter(mean_aMean_tls_second,mean_aStd_tls_second,'filled','red')
hold on;
mean_aMean_pbo_second = mean(a_mean_pbo_second,2);
mean_aStd_pbo_second = mean(a_std_pbo_second,2);
scatter(mean_aMean_pbo_second,mean_aStd_pbo_second,'filled','blue')
title("mean coeff mean and std across subjects");
ylabel('mean std');
xlabel('mean coeff mean');
hold on;
mean_aMean_tls_rec = mean(a_mean_tls_rec,2);
mean_aStd_tls_rec = mean(a_std_tls_rec,2);
scatter(mean_aMean_tls_rec,mean_aStd_tls_rec,'red')
hold on;
mean_aMean_pbo_rec = mean(a_mean_pbo_rec,2);
mean_aStd_pbo_rec = mean(a_std_pbo_rec,2);
scatter(mean_aMean_pbo_rec,mean_aStd_pbo_rec,'blue')
legend('TLS 4-8 min','PBO 4-8 min','TLS rec','PBO rec')

%% beta
figure;
sgtitle("beta band features TLS vs PBO for selected channels")
subplot(1,2,1)
mean_bEnergy_tls_second = mean(b_percentE_tls_second,2);
mean_bVar_tls_second = mean(b_var_tls_second,2);
scatter(mean_bEnergy_tls_second,mean_bVar_tls_second,'filled','red')
hold on;
mean_bEnergy_pbo_second = mean(b_percentE_pbo_second,2);
mean_bVar_pbo_second = mean(b_var_pbo_second,2);
scatter(mean_bEnergy_pbo_second,mean_bVar_pbo_second,'filled','blue')
title("mean % energy and var across subjects");
ylabel('mean var');
xlabel('mean % energy');
legend('TLS','PBO')
hold on;
mean_bEnergy_tls_rec = mean(b_percentE_tls_rec,2);
mean_bVar_tls_rec = mean(b_var_tls_rec,2);
scatter(mean_bEnergy_tls_rec,mean_bVar_tls_rec,'red')
hold on;
mean_bEnergy_pbo_rec = mean(b_percentE_pbo_rec,2);
mean_bVar_pbo_rec = mean(b_var_pbo_rec,2);
scatter(mean_bEnergy_pbo_rec,mean_bVar_pbo_rec,'blue')
legend('TLS 4-8 min','PBO 4-8 min','TLS rec','PBO rec')

subplot(1,2,2)
mean_bMean_tls_second = mean(b_mean_tls_second,2);
mean_bStd_tls_second = mean(b_std_tls_second,2);
scatter(mean_bMean_tls_second,mean_bStd_tls_second,'filled','red')
hold on;
mean_bMean_pbo_second = mean(b_mean_pbo_second,2);
mean_bStd_pbo_second = mean(b_std_pbo_second,2);
scatter(mean_bMean_pbo_second,mean_bStd_pbo_second,'filled','blue')
title("mean coeff mean and std across subjects");
ylabel('mean std');
xlabel('mean coeff mean');
hold on;
mean_bMean_tls_rec = mean(b_mean_tls_rec,2);
mean_bStd_tls_rec = mean(b_std_tls_rec,2);
scatter(mean_bMean_tls_rec,mean_bStd_tls_rec,'red')
hold on;
mean_bMean_pbo_rec = mean(b_mean_pbo_rec,2);
mean_bStd_pbo_rec = mean(b_std_pbo_rec,2);
scatter(mean_bMean_pbo_rec,mean_bStd_pbo_rec,'blue')
legend('TLS 4-8 min','PBO 4-8 min','TLS rec','PBO rec')
