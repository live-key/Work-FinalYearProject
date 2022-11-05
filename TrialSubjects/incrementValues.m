function value = incrementValues(value, time)
%% Incrementor helper function %%
    value = value + 1;
        if (time >= 3)
            value = 1;
        end
end