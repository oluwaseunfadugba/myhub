vp_now = vp_now';
vs_now = vs_now';
rho_now = rho_now';
th_now = th_now';

nlayer = length(vp_now);

 zn = sum(th(1:end-1));

p = 0.05;   

% depth to each interface
% we chose z to be positive downwards with zero at the source
thcum0 = cumsum(th_now(1:end-1)); thcum = [(-1)*thcum0(end:-1:1)' 0]; 
 thcum = [0 thcum0'];


vp_now
break % escape from the rest velocity profile iterations

