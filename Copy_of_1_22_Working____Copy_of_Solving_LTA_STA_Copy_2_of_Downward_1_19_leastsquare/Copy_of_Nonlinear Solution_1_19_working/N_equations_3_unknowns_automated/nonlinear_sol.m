close all; clear all
%% 4 equations with 3 unknowns
% Non-linear

%% Input a starting model

ao = [-350000; -2500; -30000]; 
%ao = [3500; 2500; 30000]; % the best thing is to make the initial starting model 
    % from a practical and feasible model
 


% ao = [1; 3; 2]; % the best thing is to make the initial starting model 
%     % from a practical and feasible model
%     
%%
max_ite = 100000; ep = 1e-16; err = [1;1]; i = 0;
% 
while (abs(err(1)) > ep) && (abs(err(2)) > ep) && (i < max_ite)
         i = i + 1; 

        if i == 1;
        a_new = ao - H_inv(ao(1),ao(2),ao(3));
        err = a_new - ao;
        a_new1 = a_new;

        else
             a_new1 = a_new - H_inv(a_new(1),a_new(2),a_new(3));
             err = a_new1 - a_new; 
             a_new = a_new1;
        end
end


a_new1


