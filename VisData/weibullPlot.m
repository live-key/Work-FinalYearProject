%% Weibull Plotting Script %% 
% Data from subjects' responses
% Raw data plotting %
% Authors: Alan Chen, Joe Byrne
% Date: 02/09/2022

clear
close all

% Setup noise arrays
NOISE = [2 4 8 12 16 20 24];
NOISE_ = linspace(0,max(NOISE),1000);

% Load relevant data 
load("ViewpointArrays.mat")
DATA = totalV90P40Array;

% Inline functions for ease of function and fit
fnBound = @(bhat) 1/(eps+double((bhat(1) > 0) & (bhat(2) > 0)));
fnPsychometric = @(lam,k,x) 0.25 + 0.75*(1 - exp(-power(max(0,x)/lam,k)));
fnCost = @(bhat) sum(power(fnPsychometric(bhat(1),bhat(2),NOISE) - mean(DATA,1),2)) * fnBound(bhat);

% Minimise squared error
best_fval = 1/eps;
for iistart = 1:1000
  BHAT0 = [3 1];
  if (iistart > 1)
    BHAT0 = [2+4*rand() 3*rand()];
  end
  [bhat,fval] = fminsearch(fnCost, BHAT0);
  if (fval < best_fval)
    best_fval = fval;
    best_bhat = bhat;
  end
end

% Fit and plot curve
PM_ = fnPsychometric(bhat(1),bhat(2),NOISE_);
figure; hold on
plot(NOISE, mean(DATA,1), 'ok', 'MarkerFaceColor', 'k', 'MarkerSize',10); axis square
for ii = 1:length(NOISE)
  [~,pci] = binofit(sum(DATA(:,ii)), size(DATA,1));
  plot([NOISE(ii) NOISE(ii)], pci, '-k', 'LineWidth', 2)
end

% Plot settings
plot(NOISE_, PM_, '-b', 'LineWidth', 3)
title("E: 40^o, V: 90^o", 'FontSize',28)
plot([min(NOISE) max(NOISE)], [0.25 0.25], '--k', 'LineWidth', 2)
axis square
axis([0 max(NOISE)+1 0 1])
xlabel('Number of Visible Nodes ')
ylabel('Performance (proportion correct responses)')

% Determine threshold, that is, where the fitted function = 0.625
plot(NOISE_(min(find(PM_ > 0.625))), 0.625, 'sb', 'MarkerFaceColor', 'green', 'MarkerEdgeColor', 'green', 'MarkerSize',10);