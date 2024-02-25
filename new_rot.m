function [hom, rot] = new_rot(orientation, theta)
% ROT - Generates a rotation matrix along the axis specified by 'orientation',
%       or around a given vector 'orientation'.
%
%   [hom, rot] = rot(orientation, theta) generates a rotation matrix 'rot'
%   and a homogeneous transformation matrix 'hom' for the specified rotation
%   about the axis indicated by 'orientation' by an angle 'theta' in radians.
%   If 'orientation' is a vector, the rotation is around that vector.
%
%   Parameters:
%   - orientation: Axis of rotation. Valid values are 'x', 'y', 'z', or a
%                  3-element vector representing the rotation axis.
%   - theta: Rotation angle in radians.
%
%   Output:
%   - hom: Homogeneous transformation matrix including the rotation.
%   - rot: Rotation matrix.
%
%   Example:
%   [hom, rot] = rot('y', pi/2) generates a rotation matrix for a rotation
%   of pi/2 radians about the y-axis.
%   [hom, rot] = rot([1; 1; 1], pi/3) generates a rotation matrix for a rotation
%   of pi/3 radians around the vector [1; 1; 1].
%
%   See also: sin, cos

st = sin(theta);
ct = cos(theta);

if ischar(orientation)
    if orientation == 'x'
        mat = [1 0 0; 0 ct -st; 0 st ct];
    elseif orientation == 'y'
        mat = [ct 0 st; 0 1 0; -st 0 ct];
    elseif orientation == 'z'
        mat = [ct -st 0; st ct 0; 0 0 1];
    else
        error('Invalid orientation. Use ''x'', ''y'', ''z'', or a 3-element vector.');
    end
elseif isvector(orientation) && numel(orientation) == 3
    ux = orientation(1);
    uy = orientation(2);
    uz = orientation(3);
    U = [0 -uz uy; uz 0 -ux; -uy ux 0];
    coeficients = [ux^2 ux*uy ux*uz; ux*uy uy^2 uy*uz; ux*uz uy*uz uz^2];
    terms =[ct -uz*st uy*st; uz*st ct -ux*st; -uy*st ux*st ct];
    mat = ones(3,3)*(1-ct);
    mat = mat .* coeficients;
    mat = mat + terms;
else
    error('Invalid orientation. Use ''x'', ''y'', ''z'', or a 3-element vector.');
end

% Calculate homogeneous transformation matrix
hom = [mat; zeros(1,3)];
translation = [0 0 0 1]';
hom = [hom, translation];

% Return rotation matrix
rot = mat;
end
