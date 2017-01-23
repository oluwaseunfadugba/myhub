 function [f,d] = f(x,y,z)

N = 40;

model_file = 'crust.dat'; % velocity model file

model = [ 6.0        3.5        2.7        20.0       500.0    250.0;
   6.8        3.9        2.9        20.0       500.0    250.0;
   8.1        4.5        3.2        10.0       500.0    250.0];
   
    
model(1,2) = x;
model(2,2) = y;
model(3,2) = z;

model(1,1) = sqrt(3)*x;
model(2,1) = sqrt(3)*y;
model(3,1) = sqrt(3)*z;


write_model_crust_dat(model);


for i = 1:N;
    %i
depth_to_go = i;%  20:2:60; %[0 40];

[s_up_n(i), time] = downw_cont_leatsquare(model_file, depth_to_go);

end

% plot(s_up_n); shg


f = s_up_n;
f = f';

d = 1e-10 * ones(N,1);

% f(1) = x^2 +y^2 + z;
% f(2) = (3*x^2) +(2*y) +(y*z);
% f(3) = (4*x) + (3*y^2) +(2*z);
% f(4) = (5*x) +y +z^2;
% f(5) = x +y;
% f(6) = x + z ;
% f(7) = x + y +z;
% f(8) = y;
