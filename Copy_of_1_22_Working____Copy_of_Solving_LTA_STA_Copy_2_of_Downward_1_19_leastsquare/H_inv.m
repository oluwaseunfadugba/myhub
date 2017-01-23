function r = H_inv(x,y,z)

%x = 3.5; y=3.9; z = 4.5;

N = 40;

%dx = 0.000000001;
dx = 0.01;
a1 = (f(x+dx,y,z) - f(x,y,z))/dx;

%%
% dy = 0.000000001; 
dy = 0.01;
a2 = (f(x,y+dy,z) - f(x,y,z))/dy;

%%
%dz = 0.000000001;
dz = 0.01;
[d_f,d] = f(x,y,z);
 
a3 = (f(x,y,z+dz) - f(x,y,z))/dz;

%%
aa = [a1 a2 a3];

%%
ll = 0;
for i = 1:N;
    ll = ll + 2*(aa(i,1)^2 ) ;%+ aa(2,1)^2+ aa(3,1)^2+ aa(4,1)^2);
end
H(1,1) = ll;

ll = 0;
for i = 1:N;
    ll = ll + 2*(aa(i,1)*aa(i,2)) ;%+ aa(2,1)^2+ aa(3,1)^2+ aa(4,1)^2);
end
H(1,2) = ll;


ll = 0;
for i = 1:N;
    ll = ll + 2*(aa(i,1)*aa(i,3) );%+ aa(2,1)^2+ aa(3,1)^2+ aa(4,1)^2);
end
H(1,3) = ll;


ll = 0;
for i = 1:N;
    ll = ll + 2*(aa(i,2)^2);%+ aa(2,1)^2+ aa(3,1)^2+ aa(4,1)^2);
end
H(2,2) = ll;


ll = 0;
for i = 1:N;
    ll = ll + 2*(aa(i,2)*aa(i,3));%+ aa(2,1)^2+ aa(3,1)^2+ aa(4,1)^2);
end
H(2,3) = ll;


ll = 0;
for i = 1:N;
    ll = ll + 2*(aa(i,3)^2);%+ aa(2,1)^2+ aa(3,1)^2+ aa(4,1)^2);
end
H(3,3) = ll;


H(2,1) = H(1,2);
H(3,1) = H(1,3);
H(3,2) = H(2,3);


if (rcond(H)<1e-12)
% This matrix doesn't look good. so add a small number to the diagonal
% elements
H = H + 0.000001*eye(size(H)); %eye

end

H_inv = H^(-1);


%H_inv = H_inv/0.001;

%% del of chai-square 
del = 0;
for i = 1:N;
del = del - 2*(d(i)-d_f(i)) * [aa(i,1); aa(i,2); aa(i,3)];
end

r = H_inv * del;