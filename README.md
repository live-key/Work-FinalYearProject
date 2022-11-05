# P4P - The Perception of Biological Motion (2022)
Part IV Project - Joseph Byrne, Alan Chen

https://github.com/jbyr279/P4P 

## Overview of the Work Done 

### Data Capture

All point light walker data was captured at the University of Auckland's motion capture lab on level 8 (Department of Mechanical Engineering). The following configuration was used for node placement on the point light walker (28 nodes):

![alt text](/Images/suit.png)

(Note: future researchers may opt for different configurations based on their requirements)

A treadmill was then placed near the centre of the motion capture space. The subject walked at moderate speed (1.5 m/s) at level 4 setting for 60 seconds and his gait was captured by the Vicon Nexus system installed in the lab. Please ask, Emanuele Romano (or other technician) for induction into the motion capture lab and additional assistance with the motion capture technology used for this project.

<p float="left">
  <img src="/Images/mocaplab.jpg" width="400" />
  <img src="/Images/vicondisplays.jpg" width="400" /> 
</p>

The trajectory data for all captured nodes are then stored within the Vicon Nexus software. This can be exported to several different softwares (MATLAB, Python, etc.). For the purposes of our project, we used [MATLAB](https://au.mathworks.com/products/connections/product_detail/vicon-nexus.html).

### Data Processing in MATLAB 

All software used for data processing in this repository is fully commented. These scripts provide all the functionality for extracting data to data analysis of the trial experiments. The repository has been organised in the following structure:

![alt text](/Images/structure.png)

### Experiment Procedure 

Experiments were conducted in the brain computer interface (BCI) lab, also on level 8 at the University of Auckland. The environment was set up as follows:

![alt text](/Images/bcidisplays.jpg)

Subjects were shown the testing apparatus and station before trialing began.  We gave subjects a number of practice trials to avoid any learning factor in our data (i.e. considerable failures early in the trials which could skew data).  Our experimental blocks were each a set of 56 trials comprising randomly generated point-light walkers with random viewpoint angle, degradation and peripheral eccentricity.  These walkers were generated using the scripts found in the `SubjectTrials` directory.  The subject was directed to each eccentricity with markers placed on the displays and inter-trial directions (between trials, the subject is directed to either the 0 or 40 degree marker).  After the block of trials was completed, we then stored the subject’s response in the `TrialData` directory for further analysis.



