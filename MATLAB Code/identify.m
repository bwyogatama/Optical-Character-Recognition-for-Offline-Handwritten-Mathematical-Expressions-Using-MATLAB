%% 
%% Funtion name : identify
%% Description  : Identify every single input caharacter image 
%% Input        : Matrix containing character images
%% Output       : Vector containing character codes
%% Compiler     : MATLAB
%% 
%%  
%% Reference    : none
%% Modified by  : - Jhonson Lee 
%%                - Hans Christian
%% Date Created : 3 December 2017
%% Institution  : Bandung Institute of Technology
%% 
%% Revision     : 1
%% 

function [m] = identify(image)
%% Input  : Matrix containing character images 
%% Output : Vector containing character codes

%% Identification with Neural Network 
load('neuralnet.mat');
output = net(image);

%% Convert Neural Network Output Format to Associated Code
[L,ii]=max(output);

%% Ouput vector generation containing a series of codes
m=ii; 

%% Verification Panel
%{
n=1:size(L,2); %kolom ke
for i = 1:max(size(m))
    switch m(i)
        case 1
            disp('0');
        case 2
            disp('1');
        case 3
            disp('2');
        case 4
            disp('3');
        case 5
            disp('4');
        case 6
            disp('5'); 
        case 7
            disp('6'); 
        case 8
            disp('7'); 
        case 9
            disp('8'); 
        case 10
            disp('9'); 
		case 11
            disp('+');
		case 12
            disp('-');
		case 13
            disp('x');
		case 14
            disp(':');
    end
%}
    
end
