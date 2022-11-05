%% Data Extraction Script %% 
% Data from subject's gait
% Processing this data will involve psychtoolbox3
%
% Authors: Alan Chen, Joe Byrne
% Date: 06/05/2022


%% Extracting and Evaluating Data %% 

% Instantiate Vicon structure and MATLAB link
data = ViconNexus();

% Extract relevant data from object
subject = data.GetSubjectNames();
markers = data.GetMarkerNames(subject{1});

% Retrive Trajectories
for i = 1:length(markers)
    filename = [markers{i} '.mat'];
    [array(1,:), array(2,:), array(3,:), array(4,:)] = vicon.GetTrajectory(subject{1}, markers{i});
    save(filename, 'array')
end