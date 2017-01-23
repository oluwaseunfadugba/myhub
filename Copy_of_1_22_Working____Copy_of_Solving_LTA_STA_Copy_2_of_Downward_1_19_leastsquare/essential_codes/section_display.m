function section_display (a,scal,x,z)
%mwigb: is a modified version of wigb.m which plot seismic data using
%wiggles but displays the screen as a normal seismic display such as those
%seen using SeismicUnix. 
%
%  wigb(a,scal,x,z,amx) 
%
%  IN    a: seismic data
%        scale: multiple data by scale
%        x: x-axis;
%        z: vertical axis (time or depth)
%	 x and z are vectors with offset and time.
%
%	 If only 'a' is enter, 'scal,x,z,amn,amx' are decided automatically; 
%	 otherwise, 'scal' is a scalar; 'x, z' are vectors for annotation in 
%	 offset and time, amx are the amplitude range.
%
% Author:
% 	Xingong Li, Dec. 1995
% Changes: 
%	Jun11,1997: add amx
% 	May16,1997: updated for v5 - add 'zeros line' to background color
% 	May17,1996: if scal ==0, plot without scaling
% 	Aug6, 1996: if max(tr)==0, plot a line
%   Aug12, 2011: modification by Wail A. Mousa and Abdullatif A. Al-Shuhail

if nargin == 0, nx=10;nz=10; a = rand(nz,nx)-0.5; end;

[nz,nx]=size(a);

trmx= max(abs(a));
amx=mean(trmx); 
if (nargin <= 2); x=[1:nx]; z=[1:nz]; end;
if (nargin <= 1); scal =1; end;

 if nx <= 1; disp(' ERR:PlotWig: nx has to be more than 1');return;end;

 % take the average as dx
	dx1 = abs(x(2:nx)-x(1:nx-1));

 	dx = median(dx1);

 dz=z(2)-z(1);
 xmx=max(max(a)); xmn=min(min(a)); 

 if scal == 0; scal=1; end;
 a = a * dx /amx; 
 a = a * scal;

 fprintf(' PlotWig: data range [%f, %f], plotted max %f \n',xmn,xmx,amx);
 
% set display range 
x1=min(x)-2.0*dx; x2=max(x)+2.0*dx;
z1=min(z)-dz; z2=max(z)+dz;
 
set(gca,'NextPlot','add','Box','on', ...
  'XLim', [x1 x2], ...
  'YDir','reverse', ...
  'YLim',[z1 z2]);
 

	fillcolor = [1 0 1];
	linecolor = [0 0 0];
	linewidth = 0.2;

	z=z'; 	% input as row vector
	zstart=z(1);
	zend  =z(nz);

for i=1:nx,
   
  if trmx(i) ~= 0;    % skip the zero traces
	tr=a(:,i); 	% --- one scale for all section
    
     pp=polyfit(z,tr,0); % fitting an horizontal line to pass through the data set to correct for the shift from the zero line.
    
    tr=tr-pp; % shifting the dataset back to the zero line. Now we have positive and negative amplitudes
    
    
  	s = sign(tr) ;
  	i1= find( s(1:nz-1) ~= s(2:nz) );	% zero crossing points
	npos = length(i1);


	%12/7/97 
	zadd = i1 + tr(i1) ./ (tr(i1) - tr(i1+1)); %locations with 0 amplitudes
	aadd = zeros(size(zadd));

	[zpos,vpos] = find(tr >0);
	[zz,iz] = sort([zpos; zadd]); 	% indices of zero point plus positives
	aa = [tr(zpos); aadd];
	aa = aa(iz);

	% be careful at the ends
    
    pp=polyfit(z,tr,0); % fitting an horizontal line to pass through the data set to correct for the shift from the zero line.
    
    tr=tr-pp; % shifting the dataset back to the zero line. Now we have positive and negative amplitudes
    
		if tr(1)>0, 	a0=0; z0=1.00;
        else 		
            if numel(zadd)>0;
            a0=0; z0=zadd(1);
            else
               continue
            end
		end;
		if tr(nz)>0, 	a1=0; z1=nz; 
        else 		
            if numel(zadd)>0;
            a1=0; z1=max(zadd);
            else
                
                continue
            end
		end;
			
	zz = [z0; zz; z1; z0];
 	aa = [a0; aa; a1; a0];
		

	zzz = zstart + zz*dz -dz;

	patch( aa+x(i) , zzz,  fillcolor);
    %patch( -1*(aa+x(i)) , zzz,  fillcolor);
	
    line( 'Color',[1 1 1],'EraseMode','background',  ...
         'Xdata', x(i)+[0 0], 'Ydata',[zstart zend]); % remove zero line

%'LineWidth',linewidth, ...
%12/7/97 'Xdata', x(i)+[0 0], 'Ydata',[z0 z1]*dz);	% remove zero line

	line( 'Color',linecolor,'EraseMode','background',  ...
	 'LineWidth',linewidth, ...
	 'Xdata', tr+x(i), 'Ydata',z);	% negatives line

   else % zeros trace
	line( 'Color',linecolor,'EraseMode','background',  ...
	 'LineWidth',linewidth, ...
         'Xdata', [x(i) x(i)], 'Ydata',[zstart zend]);
   end;
end;

% Displaying the seismic gather in the traditional way for displaying seismic data
% Aug 12, 2011
x=10;y=10;%starting screen position
w=600;%figure width
h=1200;%figure hieght
% set(gcf,'position',[x y w h]);
% Putting the spatial axis in the top of the figure 
set(gca,'xaxislocation','top')





