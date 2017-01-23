close all; clear all

%% Input a starting model
ao = [1.; 2]; 


%%

max_ite = 50000; ep = 1e-1 ;
err = [1;1]; j = 0; i = 0;
% 
while (abs(err(1)) > ep) && (abs(err(2)) > ep) && (i < max_ite)
         i = i + 1; 

        if i == 1;
        a_new = ao - r(ao(1),ao(2));
        err = a_new - ao;

        else
            x = a_new(1); y = a_new(2);
             a_new1 = a_new - r(x,y);
             err = a_new1 - a_new; 
             a_new = a_new1;
        end
end
a_new
