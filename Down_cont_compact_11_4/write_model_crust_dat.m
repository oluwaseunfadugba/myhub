function write_model_crust_dat(model)


%%
% The first thing is to read the vtk files in the current folder to be
% converted. This program can convert many vtk files at teh same time. 
fnames = dir('crust_template.dat');

numfids = length(fnames); % number of vtk files

filename = (fnames(1).name); % extract the filename
   
filename2 = 'crust.dat'; % tags for new and converted vtk files
 
% copy the content of the original filename into a new filename
copyfile(filename,filename2) 

dim = size(model);
dim_model = dim(1);

dlmwrite(filename2,dim_model,'-append','delimiter','\t')
dlmwrite(filename2,model,'-append','delimiter','\t')





































































% % if nargin<2
% %     verbose = 1;
% % end
% 
% fid = fopen(filename,'r'); % open the original vtk file 
% 
% % test if the file exists and able to open
% if( fid==-1 ) 
%     error('Can''t open the file.');
%     return;
% end
% 
% 
% 
% 
% str = fgets(fid); % read the first line
% 
% % check if the file is a vtk file
% if ~strcmp(str(3:5), 'vtk')
%     error('The file is not a valid VTK one.');    
% end
% 
% %%% read header %%%
% 
% 
% 
% str = fgets(fid); str = fgets(fid); 
% str = fgets(fid); str = fgets(fid); 
% 
% % extracting the number of points
% nvert = sscanf(str,'%*s %d %*s', 1);
% 
% %% read vertices in the original vtk file
% [A,cnt] = fscanf(fid,'%f %f %f', 3*nvert); % cnt is the number of data points
% 
% % checking if the number of data point is correct
% if cnt~=3*nvert 
%     warning('Problem in reading vertices.');
% end
% A_r = reshape(A, 3, cnt/3)'; % reshape the strain components
% 
% %% read polygons
% 
% str = fgets(fid); % empty line
% 
% % sometimes, there are more empty files than usual. So the idea of reading
% % the lines until the empty lines are all read
% 
% while length(str) == 1;
% 
%     str = fgets(fid);
%     
% end
% 
% %% extract the number of cells
% info = sscanf(str,'%*s %d %*s', 1);
% 
% %% read vertices
% [B,cnt_cell] = fscanf(fid,'%d %d %d %d', 5*info);
% 
% if cnt_cell~=5*info
%     warning('Problem in reading vertices.');
% end
% B_r = reshape(B, 5, cnt_cell/5)'; % reshape the strain components
% B_r = B_r(:,2:end);
% 
% %% empty line after the cells
% str = fgets(fid); 
% while length(str) == 1;
% 
%     str = fgets(fid);
%     
% end
% 
% %% reading the number of cell types
% info_2 = sscanf(str,'%*s %d', 1);
% 
% % read the cell types
% [Cell_type,cnt_cell2] = fscanf(fid,'%d', info_2);
% 
% %% reading strain components
% str = fgets(fid); 
% 
% while length(str) == 1;
% 
%     str = fgets(fid);
%     
% end
% 
% 
% 
% %% writing the cell_data and the number of points below the original vtk file
% %dlmwrite(filename2,str,'-append','delimiter','')
% 
% % reading the next couple of empty files
% str = fgets(fid);
% while length(str) == 1;
% 
%     str = fgets(fid);
%     
% end
% 
% % concanate the header of the principal strain 
% % i.e. SCALAR princ_total_strain double 6
% 
% str_2 = sprintf('%s %s %s %s',str(1:7),'princ_total_strain',str(22:end-1));
% str_2_int = sprintf('%s %s %s %s',str(1:7),'val_princ_total_strain',str(22:end-1));  % header for additional field
% 
% % writing the header in the new vtk file
% dlmwrite(filename2,str_2,'-append','delimiter','')
% 
% 
% str = fgets(fid);
% while length(str) == 1;
% 
%     str = fgets(fid);
%     
% end
% 
% % write the Look_up table header for the principal strain
% dlmwrite(filename2,str,'-append','delimiter','')
% 
% 
% %% read the strain component
% [strain_comp,cnt_cell3] = fscanf(fid,'%f %f %f %f %f %f', 6*info_2);
% 
% if cnt_cell3~=6*info_2
%     warning('Problem in reading vertices.');
% end
% strain_comp = reshape(strain_comp, 6, cnt_cell3/6)'; % reshape the strain components
% 
% 
% %% determining principal strain components
% num_row = length(strain_comp);
% 
% for i = 1:num_row
%     matrix(1,1) = strain_comp(i,1);
%     matrix(2,2) = strain_comp(i,2);
%     matrix(3,3) = strain_comp(i,3);
%     matrix(2,1) = strain_comp(i,4);
%     matrix(3,1) = strain_comp(i,5);
%     matrix(2,3) = strain_comp(i,1);
%     matrix(1,2) = matrix(2,1);
%     matrix(1,3) = matrix(3,1);
%     matrix(3,2) = matrix(2,3);
%     
%     [evector,eigen] = eig(matrix);
%     
%     princ_strain_comp(i,1) = eigen(1,1);
%     princ_strain_comp(i,2) = eigen(2,2);
%     princ_strain_comp(i,3) = eigen(3,3);
%     princ_strain_comp(i,4) = 0;
%     princ_strain_comp(i,5) = 0;
%     princ_strain_comp(i,6) = 0;
%     
%     
%     validation_matrix = (evector*eigen*evector') - matrix;
%     
%     validation_princ_strain_comp(i,1) = validation_matrix(1,1);
%     validation_princ_strain_comp(i,2) = validation_matrix(2,2);
%     validation_princ_strain_comp(i,3) = validation_matrix(3,3);
%     validation_princ_strain_comp(i,4) = validation_matrix(1,2);
%     validation_princ_strain_comp(i,5) = validation_matrix(1,3);
%     validation_princ_strain_comp(i,6) = validation_matrix(2,1); 
%     % I left (2,3), (3,1) and (3,2)
%     end
% 
% % writing the principal strain components (all the strain tensor
% dlmwrite(filename2,princ_strain_comp,'-append','delimiter',' ');
% 
