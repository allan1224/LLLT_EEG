%% Statistical Tests 
addpath '/Users/allan/Documents/MATLAB/LLLT_EEG/PERMUTOOLS'

[tval_alpha_second,tstats_alpha_second] = permtest_t2(alphaPow_tls_second',alphaPow_pbo_second');
[fval_alpha_second,fstats_alpha_second] = permtest_f2(alphaPow_tls_second',alphaPow_pbo_second');
[tval_alpha_rec,tstats_alpha_rec] = permtest_t2(alphaPow_tls_rec',alphaPow_pbo_rec');
[fval_alpha_rec,fstats_alpha_rec] = permtest_f2(alphaPow_tls_rec',alphaPow_pbo_rec');

[tval_beta_second,tstats_beta_second] = permtest_t2(betaPow_tls_second',betaPow_pbo_second');
[fval_beta_second,fstats_beta_second] = permtest_f2(betaPow_tls_second',betaPow_pbo_second');
[tval_beta_rec,tstats_beta_rec] = permtest_t2(betaPow_tls_rec',betaPow_pbo_rec');
[fval_beta_rec,fstats_beta_rec] = permtest_f2(betaPow_tls_rec',betaPow_pbo_rec');

[tval_delta_second,tstats_delta_second] = permtest_t2(deltaPow_tls_second',deltaPow_pbo_second');
[fval_delta_second,fstats_delta_second] = permtest_f2(deltaPow_tls_second',deltaPow_pbo_second');
[tval_delta_rec,tstats_delta_rec] = permtest_t2(deltaPow_tls_rec',deltaPow_pbo_rec');
[fval_delta_rec,fstats_delta_rec] = permtest_f2(deltaPow_tls_rec',deltaPow_pbo_rec');
