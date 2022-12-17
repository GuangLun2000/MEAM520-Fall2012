function A = dh_starter(a, alpha, d, theta)

% This function calculates the four-by-four transformation matrix A for a
% given set of DH parameters: a, alpha, d, and theta.  The angles are in
% degrees, so be sure to use appropriate trigonometric functions (sind and
% cosd rather than sin and cos).

% IMPORTANT: change the name of this file and the function definition on
% the first line of this file to include your MU student number rather than
% "starter".  The name of the file and the line above should match.

% Calculate the A matrix that corresponds to a, alpha, d, and theta.  
% Your code should go here.  For now, we are just filling each column with
% a parameter, but you will definitely want to change this.
A = [ a alpha d theta; ...
      a alpha d theta; ...
      a alpha d theta; ...
      a alpha d theta];
