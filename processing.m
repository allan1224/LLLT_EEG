eeglab
close all
clear
clc

%% Load dataset

fs = 512;

numSubjects_tls = 2;
numSubjects_pbo = 2;

for sub = 1:numSubjects_tls
    EEG = pop_loadset(['sub' num2str(sub) '_ICA.set'], '/Users/allan/Documents/MATLAB/LLLT_EEG/SubjectData/tls');
    tls_base(1:70,:,sub) = EEG.data(1:70,60*fs:2*fs*60);
    tls_first(1:70,:,sub) = EEG.data(1:70,2*60*fs+1:6*60*fs);
    tls_second(1:70,:,sub) = EEG.data(1:70,6*60*fs+1:10*60*fs);
    tls_rec(1:70,:,sub) = EEG.data(1:70,10*60*fs+1:12*60*fs);
end

for sub = 1:numSubjects_pbo
    EEG = pop_loadset(['sub' num2str(sub) '_ICA.set'], '/Users/allan/Documents/MATLAB/LLLT_EEG/SubjectData/pbo');
    pbo_base(1:70,:,sub) = EEG.data(1:70,60*fs:2*fs*60);
    pbo_first(1:70,:,sub) = EEG.data(1:70,2*60*fs+1:6*60*fs);
    pbo_second(1:70,:,sub) = EEG.data(1:70,6*60*fs+1:10*60*fs);
    pbo_rec(1:70,:,sub) = EEG.data(1:70,10*60*fs+1:12*60*fs);
end


%% PSD
% can skip this long run time by run thisline
% load('all_pxx_spectra_4secondwin_3overlap.mat')
for j =1:46
for i = 1:64
    [pxx_tls_base(i,:,j) f1] = pwelch(tls_base(i,:,j),4*fs,3*fs,4*fs,fs,'psd');
    [pxx_pbo_base(i,:,j) f1] = pwelch(pbo_base(i,:,j),4*fs,3*fs,4*fs,fs,'psd');
    
    [pxx_tls_first(i,:,j) f1] = pwelch(tls_first(i,:,j),4*fs,3*fs,4*fs,fs,'psd');
    [pxx_pbo_first(i,:,j) f1] = pwelch(pbo_first(i,:,j),4*fs,3*fs,4*fs,fs,'psd');
%     
    [pxx_tls_second(i,:,j) f1] = pwelch(tls_second(i,:,j),4*fs,3*fs,4*fs,fs,'psd');
    [pxx_pbo_second(i,:,j) f1] = pwelch(pbo_second(i,:,j),4*fs,3*fs,4*fs,fs,'psd');
%     
    [pxx_tls_rec(i,:,j) f1] = pwelch(tls_rec(i,:,j),4*fs,3*fs,4*fs,fs,'psd');
    [pxx_pbo_rec(i,:,j) f1] = pwelch(pbo_rec(i,:,j),4*fs,3*fs,4*fs,fs,'psd');
end
end

%% without dB
 
nodB_nor_pxx_tls_first = (pxx_tls_first./pxx_tls_base)-1;
nodB_nor_pxx_pbo_first = (pxx_pbo_first./pxx_pbo_base)-1;
 
nodB_nor_pxx_tls_second = (pxx_tls_second./pxx_tls_base)-1;
nodB_nor_pxx_pbo_second = (pxx_pbo_second./pxx_pbo_base)-1;
 
nodB_nor_pxx_tls_rec = (pxx_tls_rec./pxx_tls_base)-1;
nodB_nor_pxx_pbo_rec = (pxx_pbo_rec./pxx_pbo_base)-1;
 
%%%%%%%%%%% Figure normalized PSD cahgnes in DB
 
i = 34;
figure('color','w')
plot(f1,mean(nodB_nor_pxx_pbo_second(i,:,:),3),'ko--','linewidth',3,'markersize',7)
xlim([1 70])
ylim([-0.6 0.4])
hold on
xlabel('Frequency (Hz)')
ylabel('change of power (%)')
plot(f1,mean(nodB_nor_pxx_tls_second(i,:,:),3),'r*-','linewidth',2.5,'markersize',7)
xticks([1 4 8 13 30 70])
yticks([-0.6 -0.4 -0.2 0 0.2 0.4])
% title(chan_names{i})
set(gca,'xscale','log','fontsize',30,'fontweight','bold','linewidth',3,'Xcolor','k','Ycolor','k');

%4*fs

for j =1:46
    for i = 1:64
        nor_fb1_tls_first(i,j) = squeeze(mean(pxx_tls_first(i,8:15,j)))./squeeze(mean(pxx_tls_base(i,8:15,j)));
        nor_fb1_pbo_first(i,j) = squeeze(mean(pxx_pbo_first(i,8:15,j)))./squeeze(mean(pxx_pbo_base(i,8:15,j)));

        nor_fb2_tls_first(i,j) = squeeze(mean(pxx_tls_first(i,18:29,j)))./squeeze(mean(pxx_tls_base(i,18:29,j)));
        nor_fb2_pbo_first(i,j) = squeeze(mean(pxx_pbo_first(i,18:29,j)))./squeeze(mean(pxx_pbo_base(i,18:29,j)));

        nor_fb3_tls_first(i,j) = squeeze(mean(pxx_tls_first(i,37:53,j)))./squeeze(mean(pxx_tls_base(i,37:53,j)));
        nor_fb3_pbo_first(i,j) = squeeze(mean(pxx_pbo_first(i,37:53,j)))./squeeze(mean(pxx_pbo_base(i,37:53,j)));

        nor_fb4_tls_first(i,j) = squeeze(mean(pxx_tls_first(i,47:115,j)))./squeeze(mean(pxx_tls_base(i,47:115,j)));
        nor_fb4_pbo_first(i,j) = squeeze(mean(pxx_pbo_first(i,47:115,j)))./squeeze(mean(pxx_pbo_base(i,47:115,j)));

        nor_fb5_tls_first(i,j) = squeeze(mean(pxx_tls_first(i,122:281,j)))./squeeze(mean(pxx_tls_base(i,122:281,j)));
        nor_fb5_pbo_first(i,j) = squeeze(mean(pxx_pbo_first(i,122:281,j)))./squeeze(mean(pxx_pbo_base(i,122:281,j)));

    end
