function [vert,hor,p_up,p_down,s_up,s_down,sig,tau,time] = downw_cont(model_file, depth_to_go)

p = 0.05;  % Enter the value of ray parameter
twidth = 1.0; %
tshift = 5.0;
rdepth = 0.0;
depth_to_go = depth_to_go + 0.001;
synthfile ='waveform'; % filename for the free surface displacements
    
%!./rundndisp 0.05 0.0 40.01 waveform.pv waveform.ph crust.dat waveform_at_depth
   eval(sprintf('%s%2.3f %2.3f %5.4f %s%s %s%s %s %s','!./rundndisp ',real(p), imag(p), ...
   depth_to_go,synthfile,'.pv',synthfile,'.ph',model_file,'fad'))

[time,vert]= readsac('fad.w'); 
[time, hor] = readsac('fad.u');
[time,p_up] = readsac('fad.pup');
[time,p_down] = readsac('fad.pdn');
[time,s_up] = readsac('fad.sup');
[time,s_down] = readsac('fad.sdn');
[time,sig] = readsac('fad.sig');
[time,tau] = readsac('fad.tau');