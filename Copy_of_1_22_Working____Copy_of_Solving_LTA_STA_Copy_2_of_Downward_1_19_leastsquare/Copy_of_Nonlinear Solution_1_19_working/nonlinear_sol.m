close all; clear all

%% Input a starting model
ao = [1; 3]; 
%%
max_ite = 50000; ep = 1e-16;
err = [1;1]; j = 0; i = 0;
% 
while (abs(err(1)) > ep) && (abs(err(2)) > ep) && (i < max_ite)
         i = i + 1; 

        if i == 1;
        a_new = ao - H_inv(ao(1),ao(2));
        err = a_new - ao;
        a_new1 = a_new;

        else
             a_new1 = a_new - H_inv(a_new(1),a_new(2));
             err = a_new1 - a_new; 
             a_new = a_new1;
        end
end


a_new1


