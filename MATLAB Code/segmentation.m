%% 
%% Funtion name : segmentation
%% Description  : Extract single character from an image containing 
%%                mathematical expression
%% Input        : image file name to be proccessed in string variabel
%% Output       : segmented characters in the form of matrix for Neural Network
%% Compiler     : MATLAB
%% 
%%  
%% Reference    : MATLAB Forum | Character Segmentation by Rutika Titre & Walter Roberson
%% Source       : https://www.mathworks.com/matlabcentral/answers/262399-how-to-segment-the-characters-from-left-to-right
%% Modified by  : - Jhonson Lee 
%%                - Hans Christian
%% Date Created : 3 December 2017
%% Institution  : Bandung Institute of Technology
%% 
%% Revision     : 1
%% 

function [output] = segmentation(file_name)
%% Input  : image file name to be processed. 
%% Output : Ouput matrix containig segmented image
%% Note   : Image should be at the same directory with this code

%% Read Image
imagen=imread(file_name);

%% Adjust uniform lighting
%%imagen = localnormalize(imagen,6,6);

%% Show image
%
figure(1)
imshow(imagen);
title('INPUT IMAGE')
%}

%% Convert to gray scale
if size(imagen,3)==3 % RGB image
    imagen=rgb2gray(imagen);
end

%% Convert to binary image
threshold = graythresh(imagen);
imagen =~im2bw(imagen,threshold);

%% Remove all object containing fewer than 30 pixels(denoising)
%
imagen = bwareaopen(imagen,15);
pause(1)
%}

%% Show image binary image
%{
figure(2)
imshow(~imagen);
title('IMAGE WITHOUT NOISE')
%}

%% Label connected components
[L Ne]=bwlabel(imagen);

%% Measure properties of image regions
propied=regionprops(L,'BoundingBox');

%% Plot Bounding Box
%{
hold on
for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
hold off
pause (1)
%}

%% Objects extraction

% Variabel initialization
status_f = 0; n = 1; m = 1;
output = [];

while n < (Ne+1)

	% Update status variable
	status_b = status_f;
	status_f = 0;
	
	% Obtain position for 3 adjacent objects
	if (n>1) && (status_b)
		[r_b,c_b] = find(L==(n-1)); % Previous object
	end
    [r,c] = find(L==n);             % Current object
	[r_f,c_f] = find(L==(n+1));		% Next object
    
	% Check whether the next object is actually 
	% a part of current object as one character
	for i=1:size(c)
	  for j=1:size(c_f)
	    if isequal(c(i),c_f(j))
		  status_f = 1; break;
		end
	  end
	end
	
	% Take character's position within the image
	if (~status_b)&&(~status_f)                 % The object is an character
		n1=imagen(min(r):max(r),min(c):max(c));
		n = n + 1;
	elseif (status_b)&&(~status_f)              % The previous object is a part of current object as one character
		row = [r_b;r]; column = [c_b;c];
		n1=imagen(min(row):max(row),min(column):max(column));
		n = n + 1;
		
	elseif (status_b)&&(status_f)               % The previous, current and next object is a character
		row = [r_b;r;r_f]; column = [c_b;c;c_f]; 
		n1=imagen(min(row):max(row),min(column):max(column));
		n = n + 2; status_f = 0;
	else
		n = n + 1;		
	end
	
	
	% Processing the character to become ready as an input for Neural Network
	if ~((~status_b)&&(status_f))
		
		% Place the character in 45x45 resolution image
		if size(n1,1)>size(n1,2)
			value = 45/size(n1,1);
		else
			value = 45/size(n1,2);
		end
		B = imresize(n1,value);
		frame = logical(zeros(45,45));
		dist_r = int8((45-size(B,1))/2)+1; dist_c = int8((45-size(B,2))/2)+1;
		dist_r_t = dist_r+size(B,1)-1; dist_c_r = dist_c+size(B,2)-1;
		frame(dist_r:dist_r_t,dist_c:dist_c_r) = B;
		
		% Create output matrix for Neural Network
		C = ~frame;
        %%C = imerode(C,[1 1;1 1]);		
		output = [output, C(:)];
		
		% Create image file for each segmented character
		%
		%imshow(C);
		%name = sprintf('%d.jpg',m);
		%imwrite(C,name);
		%}
		
		m = m + 1;
	end

end