end



for j =1:46
for i = 1:64
nor_fb1_tls_second(i,j) = squeeze(mean(pxx_tls_second(i,8:15,j)))./squeeze(mean(pxx_tls_base(i,8:15,j)));
nor_fb1_pbo_second(i,j) = squeeze(mean(pxx_pbo_second(i,8:15,j)))./squeeze(mean(pxx_pbo_base(i,8:15,j)));

nor_fb2_tls_second(i,j) = squeeze(mean(pxx_tls_second(i,18:29,j)))./squeeze(mean(pxx_tls_base(i,18:29,j)));
nor_fb2_pbo_second(i,j) = squeeze(mean(pxx_pbo_second(i,18:29,j)))./squeeze(mean(pxx_pbo_base(i,18:29,j)));

nor_fb3_tls_second(i,j) = squeeze(mean(pxx_tls_second(i,37:53,j)))./squeeze(mean(pxx_tls_base(i,37:53,j)));
nor_fb3_pbo_second(i,j) = squeeze(mean(pxx_pbo_second(i,37:53,j)))./squeeze(mean(pxx_pbo_base(i,37:53,j)));

nor_fb4_tls_second(i,j) = squeeze(mean(pxx_tls_second(i,47:115,j)))./squeeze(mean(pxx_tls_base(i,47:115,j)));
nor_fb4_pbo_second(i,j) = squeeze(mean(pxx_pbo_second(i,47:115,j)))./squeeze(mean(pxx_pbo_base(i,47:115,j)));

nor_fb5_tls_second(i,j) = squeeze(mean(pxx_tls_second(i,122:281,j)))./squeeze(mean(pxx_tls_base(i,122:281,j)));
nor_fb5_pbo_second(i,j) = squeeze(mean(pxx_pbo_second(i,122:281,j)))./squeeze(mean(pxx_pbo_base(i,122:281,j)));


end
end

for j =1:46
for i = 1:64
nor_fb1_tls_rec(i,j) = squeeze(mean(pxx_tls_rec(i,8:15,j)))./squeeze(mean(pxx_tls_base(i,8:15,j)));
nor_fb1_pbo_rec(i,j) = squeeze(mean(pxx_pbo_rec(i,8:15,j)))./squeeze(mean(pxx_pbo_base(i,8:15,j)));
 
nor_fb2_tls_rec(i,j) = squeeze(mean(pxx_tls_rec(i,18:29,j)))./squeeze(mean(pxx_tls_base(i,18:29,j)));
nor_fb2_pbo_rec(i,j) = squeeze(mean(pxx_pbo_rec(i,18:29,j)))./squeeze(mean(pxx_pbo_base(i,18:29,j)));
 
nor_fb3_tls_rec(i,j) = squeeze(mean(pxx_tls_rec(i,37:53,j)))./squeeze(mean(pxx_tls_base(i,37:53,j)));
nor_fb3_pbo_rec(i,j) = squeeze(mean(pxx_pbo_rec(i,37:53,j)))./squeeze(mean(pxx_pbo_base(i,37:53,j)));
  
nor_fb4_tls_rec(i,j) = squeeze(mean(pxx_tls_rec(i,47:115,j)))./squeeze(mean(pxx_tls_base(i,47:115,j)));
nor_fb4_pbo_rec(i,j) = squeeze(mean(pxx_pbo_rec(i,47:115,j)))./squeeze(mean(pxx_pbo_base(i,47:115,j)));
  
nor_fb5_tls_rec(i,j) = squeeze(mean(pxx_tls_rec(i,122:281,j)))./squeeze(mean(pxx_tls_base(i,122:281,j)));
nor_fb5_pbo_rec(i,j) = squeeze(mean(pxx_pbo_rec(i,122:281,j)))./squeeze(mean(pxx_pbo_base(i,122:281,j)));
 
 
end
end
 


%% tPBM PBO results
% [h_fb1 p_fb1] = ttest(nor_fb1_tls_first',nor_fb1_pbo_first','alpha',0.05);

mean_fb1_first = mean(nor_fb1_tls_first')-mean(nor_fb1_pbo_first');
for i = 1:64
[pval_ther_laser_fb1_first(i), ~, effectsize_ther_laser_fb1_first(i)] = permutationTest(tls_data, pbo_data, 10000,'sidedness','larger');
end
sorted_p = sort(pval_fb1_laser_first);
sorted_p = round(sorted_p,2);
threshold_level = round(linspace(1,64,64).*0.05/64,2);
P=InterX([threshold_level;threshold_level],[threshold_level;sorted_p]);
P(P>0.05) = 0;
thre = max(max(P));
% thre = 0.04;
if isempty(thre) & max(max(sorted_p))>0.05
    thre = 0;
elseif isempty(thre) & max(max(sorted_p))<0.05
    thre = 1;
end
h_fb1_first = -ones(size(pval_fb1_laser_first));
h_fb1_first(round(pval_fb1_laser_first,2)-0.001>thre) = 0;
hun_fb1_first = -ones(size(pval_fb1_laser_first));
hun_fb1_first(pval_fb1_laser_first>0.05) = 0;

figure
plot(linspace(1,64,64),threshold_level,'r-',linspace(1,64,64),sorted_p ,'g*')

% [h_fb1 p_fb1] = ttest(nor_fb1_tls_second',nor_fb1_pbo_second','alpha',0.05);
mean_fb1_second = mean(nor_fb1_tls_second')-mean(nor_fb1_pbo_second');
for i = 1:64
[pval_fb1_laser_second(i), t_orig_fb1_laser_second(i,:), crit_t_fb1_laser_second(i,:), est_alpha, seed_state]=mult_comp_perm_t1((nor_fb1_tls_second(i,:)'-nor_fb1_pbo_second(i,:)'),10000,-1,0.05,0);
end
sorted_p = sort(pval_fb1_laser_second);
sorted_p = round(sorted_p,2);
threshold_level = round(linspace(1,64,64).*0.08/64,2);
P=InterX([threshold_level;threshold_level],[threshold_level;sorted_p]);
P(P>0.05) = 0;
thre = max(max(P));
% thre = 0.044;
if isempty(thre) & max(max(sorted_p))>0.05
    thre = 0;
elseif isempty(thre) & max(max(sorted_p))<0.05
    thre = 1;
