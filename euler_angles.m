function [res1,res2] = euler_angles(R)
% EULER_ANGLES - Computes Euler angles from a given rotation matrix.
%
%   [res1, res2] = euler_angles(R) computes the Euler angles from the 
%   rotation matrix 'R' using the ZYX convention. It returns two sets of 
%   Euler angles 'res1' and 'res2' corresponding to two different solutions.
%
%   Parameters:
%   - R: 3x3 rotation matrix.
%
%   Outputs:
%   - res1: First set of Euler angles [phi, theta, psi] in radians.
%   - res2: Second set of Euler angles [phi, theta, psi] in radians.
%
%   Explanation:
%   The function computes the Euler angles phi, theta, and psi using the 
%   ZYX convention. It first calculates phi using the atan2 function to 
%   handle the singularities. Then, it computes theta and psi based on 
%   phi, adjusting phi by pi radians for the second solution.
%
%   Example:
%   R = [0.8660 -0.5000 0; 0.5000 0.8660 0; 0 0 1];
%   [res1, res2] = euler_angles(R) returns two sets of Euler angles for
%   the given rotation matrix.
%
%   See also: atan2x|

phi = atan2(-R(1,3),R(2,3));
theta = atan2(-R(2,3)*cos(phi) + R(1,3) * sin(phi),R(3,3));
psi = atan2(-R(1,2)*cos(phi)-R(2,2)*sin(phi), R(1,1)*cos(phi)+R(2,1)*sin(phi));
res1 = [phi, theta, psi];
phi = phi + pi;
theta = atan2(-R(2,3)*cos(phi) + R(1,3) * sin(phi),R(3,3));
psi = atan2(-R(1,2)*cos(phi)-R(2,2)*sin(phi), R(1,1)*cos(phi)+R(2,1)*sin(phi));
res2 = [phi, theta, psi];
end