%% 
%% Funtion name : matrix_generation
%% Description  : Converting dataset cell into suitable input matrix for Neural Network 
%% Input        : Dataset cell
%% Output       : Dataset matrix
%%                row: no. of pixcel | column: no. of images
%% Compiler     : MATLAB
%% 
%%  
%% Reference    : none
%% Created by   : Bobbi W. Yogatama
%% Date Created : 3 December 2017
%% Institution  : Bandung Institute of Technology
%% 
%% Revision     : 1
%% 

%% Variable Declaration
i=1;j=1;k=1;
input_2828=[];    % Matrix for images with 28x28 resolution <type : single>
input_4545=[];    % Matrix for images with 45x45 resolution <type : single>
input_uint8 = []; % Matrix for images with 45x45 resolution <type : unsigned integer 8 bit>
target=[];        % Matrix for target value for each image  <type : single>

%% Matrix Generation
for i=1:length(arr)
    for j=1:arr(i)
		temp_uint8 = uint8(cell2mat(img(k)));      % Read image 
		temp_si = single(im2double(temp_uint8));   % converting to single type intensity
        temp_4545 = im2bw(temp_si, 0.5);		   % thresholding
		temp_2828 = imresize(temp_4545, 0.622);    % resize to 28x28 resolution
		input_uint8 =[input_uint8,temp_uint8(:)];  % matrix generation for matrix type integer
        input_4545=[input_4545,temp_4545(:)];      % matrix generation for matrix type single 45x45 res
		input_2828=[input_2828,temp_2828(:)];      % matrix generation for matrix type single 28x28 res
        
		% Matrix target generation
		z=zeros(length(arr),1);
        z(i)=1;
        target=[target,z];
        
		% Progress display
		k=k+1;
		msg = sprintf('progress = %d', k);
    end
end

%% Save the matrix
save('data.mat','input_4545', 'input_2828', 'input_uint8','target');

    