end
h_fb1_second = -ones(size(pval_fb1_laser_second));
h_fb1_second(round(pval_fb1_laser_second,2)-0.001>thre) = 0;
hun_fb1_second = -ones(size(pval_fb1_laser_second));
hun_fb1_second(pval_fb1_laser_second>0.05) = 0;
figure
plot(linspace(1,64,64),threshold_level,'r-',linspace(1,64,64),sorted_p ,'g*')

% [h_fb1 p_fb1] = ttest(nor_fb1_tls_rec',nor_fb1_pbo_rec','alpha',0.05);
mean_fb1_rec = mean(nor_fb1_tls_rec')-mean(nor_fb1_pbo_rec');
for i = 1:64
[pval_fb1_laser_rec(i), t_orig_fb1_laser_rec(i,:), crit_t_fb1_laser_rec(i,:), est_alpha, seed_state]=mult_comp_perm_t1((nor_fb1_tls_rec(i,:)'-nor_fb1_pbo_rec(i,:)'),10000,-1,0.05,0);
end
sorted_p = sort(pval_fb1_laser_rec);
sorted_p = round(sorted_p,2);
threshold_level = round(linspace(1,64,64).*0.08/64,2);
P=InterX([threshold_level;threshold_level],[threshold_level;sorted_p]);
P(P>0.05) = 0;
thre = max(max(P));
% thre = 0.024;

if isempty(thre) & max(max(sorted_p))>0.05
    thre = 0;
elseif isempty(thre) & max(max(sorted_p))<0.05
    thre = 1;
end
h_fb1_rec = -ones(size(pval_fb1_laser_rec));
h_fb1_rec(round(pval_fb1_laser_rec,2)-0.001>thre) = 0;
hun_fb1_rec = -ones(size(pval_fb1_laser_rec));
hun_fb1_rec(pval_fb1_laser_rec>0.05) = 0;
figure
plot(linspace(1,64,64),threshold_level,'r-',linspace(1,64,64),sorted_p ,'g*')

load('Loc.mat');
figure('color','w')
subplot(3,3,1)
topoplot(mean_fb1_first,Loc)
set(gca,'Clim',[-0.2 0.2])
% title('average')
subplot(3,3,2)
topoplot_dc(hun_fb1_first,Loc)
set(gca,'Clim',[-1 1])
title('uncorrected')
subplot(3,3,3)
topoplot_dc(h_fb1_first,Loc)
set(gca,'Clim',[-1 1])
% title('FDR corrected')


subplot(3,3,4)
topoplot(mean_fb1_second,Loc)
set(gca,'Clim',[-0.2 0.2])
% title('average')
subplot(3,3,5)
topoplot_dc(hun_fb1_second,Loc)
set(gca,'Clim',[-1 1])
title('uncorrected')
subplot(3,3,6)
topoplot_dc(h_fb1_second,Loc)
set(gca,'Clim',[-1 1])
% title('FDR corrected')


subplot(3,3,7)
topoplot(mean_fb1_rec,Loc)
set(gca,'Clim',[-0.2 0.2])
% title('average')
subplot(3,3,8)
topoplot_dc(hun_fb1_rec,Loc)
set(gca,'Clim',[-1 1])
title('uncorrected')
subplot(3,3,9)
topoplot_dc(h_fb1_rec,Loc)
set(gca,'Clim',[-1 1])
% title('FDR corrected')
suptitle('tPBM vs Sham: delta')


% [h_fb2 p_fb2] = ttest(nor_fb2_tls_first',nor_fb2_pbo_first','alpha',0.05);
mean_fb2_first = mean(nor_fb2_tls_first')-mean(nor_fb2_pbo_first');
for i = 1:64
[pval_fb2_laser_first(i), t_orig_fb2_laser_first(i,:), crit_t_fb2_laser_first(i,:), est_alpha, seed_state]=mult_comp_perm_t1((nor_fb2_tls_first(i,:)'-nor_fb2_pbo_first(i,:)'),10000,1,0.05,0);
end
sorted_p = sort(pval_fb2_laser_first);
sorted_p = round(sorted_p,2);
threshold_level = round(linspace(1,64,64).*0.05/64,2);
P=InterX([threshold_level;threshold_level],[threshold_level;sorted_p]);
P(P>0.05) = 0;
thre = max(max(P));
if isempty(thre) & max(max(sorted_p))>0.05
    thre = 0;
elseif isempty(thre) & max(max(sorted_p))<0.05
    thre = 1;
end
h_fb2_first = ones(size(pval_fb2_laser_first));
h_fb2_first(pval_fb2_laser_first>thre) = 0;
hun_fb2_first = ones(size(pval_fb2_laser_first));
hun_fb2_first(pval_fb2_laser_first>0.05) = 0;
figure
plot(linspace(1,64,64),threshold_level,'r-',linspace(1,64,64),sorted_p ,'g*')
 
% [h_fb2 p_fb2] = ttest(nor_fb2_tls_second',nor_fb2_pbo_second','alpha',0.05);
mean_fb2_second = mean(nor_fb2_tls_second')-mean(nor_fb2_pbo_second');
for i = 1:64
[pval_fb2_laser_second(i), t_orig_fb2_laser_second(i,:), crit_t_fb2_laser_second(i,:), est_alpha, seed_state]=mult_comp_perm_t1((nor_fb2_tls_second(i,:)'-nor_fb2_pbo_second(i,:)'),10000,1,0.05,0);
end
sorted_p = sort(pval_fb2_laser_second);
sorted_p = round(sorted_p,2);
threshold_level = round(linspace(1,64,64).*0.05/64,2);
P=InterX([threshold_level;threshold_level],[threshold_level;sorted_p]);
P(P>0.05) = 0;
thre = max(max(P));
if isempty(thre) & max(max(sorted_p))>0.05
    thre = 0;
elseif isempty(thre) & max(max(sorted_p))<0.05
    thre = 1;
end
h_fb2_second = ones(size(pval_fb2_laser_second));
h_fb2_second(pval_fb2_laser_second>thre) = 0;
hun_fb2_second = ones(size(pval_fb2_laser_second));
hun_fb2_second(pval_fb2_laser_second>0.05) = 0;
figure
plot(linspace(1,64,64),threshold_level,'r-',linspace(1,64,64),sorted_p ,'g*')


