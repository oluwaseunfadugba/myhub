function [s_up_n, time] = downw_cont_leatsquare(model_file, depth_to_go)
% clear all; close all; clc
% model_file = 'crust.dat'; % velocity model file
% depth_to_go = 2;%  20:2:60; %[0 40];

!chmod 777 rundndisp

p = 0.05;  % Enter the value of ray parameter
P_wave_arrival_time = 10.8;



twidth = 1.0; tshift = 5.0; rdepth = 0.0;
depth_to_go = depth_to_go + 0.001;
synthfile ='waveform'; % filename for the free surface displacements
    
%!./rundndisp 0.05 0.0 40.01 waveform.pv waveform.ph crust.dat waveform_at_depth
   eval(sprintf('%s%2.3f %2.3f %5.4f %s%s %s%s %s %s','!./rundndisp ',real(p), imag(p), ...
   depth_to_go,synthfile,'.pv',synthfile,'.ph',model_file,'fad'))

[time,vert]= readsac('fad.w');       [time, hor] = readsac('fad.u');
[time,p_up] = readsac('fad.pup');    [time,p_down] = readsac('fad.pdn');
[time,s_up] = readsac('fad.sup');    [time,s_down] = readsac('fad.sdn');
[time,sig] = readsac('fad.sig');     [time,tau] = readsac('fad.tau');

% The next thing is to get the noncausal energy of the S-up waveform.
% The first if to determine th position of the P-wave arrival.

% I need to know the value of the index to get the correct noncausal energy

% index = STA_LTA(p_up);

 
 index = STA_LTA_now(depth_to_go, p, P_wave_arrival_time);
 
 
 s_up_n = sum((s_up(1:index)).^2);
 
 !rm -f fad*