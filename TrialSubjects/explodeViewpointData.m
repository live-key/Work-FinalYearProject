clear
clc
close all

addpath TrialData/Store

subs = {dir(fullfile('TrialData/Store/','*.mat')).name};
noSubs = length(subs);

% We want to collate all 0 degree viewpoint data and all other degrees
% viewpoint data for both peripheral angles
totalV0P0Array = [];
totalV30P0Array = [];
totalV60P0Array = [];
totalV90P0Array = [];

totalV0P40Array = [];
totalV30P40Array = [];
totalV60P40Array = [];
totalV90P40Array = [];

for i = 1:noSubs
    load(subs{i})
    p0 = matrix{1};
    p40 = matrix{2};
    
    totalV0P0Array = [totalV0P0Array; explodeRow(p0(1,:))];
    totalV30P0Array = [totalV30P0Array; explodeRow(p0(2,:))];
    totalV60P0Array = [totalV60P0Array; explodeRow(p0(3,:))];
    totalV90P0Array = [totalV90P0Array; explodeRow(p0(4,:))];

    totalV0P40Array = [totalV0P40Array; explodeRow(p40(1,:))];
    totalV30P40Array = [totalV30P40Array; explodeRow(p40(2,:))];
    totalV60P40Array = [totalV60P40Array; explodeRow(p40(3,:))];
    totalV90P40Array = [totalV90P40Array; explodeRow(p40(4,:))];
end


function [explodedRow] = explodeRow(originalRow)
    explodedRow = zeros(4, 7);

    for i = 1:size(originalRow, 1)
        for j = 1:size(originalRow, 2)
            datapoint = originalRow(i,j);

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
            
            explodedRow(1:4, j) = exploded;
        end
    end
end