% [h_fb2 p_fb2] = ttest(nor_fb2_tls_rec',nor_fb2_pbo_rec','alpha',0.05);
mean_fb2_rec = mean(nor_fb2_tls_rec')-mean(nor_fb2_pbo_rec');
for i = 1:64
[pval_fb2_laser_rec(i), t_orig_fb2_laser_rec(i,:), crit_t_fb2_laser_rec(i,:), est_alpha, seed_state]=mult_comp_perm_t1((nor_fb2_tls_rec(i,:)'-nor_fb2_pbo_rec(i,:)'),10000,1,0.05,0);
end
sorted_p = sort(pval_fb2_laser_rec);
sorted_p = round(sorted_p,2);
threshold_level = round(linspace(1,64,64).*0.05/64,2);
P=InterX([threshold_level;threshold_level],[threshold_level;sorted_p]);
P(P>0.05) = 0;
thre = max(max(P));
if isempty(thre) & max(max(sorted_p))>0.05
    thre = 0;
elseif isempty(thre) & max(max(sorted_p))<0.05
    thre = 1;
end
h_fb2_rec = ones(size(pval_fb2_laser_rec));
h_fb2_rec(pval_fb2_laser_rec>thre) = 0;
hun_fb2_rec = ones(size(pval_fb2_laser_rec));
hun_fb2_rec(pval_fb2_laser_rec>0.05) = 0;
figure
plot(linspace(1,64,64),threshold_level,'r-',linspace(1,64,64),sorted_p ,'g*')


load('Loc.mat');
figure('color','w')
subplot(3,3,1)
topoplot(mean_fb2_first,Loc)
set(gca,'Clim',[-0.2 0.2])
% title('average')
subplot(3,3,2)
topoplot_dc(hun_fb2_first,Loc)
set(gca,'Clim',[-1 1])
title('uncorrected')
subplot(3,3,3)
topoplot_dc(h_fb2_first,Loc)
set(gca,'Clim',[-1 1])
% title('FDR corrected')
 
 
subplot(3,3,4)
topoplot(mean_fb2_second,Loc)
set(gca,'Clim',[-0.2 0.2])
% title('average')
subplot(3,3,5)
topoplot_dc(hun_fb2_second,Loc)
set(gca,'Clim',[-1 1])
title('uncorrected')
subplot(3,3,6)
topoplot_dc(h_fb2_second,Loc)
set(gca,'Clim',[-1 1])
% title('FDR corrected')
 
 
subplot(3,3,7)
topoplot(mean_fb2_rec,Loc)
set(gca,'Clim',[-0.2 0.2])
% title('average')
subplot(3,3,8)
topoplot_dc(hun_fb2_rec,Loc)
set(gca,'Clim',[-1 1])
title('uncorrected')
subplot(3,3,9)
topoplot_dc(h_fb2_rec,Loc)
set(gca,'Clim',[-1 1])
% title('FDR corrected')
suptitle('tPBM vs Sham: theta')


% [h_fb3 p_fb3] = ttest(nor_fb3_tls_first',nor_fb3_pbo_first','alpha',0.05);
mean_fb3_first = mean(nor_fb3_tls_first')-mean(nor_fb3_pbo_first');
for i = 1:64
[pval_fb3_laser_first(i), t_orig_fb3_laser_first(i,:), crit_t_fb3_laser_first(i,:), est_alpha, seed_state]=mult_comp_perm_t1((nor_fb3_tls_first(i,:)'-nor_fb3_pbo_first(i,:)'),10000,1,0.05,0);
end
sorted_p = sort(pval_fb3_laser_first);
sorted_p = round(sorted_p,2);
threshold_level = round(linspace(1,64,64).*0.05/64,2);
P=InterX([threshold_level;threshold_level],[threshold_level;sorted_p]);
P(P>0.05) = 0;
thre = max(max(P));
if isempty(thre) & max(max(sorted_p))>0.05
    thre = 0;
elseif isempty(thre) & max(max(sorted_p))<0.05
    thre = 1;
end
h_fb3_first = ones(size(pval_fb3_laser_first));
h_fb3_first(round(pval_fb3_laser_first,2)+0.001>=thre) = 0;
hun_fb3_first = ones(size(pval_fb3_laser_first));
hun_fb3_first(pval_fb3_laser_first>0.05) = 0;
figure
plot(linspace(1,64,64),threshold_level,'r-',linspace(1,64,64),sorted_p ,'g*')


 
% [h_fb3 p_fb3] = ttest(nor_fb3_tls_second',nor_fb3_pbo_second','alpha',0.05);
mean_fb3_second = mean(nor_fb3_tls_second')-mean(nor_fb3_pbo_second');
for i = 1:64
[pval_fb3_laser_second(i), t_orig_fb3_laser_second(i,:), crit_t_fb3_laser_second(i,:), est_alpha, seed_state]=mult_comp_perm_t1((nor_fb3_tls_second(i,:)'-nor_fb3_pbo_second(i,:)'),10000,1,0.05,0);
end
sorted_p = sort(pval_fb3_laser_second);
sorted_p = round(sorted_p,2);
threshold_level = round(linspace(1,64,64).*0.05/64,2);
P=InterX([threshold_level;threshold_level],[threshold_level;sorted_p]);
P(P>0.05) = 0;
thre = max(max(P));
% thre = 0.039;
if isempty(thre) & max(max(sorted_p))>0.05
    thre = 0;
elseif isempty(thre) & max(max(sorted_p))<0.05
    thre = 1;
end
h_fb3_second = ones(size(pval_fb3_laser_second));
h_fb3_second(round(pval_fb3_laser_second,2)+0.001>=thre) = 0;
hun_fb3_second = ones(size(pval_fb3_laser_second));
hun_fb3_second(pval_fb3_laser_second>0.05) = 0;
figure
plot(linspace(1,64,64),threshold_level,'r-',linspace(1,64,64),sorted_p ,'g*')
 
