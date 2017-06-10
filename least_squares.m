% 12.805 Homework 2: Underdetermined Least Squares Estimation
% Bryan Kaiser
% 3/9/16

close all; clear all; clc;

%==========================================================================
% problem 1: underdetermined least squares

% a) Lagrange multiplier method
E = [1 1 -1; 1 1 1]; y = [1; 2];
%x = E'*inv(E*E')*y
mu = (E*E')*y; % Lagrange multiplier
x = E'/(E*E')*y
J = x'*x; % sq. solution norm

% b) weighted and tapered least squares
N = size(E,1); % number of constraints
M = size(E,2); % number of variables
S = eye(M);
W = eye(N);
x = (E'/W*E+inv(S))\E'/W*y


% c) overdetermined least squares with smoothing min||dx^2||
D = [ 1 0; -1 1; 0 -1];
Sinv=D*D';
x = (E'/W*E+Sinv)\E'/W*y

%==========================================================================
% problem 2: overdetermined vs. underdetermined least squares

% overdetermined least squares
E = [1 -3; -3 1]; y = [1; -1];
x = (inv(E'*E))*(E'*y)
x = E\y

% underdetermined least squares (Lagrange multiplier)
mu = (E*E')*y % Lagrange multiplier
x = E'/(E*E')*y
J = x'*x % sq. solution norm
%inv(E'*E)*E'-E'*inv(E*E') % = 0

