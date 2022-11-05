%% Raw Plotting Script %% 
% Data from subjects' responses
% Raw data plotting %
% Authors: Alan Chen, Joe Byrne
% Date: 02/09/2022

clear
clc
close all

% Initialise independent vars
degradation = [2, 4, 8, 12, 16, 20, 24];
theta_v = [90, 120, 150, 180];
ecc = [0, 40];

% Get subjects
subs = {dir(fullfile('../TrialData/Store/','*.mat')).name};
noSubs = length(subs);

% Set up global vars
res = cell(1, length(ecc)); % Eccentricity results
store = zeros([length(theta_v), length(degradation)]); % Subj. results
totalTrials = 0;

for i = 1:length(res)
    res{i} = store;
end

% Plot settings
title_ = matlab.graphics.layout.Text;
title_.FontWeight = 'bold';

% Relevant paths
addpath TrialData/Store
addpath Data4Analysis

for i = 1:noSubs
    load(subs{i})
    for j = 1:length(res)
        res{j} = res{j} + matrix{j};
    
        if j == 1            
            totalTrials = totalTrials + num_trials;
        end
    end 
end

% Averaging the results
for i = 1:length(res)
    res{i} = res{i} / totalTrials;
end

% Plot settings
title_.String = "Randomized Blocking Trials";
labels = [];
figure('Position', [100 60 1700 900]);
tiledlayout(2,2,"Title",title_);

<<<<<<< HEAD:procPlot.m
figure('Position', [100 60 1700 900]);
tiledlayout(2,2,"Title",title_);

for j = 1:length(res)
    nexttile
    for k = 1:length(theta_v)
        
        title(sprintf("%d^o Peripheral Eccentricity ", (j-1)*ecc(2)), 'FontSize', 14);
        plot(degradation, res{j}(k, :), '-o');
=======
%% Viewpoint Plots %% 
% For each res cell
for j = 1:length(res)
    nexttile
    % For each viewpoint angle
    for k = 1:length(theta_v)
        
        % Plot subject data
        plot(degradation, res{j}(k, :), 'LineWidth', 2); axis square;
>>>>>>> main:VisData/rawPlot.m
        ylim([-0.1 1.1]);
        xlim([0 25]);
        title(sprintf("%d^o Peripheral Eccentricity ", (j-1)*ecc(2)), 'FontSize', 28);
        if j == 1
            labels = [labels, (sprintf(" {\\theta}_v  =  %.2f deg", theta_v(k) - 90))];
        end
        if k == length(theta_v)
            yline(0.25, 'LineStyle','--', 'LineWidth', 1.5);
        end
        if j == 1 && k == length(theta_v)
            labels = [labels, (" Guess rate: 25.00%")];
        end
        xlabel("Number of Nodes, {\eta}_d");
        ylabel("Success Rate, {\rho}");
        hold on
    end
    legend(labels)
<<<<<<< HEAD:procPlot.m
%     hold off
%     close;
=======
    hold off
>>>>>>> main:VisData/rawPlot.m
end

%% Mean Peripheral Plot %%
% Plot settings update
labels = [];
nexttile([1 2]);
ylim([-0.1 1.1]);
xlim([0 25]);

% For each res cell
for i = 1:length(res)
    
    % Plot overall average subject performance
    avg = mean(res{i},1);
<<<<<<< HEAD:procPlot.m
    plot(degradation, avg, "-o");
    labels = [labels, sprintf(" %d^o Peripheral Eccentricity Mean, {\\mu}_e, where Standard Deviation, {\\sigma} = %.2f", (i-1)*ecc(2), std(avg))];

=======
    plot(degradation, avg); axis square;
    labels = [labels, sprintf(" %d^o Peripheral Eccentricity Mean, {\\mu}_e," + ...
        " where Standard Deviation, {\\sigma} = %.2f", (i-1)*ecc(2), std(avg))];
>>>>>>> main:VisData/rawPlot.m
    hold on
end

% Plot settings
ylim([-0.1 1.1]);
xlim([0 25]);
xlabel("Number of Nodes, {\eta}_d");
ylabel("Success Rate, {\rho}");
title("Mean performance across all viewpoint angles", 'FontSize', 12);
yline(0.25, 'LineStyle','--');
hold off
legend(labels)