% [h_fb3 p_fb3] = ttest(nor_fb3_tls_rec',nor_fb3_pbo_rec','alpha',0.05);
nor_fb3_pbo_rec(:,25) = mean(nor_fb3_pbo_rec,2);
nor_fb3_tls_rec(:,25) = mean(nor_fb3_tls_rec,2);
mean_fb3_rec = mean(nor_fb3_tls_rec')-mean(nor_fb3_pbo_rec');
for i = 1:64
[pval_fb3_laser_rec(i), t_orig_fb3_laser_rec(i,:), crit_t_fb3_laser_rec(i,:), est_alpha, seed_state]=mult_comp_perm_t1((nor_fb3_tls_rec(i,:)'-nor_fb3_pbo_rec(i,:)'),10000,1,0.05,0);
end
sorted_p = sort(pval_fb3_laser_rec);
sorted_p = round(sorted_p,2);
threshold_level = round(linspace(1,64,64).*0.07/64,2);
P=InterX([threshold_level;threshold_level],[threshold_level;sorted_p]);
P(P>0.05) = 0;
thre = max(max(P));
% thre = 0.024;
if isempty(thre) & max(max(sorted_p))>0.05
    thre = 0;
elseif isempty(thre) & max(max(sorted_p))<0.05
    thre = 1;
end
h_fb3_rec = ones(size(pval_fb3_laser_rec));
h_fb3_rec(round(pval_fb3_laser_rec,2)+0.001>=thre) = 0;
hun_fb3_rec = ones(size(pval_fb3_laser_rec));
hun_fb3_rec(pval_fb3_laser_rec>0.05) = 0;
figure
plot(linspace(1,64,64),threshold_level,'r-',linspace(1,64,64),sorted_p ,'g*')

load('Loc.mat');
figure('color','w')
subplot(3,3,1)
topoplot(mean_fb3_first,Loc)
set(gca,'Clim',[-0.2 0.2])
% title('average')
subplot(3,3,2)
topoplot_dc(hun_fb3_first,Loc)
set(gca,'Clim',[-1 1])
title('uncorrected')
subplot(3,3,3)
topoplot_dc(h_fb3_first,Loc)
set(gca,'Clim',[-1 1])
% title('FDR corrected')
 
 
subplot(3,3,4)
topoplot(mean_fb3_second,Loc)
set(gca,'Clim',[-0.2 0.2])
% title('average')
subplot(3,3,5)
topoplot_dc(hun_fb3_second,Loc)
set(gca,'Clim',[-1 1])
title('uncorrected')
subplot(3,3,6)
topoplot_dc(h_fb3_second,Loc)
set(gca,'Clim',[-1 1])
% title('FDR corrected')
 
 
subplot(3,3,7)
topoplot(mean_fb3_rec,Loc)
set(gca,'Clim',[-0.2 0.2])
% title('average')
subplot(3,3,8)
topoplot_dc(hun_fb3_rec,Loc)
set(gca,'Clim',[-1 1])
title('uncorrected')
subplot(3,3,9)
topoplot_dc(h_fb3_rec,Loc)
set(gca,'Clim',[-1 1])
% title('FDR corrected')
suptitle('tPBM vs Sham: alpha')


% [h_fb4 p_fb4] = ttest(nor_fb4_tls_first',nor_fb4_pbo_first','alpha',0.05);
mean_fb4_first = mean(nor_fb4_tls_first')-mean(nor_fb4_pbo_first');
for i = 1:64
[pval_fb4_laser_first(i), t_orig_fb4_laser_first(i,:), crit_t_fb4_laser_first(i,:), est_alpha, seed_state]=mult_comp_perm_t1((nor_fb4_tls_first(i,:)'-nor_fb4_pbo_first(i,:)'),10000,1,0.05,0);
end
sorted_p = sort(pval_fb4_laser_first);
sorted_p = round(sorted_p,2);
threshold_level = round(linspace(1,64,64).*0.05/64,2);
P=InterX([threshold_level;threshold_level],[threshold_level;sorted_p]);
P(P>0.05) = 0;
thre = max(max(P));
if isempty(thre) & max(max(sorted_p))>0.05
    thre = 0;
elseif isempty(thre) & max(max(sorted_p))<0.05
    thre = 1;
end
h_fb4_first = ones(size(pval_fb4_laser_first));
h_fb4_first(round(pval_fb4_laser_first,2)-0.001>thre) = 0;
hun_fb4_first = ones(size(pval_fb4_laser_first));
hun_fb4_first(pval_fb4_laser_first>0.05) = 0;

 figure
plot(linspace(1,64,64),threshold_level,'r-',linspace(1,64,64),sorted_p ,'g*')
 
% [h_fb4 p_fb4] = ttest(nor_fb4_tls_second',nor_fb4_pbo_second','alpha',0.05);
% nor_fb4_tls_second(:,15) = mean(nor_fb4_tls_second,2);
% nor_fb4_pbo_second(:,15) = mean(nor_fb4_pbo_second,2);
mean_fb4_second = mean(nor_fb4_tls_second')-mean(nor_fb4_pbo_second');
for i = 1:64
[pval_fb4_laser_second(i), t_orig_fb4_laser_second(i,:), crit_t_fb4_laser_second(i,:), est_alpha, seed_state]=mult_comp_perm_t1((nor_fb4_tls_second(i,:)'-nor_fb4_pbo_second(i,:)'),10000,1,0.05,0);
end
sorted_p = sort(pval_fb4_laser_second);
sorted_p = round(sorted_p,2);
threshold_level = round(linspace(1,64,64).*0.08/64,2);
P=InterX([threshold_level;threshold_level],[threshold_level;sorted_p]);
P(P>0.05) = 0;
thre = max(max(P));
% thre = 0.024;
if isempty(thre) & max(max(sorted_p))>0.05
    thre = 0;
elseif isempty(thre) & max(max(sorted_p))<0.05
    thre = 1;
end
h_fb4_second = ones(size(pval_fb4_laser_second));
h_fb4_second(round(pval_fb4_laser_second,2)-0.001>thre) = 0;
hun_fb4_second = ones(size(pval_fb4_laser_second));
hun_fb4_second(pval_fb4_laser_second>0.05) = 0;

 figure
plot(linspace(1,64,64),threshold_level,'r-',linspace(1,64,64),sorted_p ,'g*')

% [h_fb4 p_fb4] = ttest(nor_fb4_tls_rec',nor_fb4_pbo_rec','alpha',0.05);

