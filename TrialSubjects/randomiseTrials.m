function trial_rand_1D = randomiseTrials(theta_v, degradation, eccentricity)
    current_trials = cell(size(degradation,2), size(theta_v,2));

    for i = 1:length(degradation)
        for j = 1:length(theta_v)
            for k = 1:length(eccentricity)
                current_trials{i, j, k}.degradation = degradation(i);
                current_trials{i, j, k}.theta_v = theta_v(j);
                current_trials{i, j, k}.correct = false;
                current_trials{i, j, k}.inputKey = "";
                current_trials{i, j, k}.eccentricity = eccentricity(k);
            end
        end
    end
    
    len = length(degradation) * length(theta_v) * length(eccentricity);
    current_trials = reshape(current_trials,[1,len]);
    
    trial_rand_1D = current_trials(randperm(length(current_trials)));
end