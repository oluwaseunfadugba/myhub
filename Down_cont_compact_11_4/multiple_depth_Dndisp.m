clear all; close all; clc

!chmod 777 rundndisp

model_file = 'crust.dat'; % velocity model file

i = 0; depth_to_go_i = 0:2:40;%  20:2:60; %[0 40];

for j= depth_to_go_i
    i = i+1;
[vert(:,i),hor(:,i),p_up(:,i),p_down(:,i),s_up(:,i),s_down(:,i),sig(:,i),tau(:,i),time] = ...
    downw_cont(model_file, depth_to_go_i(i));

end

!rm -f fad.*

plot_code