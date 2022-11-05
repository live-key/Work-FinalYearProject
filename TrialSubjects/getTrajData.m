function trajData = getTrajData(visibleMarkers, viewpointAngle, directory, scale)
    %% Results Storing Helper Function %% 
    % Input:    visibleMarkers  -> number of required visible markers
    %           viewpointAngle  -> required viewpoint angle
    %           directory       -> directory from which to find traj data
    %           scale           -> scale of walker (don't change unless certain)
    %
    % Output:   trajData        -> resulting traj data for rendered walker
    % Authors: Alan Chen, Joe Byrne
    % Date: 07/05/2022

    % Get data
    trajFiles = dir(directory);
    
    % Remover nodes at random
    remove = 28 - visibleMarkers;
    randIndex = randperm(length(trajFiles), remove);
    
    % Process all trajectories
    index = 1;
    for i=1:length(trajFiles)
        
        if ~(ismember(i, randIndex))
            % Get initial data and store it
            trajData{1,index} = trajFiles(i).name;
            trajData{2,index} = load(['TrajectoryData/', trajFiles(i).name]);
    
            data = trajData{2,index}.array;
            data(4,:) = [];

            % Rotate axis to desired viewpoint
            transData = rotateAxis(data, viewpointAngle, "profile");

            % Store and output new traj data
            trajData{2,index}.array = transData;
            trajData{2,index}.array(1, :) = trajData{2,index}.array(1, :) + scale*(-4.5*viewpointAngle + 805);
    
            index = index + 1;
        end
    end
end