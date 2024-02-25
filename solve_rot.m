function [u,theta] = solve_rot(R)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
s_x = R(1,1);
s_y = R(2,1);
s_z = R(3,1);

n_x = R(1,2);
n_y = R(2,2);
n_z = R(3,2);

a_x = R(1,3);
a_y = R(2,3);
a_z = R(3,3);

C_theta = 0.5 * (s_x + n_y + a_z - 1);
S_theta = 0.5 * sqrt((n_z - a_y)^2 + (a_x - s_z)^2 + (s_y - n_x)^2);
theta = atan2(S_theta,C_theta);

ux = sign(n_z - a_y) * sqrt((s_x - C_theta) / (1 - C_theta));
uy = sign(a_x - s_z) * sqrt((n_y - C_theta) / (1 - C_theta));
uz = sign(s_y - n_x) * sqrt((a_z - C_theta) / (1 - C_theta));

u = [ux uy uz];

end