mean_fb4_rec = mean(nor_fb4_tls_rec')-mean(nor_fb4_pbo_rec');
for i = 1:64
[pval_fb4_laser_rec(i), t_orig_fb4_laser_rec(i,:), crit_t_fb4_laser_rec(i,:), est_alpha, seed_state]=mult_comp_perm_t1((nor_fb4_tls_rec(i,:)'-nor_fb4_pbo_rec(i,:)'),10000,1,0.05,0);
end
sorted_p = sort(pval_fb4_laser_rec);
sorted_p = round(sorted_p,2);
threshold_level = round(linspace(1,64,64).*0.05/64,2);
P=InterX([threshold_level;threshold_level],[threshold_level;sorted_p]);
thre = max(max(P));
if isempty(thre) & max(max(sorted_p))>0.05
    thre = 0;
elseif isempty(thre) & max(max(sorted_p))<0.05
    thre = 1;
end
h_fb4_rec = ones(size(pval_fb4_laser_rec));
h_fb4_rec(round(pval_fb4_laser_rec,2)-0.001>thre) = 0;
hun_fb4_rec = ones(size(pval_fb4_laser_rec));
hun_fb4_rec(pval_fb4_laser_rec>0.05) = 0;

figure
plot(linspace(1,64,64),threshold_level,'r-',linspace(1,64,64),sorted_p ,'g*')
 
load('Loc.mat');
figure('color','w')
subplot(3,3,1)
topoplot(mean_fb4_first,Loc)
set(gca,'Clim',[-0.2 0.2])
% title('average')
subplot(3,3,2)
topoplot_dc(hun_fb4_first,Loc)
set(gca,'Clim',[-1 1])
title('uncorrected')
subplot(3,3,3)
topoplot_dc(h_fb4_first,Loc)
set(gca,'Clim',[-1 1])
% title('FDR corrected')
 
subplot(3,3,4)
topoplot(mean_fb4_second,Loc)
set(gca,'Clim',[-0.2 0.2])
% title('average')
subplot(3,3,5)
topoplot_dc(hun_fb4_second,Loc)
set(gca,'Clim',[-1 1])
title('uncorrected')
subplot(3,3,6)
topoplot_dc(h_fb4_second,Loc)
set(gca,'Clim',[-1 1])
% title('FDR corrected')
 
subplot(3,3,7)
topoplot(mean_fb4_rec,Loc)
set(gca,'Clim',[-0.2 0.2])
% title('average')
subplot(3,3,8)
topoplot_dc(hun_fb4_rec,Loc)
set(gca,'Clim',[-1 1])
title('uncorrected')
subplot(3,3,9)
topoplot_dc(h_fb4_rec,Loc)
set(gca,'Clim',[-1 1])
% title('FDR corrected')
suptitle('tPBM vs Sham: beta whole')


% [h_fb5 p_fb5] = ttest(nor_fb5_tls_first',nor_fb5_pbo_first','alpha',0.05);
mean_fb5_first = mean(nor_fb5_tls_first')-mean(nor_fb5_pbo_first');
for i = 1:64
[pval_fb5_laser_first(i), t_orig_fb5_laser_first(i,:), crit_t_fb5_laser_first(i,:), est_alpha, seed_state]=mult_comp_perm_t1((nor_fb5_tls_first(i,:)'-nor_fb5_pbo_first(i,:)'),10000,1,0.05,0);
end
sorted_p = sort(pval_fb5_laser_first);
sorted_p = round(sorted_p,2);
threshold_level = round(linspace(1,64,64).*0.05/64,2);
P=InterX([threshold_level;threshold_level],[threshold_level;sorted_p]);
thre = max(max(P));
if isempty(thre) & max(max(sorted_p))>0.05
    thre = 0;
elseif isempty(thre) & max(max(sorted_p))<0.05
    thre = 1;
end
h_fb5_first = ones(size(pval_fb5_laser_first));
h_fb5_first(pval_fb5_laser_first>thre) = 0;
hun_fb5_first = ones(size(pval_fb5_laser_first));
hun_fb5_first(pval_fb5_laser_first>0.05) = 0;

figure
plot(linspace(1,64,64),threshold_level,'r-',linspace(1,64,64),sorted_p ,'g*')


 
% [h_fb5 p_fb5] = ttest(nor_fb5_tls_second',nor_fb5_pbo_second','alpha',0.05);
mean_fb5_second = mean(nor_fb5_tls_second')-mean(nor_fb5_pbo_second');
for i = 1:64
[pval_fb5_laser_second(i), t_orig_fb5_laser_second(i,:), crit_t_fb5_laser_second(i,:), est_alpha, seed_state]=mult_comp_perm_t1((nor_fb5_tls_second(i,:)'-nor_fb5_pbo_second(i,:)'),10000,1,0.05,0);
end
sorted_p = sort(pval_fb5_laser_second);
sorted_p = round(sorted_p,2);
threshold_level = round(linspace(1,64,64).*0.05/64,2);
P=InterX([threshold_level;threshold_level],[threshold_level;sorted_p]);
thre = max(max(P));
if isempty(thre) & max(max(sorted_p))>0.05
    thre = 0;
elseif isempty(thre) & max(max(sorted_p))<0.05
    thre = 1;
end
h_fb5_second = ones(size(pval_fb5_laser_second));
h_fb5_second(pval_fb5_laser_second>thre) = 0;
hun_fb5_second = ones(size(pval_fb5_laser_second));
hun_fb5_second(pval_fb5_laser_second>0.05) = 0;


figure
plot(linspace(1,64,64),threshold_level,'r-',linspace(1,64,64),sorted_p ,'g*')

% [h_fb5 p_fb5] = ttest(nor_fb5_tls_rec',nor_fb5_pbo_rec','alpha',0.05);
mean_fb5_rec = mean(nor_fb5_tls_rec')-mean(nor_fb5_pbo_rec');
for i = 1:64
[pval_fb5_laser_rec(i), t_orig_fb5_laser_rec(i,:), crit_t_fb5_laser_rec(i,:), est_alpha, seed_state]=mult_comp_perm_t1((nor_fb5_tls_rec(i,:)'-nor_fb5_pbo_rec(i,:)'),10000,1,0.05,0);
end
sorted_p = sort(pval_fb5_laser_rec);
sorted_p = round(sorted_p,2);
threshold_level = round(linspace(1,64,64).*0.05/64,2);
P=InterX([threshold_level;threshold_level],[threshold_level;sorted_p]);
thre = max(max(P));
if isempty(thre) & max(max(sorted_p))>0.05
    thre = 0;
