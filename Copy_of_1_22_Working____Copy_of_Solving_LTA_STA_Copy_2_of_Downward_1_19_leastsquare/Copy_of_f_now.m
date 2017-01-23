 clear all; close all; clc

model_file = 'crust.dat'; % velocity model file


% model = [6.0 3.5	2.7	20.0	500.0	250.0;
%     6.0	3.5	2.7	20.0	500.0	250.0];

model = [ 6.0        3.5        2.7        20.0       500.0    250.0;
   6.8        3.9        2.9        20.0       500.0    250.0;
   8.1        4.5        3.2        10.0       500.0    250.0];
   
    



write_model_crust_dat(model);


for i = 1:20;
    %i
depth_to_go = i;%  20:2:60; %[0 40];

[s_up_n(i), time] = downw_cont_leatsquare(model_file, depth_to_go);

end

plot(s_up_n); shg