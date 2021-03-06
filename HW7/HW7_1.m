% 2017 Fall Numerical Optimization Homework #7
% 2017. 11. 20
% 20161216 HAN SANGJUN

clc;
clear;
close all;
max_iter = 5000; % when reach to end of loop, evoke error      
epsilon = 1;  % for terminating condition

%% Model 1 - ax + by + cz + d
jacobian_mat = zeros(0, 4);

% load given data
path = ['C:\Users\HANSANGJUN\Desktop\GIST\2-1\Numerical Optimization\2017\HW7\observation.xlsx'];
data = xlsread(path);

% range = 10;
% W = -range + (range + range) * rand(1, 4); % a b c d weight initialization

W = [1, 1, 1, 1];

syms a b c d x y z target;
f = symfun((a*x) + (b*y) + (c*z) + d, [a b c d x y z]); % model
R = symfun(f - target, [a b c d x y z target]); % residual6
J = jacobian(R, [a b c d]); % jacobian

[cost, W, time, iter] = gaussNewton(f, R, J, W, data, epsilon, max_iter);
fprintf('1. Gauss-Netwon method - It takes %fsec to evaluate cost [%f] for %d iter\n', time, cost, iter);

% [cost, W, time, iter] = LM(f, R, J, W, data, epsilon, max_iter);
% fprintf('2. LM method - It takes %fsec to evaluate cost [%f] for %d iter\n', time, cost, iter);