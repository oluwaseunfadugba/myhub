function g = r(x,y)
% f(x,y) = chai_square(x,y);
%% H_inv
% x=1; y=2;
x = a_new(1); y = a_new(2);
dx = 0.00000001; dy = 0.00000001;
H(1,1) = (f(x+2*dx,y) - 2* f(x + dx, y) + f(x,y))/dx^2;
H(1,2) = (f(x + dx, y + dy) - f(x,y+dy) - f(x+dx,y) +f(x,y))/(dx*dy);
H(2,1) = (f(x + dx, y + dy) - f(x,y+dy) - f(x+dx,y) +f(x,y))/(dx*dy);
H(2,2) = (f(x,y+2*dy) - 2* f(x, y + dy) + f(x,y))/dy^2;

H_inv = H^(-1);

%%
d_fx = (f(x + dx,y) - f(x,y))/dx;
d_fy = (f(x,y+dy) - f(x,y))/dy;

d_f = [d_fx; d_fy];

%% produc
g = H_inv * d_f;