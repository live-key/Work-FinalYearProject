function standardCell = dataParser(randomisedTrials, theta_v, degradation, eccentricity)
    %% Parsing Function %% 
    % Produces structure result matrix containing trials results
    % Input: randomisedTrials -> randomly structure results to be organised
    %        furhter inputs   -> sets of independent vars
    %
    % Output: standardCell    -> standardised cell of previously random
    %                            results
    % Authors: Alan Chen, Joe Byrne
    % Date: 08/05/2022

    % Convert to 4x4 standard
    standardArray = zeros([length(theta_v), length(degradation)]);
    standardCell = cell(1, length(eccentricity));
    
    for i = 1:length(standardCell)
        standardCell{i} = standardArray;
    end
    
    % Populate result matrix with subject response
    for i = 1:length(randomisedTrials)
        dot_index = mapDegradation(randomisedTrials{i}.degradation);
        theta_index = randomisedTrials{i}.theta_v/30 - 2;
        eccent_index = randomisedTrials{i}.eccentricity/eccentricity(2) + 1;
        standardCell{eccent_index}(theta_index, dot_index) = standardCell{eccent_index}(theta_index, dot_index) + randomisedTrials{i}.correct;
    end
end

% Index-mapping helper function
function index = mapDegradation(dots)
    if dots == 2
        index=1;
    else
        index = dots/4 + 1;
    end
end

    
    