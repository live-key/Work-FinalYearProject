clear
clc
close all

addpath TrialData/Store

subs = {dir(fullfile('TrialData/Store/','*.mat')).name};

totalZeroArray = [];
totalFourtyArray = [];

for i = 1:length(subs)
    load(subs{i})
    
    explodedZero = explodeData(matrix{1});
    explodedFourty = explodeData(matrix{2});

    totalZeroArray = [totalZeroArray; explodedZero];
    totalFourtyArray = [totalFourtyArray; explodedFourty];
end

x = 0;
function [explodedArray] = explodeData(originalArray)
    explodedArray = zeros(16, 7);

    rowIncrement = 1;
    for i = 1:size(originalArray, 1)
        for j = 1:size(originalArray, 2)
            datapoint = originalArray(i,j);

            if (datapoint == 1)
                exploded = [1;0;0;0];
            elseif (datapoint == 2)
                exploded = [1;1;0;0];
            elseif (datapoint == 3)
                exploded = [1;1;1;0];
            elseif (datapoint == 4)
                exploded = [1;1;1;1];
            elseif (datapoint == 0)
                exploded = [0;0;0;0];
            end
            
            explodedArray(rowIncrement:rowIncrement+3, j) = exploded;
        end
        rowIncrement = rowIncrement + 4;
    end
end

