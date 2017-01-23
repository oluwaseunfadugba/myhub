%function plot_code
%% Plotting
scale=1;

figure (1)
section_display(p_up,scale,depth_to_go_i',time)
ylabel('time (sec) ','FontSize',14); xlabel('depth(km)','FontSize',14); grid MINOR; 
title(' Upgoinging P wave with Depth','FontSize',14);

figure (2)
section_display(p_down,scale,depth_to_go_i',time)
ylabel('time (sec) ','FontSize',14); xlabel('depth(km)','FontSize',14); grid MINOR; 
title(' Downgoinging P wave with Depth','FontSize',14);

figure (3)
section_display(s_up,scale,depth_to_go_i',time)
ylabel('time (sec) ','FontSize',14); xlabel('depth(km)','FontSize',14); grid MINOR; 
title(' Upgoinging S wave with Depth','FontSize',14);

figure (4)
section_display(s_down,scale,depth_to_go_i',time)
ylabel('time (sec) ','FontSize',14); xlabel('depth(km)','FontSize',14); grid MINOR; 
title(' Downgoinging S wave with Depth','FontSize',14);

figure (5)
section_display(hor,scale,depth_to_go_i',time)
ylabel('time (sec) ','FontSize',14); xlabel('depth(km)','FontSize',14); grid MINOR; 
title(' Horizontal Displacement','FontSize',14);

figure (6)
section_display(vert,scale,depth_to_go_i',time)
ylabel('time (sec) ','FontSize',14); xlabel('depth(km)','FontSize',14); grid MINOR; 
title(' Vertical Displacement','FontSize',14);
