function [hom,rot] = rot(orientation,theta)
% ROT - Generates a rotation matrix along the axis specified by 'orientation'.
%
%   [hom, rot] = rot(orientation, theta) generates a rotation matrix 'rot' 
%   and a homogeneous transformation matrix 'hom' for the specified rotation 
%   about the axis indicated by 'orientation' by an angle 'theta' in radians.
%
%   Parameters:
%   - orientation: Axis of rotation. Valid values are 'x', 'y', or 'z'.
%   - theta: Rotation angle in radians.
%
%   Output:
%   - hom: Homogeneous transformation matrix including the rotation.
%   - rot: Rotation matrix.
%
%   Example:
%   [hom, rot] = rot('y', pi/2) generates a rotation matrix for a rotation
%   of pi/2 radians about the y-axis.
%
%   See also: sin, cos
st = sin(theta);
ct = cos(theta);

if orientation == 'x'
    mat = [1 0 0; 0 ct -st; 0 st ct];
elseif orientation == 'y'
    mat = [ct 0 st; 0 1 0; -st 0 ct];
elseif orientation == 'z'
    mat = [ct -st 0; st ct 0; 0 0 1];
else
    error('Invalid orientation. Use ''x'', ''y'' or ''z''.');
end

rot = mat;
hom = [mat; zeros(1,3)];
translation = [0 0 0 1]';
hom = [hom, translation];
end
