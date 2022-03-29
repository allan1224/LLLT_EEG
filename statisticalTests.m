%% Statistical Tests 

% Not enough subjects and too much variability

% Assuming pilot experiemnt is correct and that increeases alpha power
% Avg percent diff > 0 is about 18% increase
% There's variability in subjects that throws off the P-values
% Power of analysis:
% When there is a 18% increase -> include enough subjects that makes
% p-value less that 0.05. How many subjects per each group?
% Variability doesn't change but the p-value will change with a larger N

% If you replicateed the ratio values 3 times then the p value is
% significant to 0.03

% Did not change the distribution nor the delta but the significance
% changed



%%
diff_alpha_second = (r_alpha_tls_second,2)-(r_alpha_pbo_second,2);
diff_alpha_rec = (r_alpha_tls_rec,2)-mean(r_alpha_pbo_rec,2);

diff_beta_second = mean(r_beta_tls_second,2)-mean(r_beta_pbo_second,2);
diff_beta_rec = mean(r_beta_tls_rec,2)-mean(r_beta_pbo_rec,2);

meanDiff_delta_second = mean(r_delta_tls_second,2)-mean(r_delta_pbo_second,2);
meanDiff_delta_rec = mean(r_delta_tls_rec,2)-mean(r_delta_pbo_rec,2);

for chan = 1:numChannels
[pval_alpha_tls_second(chan), t_orig_fb1_laser_second(i,:), crit_t_fb1_laser_second(i,:), est_alpha, seed_state]=mult_comp_perm_t1((nor_fb1_tls_second(i,:)'-nor_fb1_pbo_second(i,:)'),10000,-1,0.05,0);
end
sorted_p = sort(pval_fb1_laser_second);
sorted_p = round(sorted_p,2);




