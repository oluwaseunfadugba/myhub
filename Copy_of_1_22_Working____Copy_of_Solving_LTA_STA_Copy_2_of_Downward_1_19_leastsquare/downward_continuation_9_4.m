% function [A1,A2,B1,B2,u,w]=downward_continuation_9_4(surfac, vp, vs, rho, th, depth_to_go, time, freq)
% % Downward continuation
% 
% % Necessary functions

clear all; close all; clc;
depth_to_go = 2;

filename = 'crust.dat';%
%filename = 'b2q2.dat';  % 

A=importdata(filename);
nl = A.data(1);
crust = reshape(A.data(2:end),6,nl)';

%% normal velocity profile
 vp = crust(:,1); vs = crust(:,2); rho = crust(:,3); th = crust(:,4); qp = crust(:,5); qs = crust(:,6);


 %%


dep = th(1); nlayer = length(vp);

for i = 1: nlayer
    % case 2
    if (dep < depth_to_go)  && (i < nlayer)
     
        vp_now(i) = vp(i); vs_now(i) = vs(i); rho_now(i) = rho(i); th_now(i) = th(i);
     
       % case 1
    elseif (dep > depth_to_go) && (i>1)
        th_x = depth_to_go - dep_ref ;
        
        vp_now(i) = vp(i); vs_now(i) = vs(i); rho_now(i) = rho(i); th_now(i) = th_x;
        vp_now(i+1) = vp(i); vs_now(i+1) = vs(i); rho_now(i+1) = rho(i); th_now(i+1) = 10;%th_x;
        
        continueee
      %vp_now
        
         elseif (dep > depth_to_go)  && (i==1)

        vp_now(i) = vp(i); vs_now(i) = vs(i); rho_now(i) = rho(i); th_now(i) = depth_to_go;
        vp_now(i+1) = vp(i); vs_now(i+1) = vs(i); rho_now(i+1) = rho(i); th_now(i+1) = 10;%depth_to_go;
        
       continueee

% vp_now
        
        
         % case 4
        elseif (dep < depth_to_go) && (i==nlayer)
        
        th_x =  depth_to_go - dep ;
        vp_now(i) = vp(i); vs_now(i) = vs(i); rho_now(i) = rho(i); th_now(i) = th(i);
        vp_now(i+1) = vp(i); vs_now(i+1) = vs(1); rho_now(i+1) = rho(1); th_now(i+1) = th_x;
        vp_now(i+2) = vp(i); vs_now(i+2) = vs(i); rho_now(i+2) = rho(i); th_now(i+2) = 10;%th_x;
        
     continueee
  %        vp_now 
        % case 3
    elseif (dep == depth_to_go)  && (i<nlayer)
        
        vp_now(i) = vp(i); vs_now(i) = vs(i); rho_now(i) = rho(i); th_now(i) = th(i);
        vp_now(i+1) = vp(i+1); vs_now(i+1) = vs(i+1); rho_now(i+1) = rho(i+1); th_now(i+1) =10;% th(i+1);
        
      continueee

    %      vp_now
          elseif (dep == depth_to_go)  && (i==nlayer)
        
        vp_now(i) = vp(i); vs_now(i) = vs(i); rho_now(i) = rho(i); th_now(i) = th(i);
        vp_now(i+1) = vp(i); vs_now(i+1) = vs(i); rho_now(i+1) = rho(i); th_now(i+1) = 10;%th(i);
        
        % vp_now
        continueee
         
    end
    
    if i< nlayer
        dep_ref = dep; 
        dep = dep + th(i+1);
    
    end
end


