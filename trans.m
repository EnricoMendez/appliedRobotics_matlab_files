function hom = trans(displacement)
% TRANS - Generates a homogeneous transformation matrix for translation.
%
%   hom = trans(displacement) generates a homogeneous transformation matrix 
%   'hom' for translation specified by the displacement vector 'displacement'.
%
%   Parameters:
%   - displacement: Vector specifying the translation in x, y, and z directions.
%
%   Output:
%   - hom: Homogeneous transformation matrix for the translation.
%
%   Example:
%   hom = trans([1 2 3]) generates a transformation matrix for a translation
%   of 1 unit in the x-direction, 2 units in the y-direction, and 3 units in
%   the z-direction.
%
%   See also: eye

% Check if the displacement vector has the correct dimensions
if numel(displacement) ~= 3
    error('Displacement vector must have 3 elements (x, y, z).');
end

% Create the homogeneous transformation matrix with symbolic entries
hom = sym(eye(4));
hom(1:3, 4) = displacement(:); % Ensure displacement is a column vector
end
