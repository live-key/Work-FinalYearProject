%% Bootstrapping Script %% 
% Data from subjects' responses
% Bootstrapping resamples the data over a given interval
% Psychometric curve is fitted to test the data's reliablity over a large
% interval
%
% Authors: Alan Chen, Joe Byrne
% Date: 22/09/2022

clear
close all

% Load data
% example_data = [ 0 1 0 1 1 1 0
%                  1 0 0 1 1 0 1
%                  . . . . . . .
%                  1 1 1 0 0 1 0 ]
% Columns are degradation levels, contents are success/failure for each
% subject trial
load("ViewpointArrays.mat")
DATA = totalV90P0Array; 

% For both peripheral eccentricities
for dat = 1:2
    % For all bootstrap iterations
    for NBOOT = 1:100
        % For all columns in data
        for deg = 1:size(DATA,2)
            % Resample with replacement
            data = DATA(:, deg);
            ix = ceil(length(data) * rand(length(data),1));
            data_{dat}(:, deg) = data(ix);
        end
        % Fit weibull and store critical threshold
        CT = psychFitWeibull(data_{dat});
        if size(CT,2) < 1
            CT = 28;
        end
        crit(NBOOT, dat) = CT;
    end
    % Change to new dataset
    DATA = totalV90P40Array;
end

% Store means
means = [mean(crit(:,1)), mean(crit(:,2))];

% Plot histograms of resulting CTs
figure; hist(crit(:,1)); axis square
figure; hist(crit(:,2)); axis square























