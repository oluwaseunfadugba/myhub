function r = H_inv(x,y)
dx = 0.000000001;
a1 = (f(x+dx,y) - f(x,y))/(dx);

%%
dy = 0.000000001;
[d_f,d] = f(x,y);

a2 = (f(x,y+dy) - f(x,y))/(dy);

aa = [a1 a2];

%%
H(1,1) = 2*(aa(1,1)^2 + aa(2,1)^2);
H(1,2) = 2*(aa(1,1)*aa(1,2) + aa(2,1)*aa(2,2));
H(2,1) = H(1,2);
H(2,2) = 2*(aa(1,2)^2 + aa(2,2)^2);

H_inv = H^(-1);

%% del of chai-square 

del_1(1) = -2*(d(1)-d_f(1)) * aa(1,1);
del_2(1) = -2*(d(2)-d_f(2)) * aa(2,1);

del_1(2) = -2*(d(1)-d_f(1)) * aa(1,2);
del_2(2) = -2*(d(2)-d_f(2)) * aa(2,2);

del = del_1 + del_2;

%% H^-1 * del
r = H_inv * del';