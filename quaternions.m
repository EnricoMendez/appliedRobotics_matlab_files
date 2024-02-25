function [quaternion] = quaternions(R)
%QUATERNIONS Summary of this function goes here
%   Detailed explanation goes here
    % Calcular los componentes del cuaternión según la ecuación proporcionada
    s_x = R(1,1);
    s_y = R(2,1);
    s_z = R(3,1);
    
    n_x = R(1,2);
    n_y = R(2,2);
    n_z = R(3,2);
    
    a_x = R(1,3);
    a_y = R(2,3);
    a_z = R(3,3);

    q0 = 1/2 * sqrt(s_x+n_y+a_z+1);
    q1 = 1/2 * sqrt(s_x-n_y-a_z+1) * sign(n_z-a_y);
    q2 = 1/2 * sqrt(-s_x+n_y-a_z+1) * sign(a_x-s_z);
    q3 = 1/2 * sqrt(-s_x-n_y+a_z+1) * sign(s_y-n_x);
    
    quaternion = [q0, q1, q2, q3];
end

