% 12.805 homework 1, problem 2
% Bryan Kaiser
% 2/22/16

close all; clear all; clc;
addpath('./functions'); run('./functions/mcolormaps.m');

%==============================================================================
% problem 1: overdetermined least squares

% solution
E=[1 -1; 1 1; 1 2];
y=[1; 2; 2];
x = (inv(E'*E))*(E'*y)

% minimized squared noise norm
n=[1-x(1)+x(2); 2-x(1)-x(2); 2-x(1)-2*x(2)];
err=n'*n

% plot of minimized squared noise norm for a spread of x1,x2
N = 400;
x1 = linspace(-10,10,N);
x2 = linspace(-10,10,N);
nTn = nan(N,N);
for i = 1:N
    for j = 1:N
        n=[1-x1(i)+x2(j); 2-x1(i)-x2(j); 2-x1(i)-2*x2(j)];
        nTn(i,j)=n'*n;
        clear n
    end
end
[X1,X2]=meshgrid(x1,x2);
surf(X1,X2,nTn'); view(2); %shading flat 
colorbar; colormap(reds/255); %colormap(flipud(colormap));  
shading flat; grid off; axis tight
xlabel('x_1','FontSize',14);
ylabel('x_2','FontSize',14);
title('n^Tn')
caxis([0,20]);

% find x1,x2 corresponding to the minimized squared noise norm
loc_min_nTn = min(min(nTn));
loc_min_nTn = find(nTn'==loc_min_nTn);
x1_min=X1(loc_min_nTn)
x2_min=X2(loc_min_nTn)
