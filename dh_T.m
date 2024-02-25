function [T] = dh_T(a, alpha, d, theta)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
T = rot('z',theta) * trans([0 0 d]) * rot('x',alpha) * trans([a 0 0]);
end

