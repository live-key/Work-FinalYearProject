function trial_rand = populateCorrect(trial_rand, trial, inputKey)
    %% Results Storing Helper Function %% 
    % Input: trial_rand -> overall subject performance matrix
    %        trial      -> individual response
    %        inputKey   -> subject response for this particular trial
    %
    % Output: trial_rand -> updated subject performance matrix
    % Authors: Alan Chen, Joe Byrne
    % Date: 07/05/2022

    % Check if subject input correct and update response matrix
    if (trial_rand{trial}.theta_v == 90)
        trial_rand{trial}.correct = (strcmp(inputKey, '1!'));
    elseif  (trial_rand{trial}.theta_v == 120)
        trial_rand{trial}.correct = (strcmp(inputKey, '2@'));
    elseif (trial_rand{trial}.theta_v == 150)
        trial_rand{trial}.correct = (strcmp(inputKey, '3#'));
    elseif (trial_rand{trial}.theta_v == 180)
        trial_rand{trial}.correct = (strcmp(inputKey, '4$'));
    end