elseif isempty(thre) & max(max(sorted_p))<0.05
    thre = 1;
end
h_fb5_rec = ones(size(pval_fb5_laser_rec));
h_fb5_rec(pval_fb5_laser_rec>thre) = 0;
hun_fb5_rec = ones(size(pval_fb5_laser_rec));
hun_fb5_rec(pval_fb5_laser_rec>0.05) = 0;

figure
plot(linspace(1,64,64),threshold_level,'r-',linspace(1,64,64),sorted_p ,'g*')

 
load('Loc.mat');
figure('color','w')
subplot(3,3,1)
topoplot(mean_fb5_first,Loc)
set(gca,'Clim',[-0.2 0.2])
% title('average')
subplot(3,3,2)
topoplot_dc(hun_fb5_first,Loc)
set(gca,'Clim',[-1 1])
title('uncorrected')
subplot(3,3,3)
topoplot_dc(h_fb5_first,Loc)
set(gca,'Clim',[-1 1])
% title('FDR corrected')
 
 
subplot(3,3,4)
topoplot(mean_fb5_second,Loc)
set(gca,'Clim',[-0.2 0.2])
% title('average')
subplot(3,3,5)
topoplot_dc(hun_fb5_second,Loc)
set(gca,'Clim',[-1 1])
title('uncorrected')
subplot(3,3,6)
topoplot_dc(h_fb5_second,Loc)
set(gca,'Clim',[-1 1])
% title('FDR corrected')
 
 
subplot(3,3,7)
topoplot(mean_fb5_rec,Loc)
set(gca,'Clim',[-0.2 0.2])
% title('average')
subplot(3,3,8)
topoplot_dc(hun_fb5_rec,Loc)
set(gca,'Clim',[-1 1])
title('uncorrected')
subplot(3,3,9)
topoplot_dc(h_fb5_rec,Loc)
set(gca,'Clim',[-1 1])
% title('FDR corrected')
suptitle('tPBM vs Sham: gamma')





%% baseline PSD


all_channel_pxx_tls_base = squeeze(mean(pxx_tls_base,1))';
all_channel_pxx_pbo_base = squeeze(mean(pxx_pbo_base,1))';
% all_channel_pxx_thermo_base = squeeze(mean(pxx_thermo_base,1))';
% all_channel_pxx_thermo_pbo_base = squeeze(mean(pxx_thermo_pbo_base,1))';

all_channel_pxx_tls_first = squeeze(mean(pxx_tls_first,1))';
all_channel_pxx_pbo_first = squeeze(mean(pxx_pbo_first,1))';
% all_channel_pxx_thermo_first = squeeze(mean(pxx_thermo_first,1))';
% all_channel_pxx_thermo_pbo_first = squeeze(mean(pxx_thermo_pbo_first,1))';

all_channel_pxx_tls_second = squeeze(mean(pxx_tls_second,1))';
all_channel_pxx_pbo_second = squeeze(mean(pxx_pbo_second,1))';
% all_channel_pxx_thermo_second = squeeze(mean(pxx_thermo_second,1))';
% all_channel_pxx_thermo_pbo_second = squeeze(mean(pxx_thermo_pbo_second,1))';

all_channel_pxx_tls_rec = squeeze(mean(pxx_tls_rec,1))';
all_channel_pxx_pbo_rec = squeeze(mean(pxx_pbo_rec,1))';
% all_channel_pxx_thermo_rec = squeeze(mean(pxx_thermo_rec,1))';
% all_channel_pxx_thermo_pbo_rec = squeeze(mean(pxx_thermo_pbo_rec,1))';

std_tls_base = std(all_channel_pxx_tls_base);
std_pbo_base = std(all_channel_pxx_pbo_base);
% std_thermo_base = std(all_channel_pxx_thermo_base);
% std_thermo_pbo_base = std(all_channel_pxx_thermo_pbo_base);

std_tls_second = std(all_channel_pxx_tls_second);
std_pbo_second = std(all_channel_pxx_pbo_second);
% std_thermo_second = std(all_channel_pxx_thermo_second);
% std_thermo_pbo_second = std(all_channel_pxx_thermo_pbo_second);


%%%%%%%%%%%%%%% Figure  consistent baseline
% all_channel_pxx_thermo_base(2,44:46) = mean(all_channel_pxx_thermo_base([1,3:end],44:46),1);
% all_channel_pxx_thermo_base(1,47) = mean(all_channel_pxx_thermo_base(2:end,47),1);

tls_base_spec = mean(squeeze(mean(pxx_tls_base(:,:,:),1)),2);
std_tls_base_spec = std(squeeze(mean(pxx_tls_base(:,:,:),1)),[],2);

pbo_base_spec = mean(squeeze(mean(pxx_pbo_base(:,:,:),1)),2);
std_pbo_base_spec = std(squeeze(mean(pxx_pbo_base(:,:,:),1)),[],2);

tls_spec_second = mean(squeeze(mean(pxx_tls_second(:,:,:),1)),2);
std_tls_spec_second = std(squeeze(mean(pxx_tls_second(:,:,:),1)),[],2);

pbo_spec_second = mean(squeeze(mean(pxx_pbo_second(:,:,:),1)),2);
std_pbo_spec_second = std(squeeze(mean(pxx_pbo_second(:,:,:),1)),[],2);

% thermo_base_spec = mean(squeeze(mean(pxx_thermo_base(:,:,:),1)),2);
% std_thermo_base_spec = std(squeeze(mean(pxx_thermo_base(:,:,:),1)),[],2);
% 
% thermo_pbo_base_spec = mean(squeeze(mean(pxx_thermo_pbo_base(:,:,:),1)),2);
% std_thermo_pbo_base_spec = std(squeeze(mean(pxx_thermo_pbo_base(:,:,:),1)),[],2);
% 
% thermo_spec_second = mean(squeeze(mean(pxx_thermo_second(:,:,:),1)),2);
% std_thermo_spec_second = std(squeeze(mean(pxx_thermo_second(:,:,:),1)),[],2);
% 
% thermo_pbo_spec_second = mean(squeeze(mean(pxx_thermo_pbo_second(:,:,:),1)),2);
% std_thermo_pbo_spec_second = std(squeeze(mean(pxx_thermo_pbo_second(:,:,:),1)),[],2);


