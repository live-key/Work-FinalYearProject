function crit = psychFitWeibull(DATA)
    %% Weibull Fitting Function (For Bootstrapping) %% 
    % Input: DATA   -> subject success data for a given eccentricity
    %
    % Output: crit  -> updated subject performance matrix
    % Authors: Alan Chen, Joe Byrne
    % Date: 09/10/2022

    % Set up noise arrays
    NOISE = [2 4 8 12 16 20 24];
    NOISE_ = linspace(0,max(NOISE),1000);
    
    % Inline functions for function and fit ease
    fnBound = @(bhat) 1/(eps+double((bhat(1) > 0) & (bhat(2) > 0)));
    fnPsychometric = @(lam,k,x) 0.25 + 0.75*(1 - exp(-power(max(0,x)/lam,k)));
    fnCost = @(bhat) sum(power(fnPsychometric(bhat(1),bhat(2),NOISE) - mean(DATA,1),2)) * fnBound(bhat);
    
    % Minimising squared error
    best_fval = 1/eps;
    for iistart = 1:100
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
    
    % Fit curve
    PM_ = fnPsychometric(bhat(1),bhat(2),NOISE_);
    
    % Determine threshold, that is, where the fitted function = 0.625
    crit = NOISE_(min(find(PM_ > 0.625)));
end