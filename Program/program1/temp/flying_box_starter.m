%% flying_box_starter.m
% 
% This Matlab script provides the starter code for the flying box
% problem on Homework 1 in MEAM 520 at the University of Pennsylvania.
% The original was written by Professor Katherine J. Kuchenbecker in
% September of 2012. Students will modify this code to create their own
% script. Email kuchenbe@seas.upenn.edu with questions.
% 
% Student Name:
%
% Change the name of this file to replace "starter" with your PennKey.  For
% example, Professor Kuchenbecker's script would be visualize_kuchenbe.m

%% SETUP

% Delete all variables from our workspace.
clear

% Load the TrakStar data recorded during the movie.
% This MATLAB data file includes time histories of the x, y, and z
% coordinates in inches, as well as time histories of the azimuth,
% elevation, and roll angles in degrees.
load flying_box;

% Open figure 1 and clear it to get ready for plotting.
figure(1)
clf

%% DEFINITIONS

% We need to keep track of three frames in this code.
%
% Frame 0 is the frame of the camera's view, with x positive to the right,
% y positive straight back, and z positive up.  The is the base frame, and
% it's what we plot in.  Its origin coincides with the origin of frame 1.
%
% Frame 1 is the frame of the TrakStar transmitter, which sits on the desk.
% It has x positive straight out, y positive to the left, and z positive
% down.  This is the frame in which the sensor positions and orientations
% are expressed.  Its origin is near the center of the transmitter s beige
% cube, which can be seen in the video.
%
% Frame 2 is the frame of the TrakStar sensor, which is being moved around.
% Its x-axis is straight out horizontal through the front of the box, in
% the direction the hand is facing.  Its y-axis is mostly horizontal during
% the video, and its z-axis is mostly vertical.

% Define the locations of the box's four corners (ignoring thickness) in
% the sensor's frame (frame 2).  The length is in the direction of the
% sensor's x-axis, and the width is in the direction of the sensors
% y-axis.  We call the corners points a, b, c, and d (pa, pb, pc, and pd),
% and we assume the sensor is at the center of the box.  We include a 1 at
% the end of each of these column vectors for use with homogenous 
% transformations. You may remove the 1 s if you find you do not need them,
% but please update this comment accordingly.
box_length = 8;  % inches
box_width = 6;   % inches
pa2 = [-box_length/2 -box_width/2 0 1]';
pb2 = [ box_length/2 -box_width/2 0 1]';
pc2 = [ box_length/2  box_width/2 0 1]';
pd2 = [-box_length/2  box_width/2 0 1]';

% The number of data points to skip between plots.  Increase this to speed
% up playback.  The minimum value is 1. 
skipfactor = 2; 


%% ANIMATION
% Play back the recorded motion of the flying box.

% Step through the data from start to finish, jumping by skipfactor.
for i = 1:skipfactor:length(x_inches_history)
    % Pull the sensor's current x, y, and z positions out of the histories.
    x = x_inches_history(i);
    y = y_inches_history(i);
    z = z_inches_history(i);
    
    % Pull the sensor's current azimuth, elevation, and roll angles out of
    % the history.  Remember these values are in degrees.  If you want to
    % convert them to other units, here would be a good place to do so.
    a = azimuth_degrees_history(i);
    e = elevation_degrees_history(i);
    r = roll_degrees_history(i);

    % Do your calculations. If you do things in a straightforward way, all
    % of your code should be between the two lines of stars.
    % *******************************************************************
    
    % Put your calculations here!
    
    % You may not use any built-in or downloaded functions dealing with
    % rotation matrices, homogeneous transformations, Euler angles,
    % roll/pitch/yaw angles, or related topics.  Instead, you must type all
    % your calculations yourself, usin only low-level functions such as
    % sind, cosd, and vector/matrix math. 
    
    % Calculate the position of each corner in the camera's frame. For now,
    % we just set the locations to be the positions in frame 2, with one
    % augmentation.  You will need to change this.
    pa0 = pa2;
    pb0 = pb2;
    pc0 = pc2 + [0 0 i/30 0]'; % Make this corner grow over time so you can see the code is running.
    pd0 = pd2;
    
    % If your code runs but you can't see anything in your plot, comment
    % out or modify the axis([...]) command in the plot section below.
    
    % All your calculations should be done by here.  Your answers for the
    % coordinates of the box's corners in frame 0 should be in the
    % variables pa0, pb0, pc0, and pd0. 
    % *******************************************************************

    % Put all four corner points together to make it easier to get the x,
    % y, and z coordinates for plotting.  These are all in the camera's
    % frame (frame 0).
    points0 = [pa0 pb0 pc0 pd0];
    
    % Check for the first time through to format the plot.
    if (i == 1)
        
        % Plot the points as a gray filled region.
        h = fill3(points0(1,:),points0(2,:),points0(3,:),[.2 .2 .2]);
        
        % Enforce that one unit is displayed equivalently in x, y, and z.
        axis equal;
        
        % Set the viewing volume to the values known to be correct.  If
        % you cannot see anything in your plot, you should increase the
        % ranges here or comment this out.  The order is xmin xmax ymin
        % ymax zmin zmax.
        axis([-25 0 -15 15 -5 25])
        
        % Set the viewing angle to be similar to the camera view.
        view(-35,20)
        
        % Label the axes, including abbreviated units of measure in parentheses.
        xlabel('x0 (in.)')
        ylabel('y0 (in.)')
        zlabel('z0 (in.)')
        
        % Turn on the grid to make it easy to see the walls.
        grid on
        
        title('Flying Box by PUT YOUR NAME HERE')
        
    else
        
        % Set the locations of the corners to the current points.  Using
        % set and the plot handle in this way is faster than replotting
        % everything.
        set(h,'xdata',points0(1,:),'ydata',points0(2,:),'zdata',points0(3,:))
        
    end
    
    % Pause for a short time to allow the viewer to see the animation play.
    pause(0.0001)
    
end
