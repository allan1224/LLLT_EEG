%% Prepare machine learning model

% AF4, AF8, F2, F4, F6, F8, FC2, FC4, FC6
% 36, 35, 39, 40, 41, 42, 46, 45, 44

area = [36,35,39,40,41,42,46,45,44];
% labels{area(chan)};

% channel36: mav, var, SNR_mav, SNR_var, powerRatio

% Should the entire MAV and VAR vector be the inputs or should each index
% of MAV and VAR be individual inputs?
% Basically should each MAV and VAR index serve as a sample to the model or
% should the model be fed the entire MAV and VAR vector as one sample?

Tnew = table(sensor34MAV,sensor34Var,sensor2MAV,sensor2WV,sensor3MAV,sensor3WV,sensor4MAV,sensor4WV,class);