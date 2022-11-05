function [traj3Drot] = rotateAxis(traj3D, theta, vp)
    %% Weibull Fitting Function (For Bootstrapping) %% 
    % Input: traj3D         -> 3D trajectory data
    %        theta          -> Viewpoint angle
    %        vp             -> Rotational direction
    %
    % Output: traj3drot     -> updated trajectory data for visualisation
    % Authors: Alan Chen, Joe Byrne
    % Date: 07/05/2022

    if (vp == "overhead")
        A = [1 0 0; 0 cosd(theta) -sind(theta); 0 sind(theta) cosd(theta)];
        traj3Drot = A*traj3D; 
    elseif (vp == "profile")
        A = [cosd(theta) sind(theta) 0; -sind(theta) cosd(theta) 0; 0 0 1];
        traj3Drot = A*traj3D;
    end 
end