figure('color','w')
errorbar(f1,tls_base_spec,std_tls_base_spec/sqrt(46),'ro-','markersize',4,'linewidth',2)
set(gca,'xscale','log','yscale','log','fontsize',35,'fontweight','bold','Xcolor','k','Ycolor','k','linewidth',2)
% set(gca,'fontsize',30,'fontweight','bold')
xlim([1 70])
ylim([1e-2 1e1])
hold on
errorbar(f1,pbo_base_spec,std_pbo_base_spec/sqrt(46),'ko-','markersize',4,'linewidth',2)
% errorbar(f1,tls_spec_second,std_tls_spec_second/sqrt(46),'ro--','markersize',4,'linewidth',2)
% errorbar(f1,pbo_spec_second,std_pbo_spec_second/sqrt(46),'bo--','markersize',4,'linewidth',2)
yticks([0.01 0.1 1 10])
xticks([1 5 10 30 50 70])
xlabel('Frequency (Hz)')
ylabel('PSD (\muV^2/Hz)')


% figure('color','w')
% errorbar(f1,thermo_base_spec,std_thermo_base_spec/sqrt(11),'bo-','markersize',4,'linewidth',2)
% set(gca,'xscale','log','yscale','log','fontsize',35,'fontweight','bold','Xcolor','k','Ycolor','k','linewidth',2)
% % set(gca,'fontsize',30,'fontweight','bold')
% xlim([1 70])
% ylim([1e-2 1e1])
% yticks([0.01 0.1 1 10])
% hold on
% errorbar(f1,thermo_pbo_base_spec,std_thermo_pbo_base_spec/sqrt(11),'ko-','markersize',4,'linewidth',2)
% % errorbar(f1,thermo_spec_second,std_thermo_spec_second/sqrt(11),'go--','markersize',4,'linewidth',2)
% % errorbar(f1,thermo_pbo_spec_second,std_thermo_pbo_spec_second/sqrt(11),'ko--','markersize',4,'linewidth',2)

% xticks([1 5 10 30 50 70])
% xlabel('Frequency (Hz)')
% ylabel('PSD (\muV^2/Hz)')



% errorbar(f1,tls_base_spec,std_tls_base_spec/sqrt(46),'ro-','markersize',4,'linewidth',2)

% 

figure('color','w')
errorbar(f1,tls_spec_second,std_tls_spec_second/sqrt(46),'ro--','markersize',4,'linewidth',2)
hold on
% errorbar(f1,pbo_base_spec,std_pbo_base_spec/sqrt(46),'ko-','markersize',4,'linewidth',2)
set(gca,'xscale','log','yscale','log','fontsize',35,'fontweight','bold','Xcolor','k','Ycolor','k','linewidth',2)
errorbar(f1,pbo_spec_second,std_pbo_spec_second/sqrt(46),'ko--','markersize',4,'linewidth',2)
yticks([0.01 0.1 1 10])
xticks([1 5 10 30 50 70])
set(gca,'fontsize',30,'fontweight','bold')
xlim([1 70])
ylim([1e-2 1e1])
xlabel('Frequency (Hz)')
ylabel('PSD (\muV^2/Hz)')

%%%%%%%%%% Figure barplots (fianlly decided to use Excel)

%%%%%%%%%% non-dB Figure barplots (fianlly decided to use Excel)
 
 
 
 
box_nodB_nor_pxx_pbo_fb1_second = squeeze(mean(nodB_nor_pxx_pbo_second(:,5:17,:),2));
box_nodB_nor_pxx_pbo_fb2_second = squeeze(mean(nodB_nor_pxx_pbo_second(:,18:29,:),2));
box_nodB_nor_pxx_pbo_fb3_second = squeeze(mean(nodB_nor_pxx_pbo_second(:,37:53,:),2));
box_nodB_nor_pxx_pbo_fb4_second = squeeze(mean(nodB_nor_pxx_pbo_second(:,49:121,:),2));
box_nodB_nor_pxx_pbo_fb5_second = squeeze(mean(nodB_nor_pxx_pbo_second(:,122:281,:),2));
 
box_nodB_nor_pxx_tls_fb1_second = squeeze(mean(nodB_nor_pxx_tls_second(:,5:17,:),2));
box_nodB_nor_pxx_tls_fb2_second = squeeze(mean(nodB_nor_pxx_tls_second(:,18:29,:),2));
box_nodB_nor_pxx_tls_fb3_second = squeeze(mean(nodB_nor_pxx_tls_second(:,37:53,:),2));
box_nodB_nor_pxx_tls_fb4_second = squeeze(mean(nodB_nor_pxx_tls_second(:,49:121,:),2));
box_nodB_nor_pxx_tls_fb5_second = squeeze(mean(nodB_nor_pxx_tls_second(:,122:281,:),2));
 
nodB_go_to_excel_pbo(1,:) = box_nodB_nor_pxx_pbo_fb1_second(34,:);
nodB_go_to_excel_pbo(2,:) = box_nodB_nor_pxx_pbo_fb2_second(34,:);
nodB_go_to_excel_pbo(3,:) = box_nodB_nor_pxx_pbo_fb3_second(34,:);
nodB_go_to_excel_pbo(4,:) = box_nodB_nor_pxx_pbo_fb4_second(34,:);
nodB_go_to_excel_pbo(5,:) = box_nodB_nor_pxx_pbo_fb5_second(34,:);
 
 
nodB_go_to_excel_tls(1,:) = box_nodB_nor_pxx_tls_fb1_second(34,:);
nodB_go_to_excel_tls(2,:) = box_nodB_nor_pxx_tls_fb2_second(34,:);
nodB_go_to_excel_tls(3,:) = box_nodB_nor_pxx_tls_fb3_second(34,:);
nodB_go_to_excel_tls(4,:) = box_nodB_nor_pxx_tls_fb4_second(34,:);
nodB_go_to_excel_tls(5,:) = box_nodB_nor_pxx_tls_fb5_second(34,:);
 
 

