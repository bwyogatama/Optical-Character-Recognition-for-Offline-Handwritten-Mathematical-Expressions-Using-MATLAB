%% 
%% Funtion name : toplevel
%% Description  : Highest level of mathematical expression recognition system 
%% Input        : none
%% Output       : none
%% Compiler     : MATLAB
%% 
%%  
%% Reference    : none
%% Created by   : - Jhonson Lee
%%                - Bobbi W. Yogatama
%%                - Hans Christian
%% Date Created : 3 December 2017
%% Institution  : Bandung Institute of Technology
%% 
%% Revision     : 1
%% 

%% List of variables
%% file_name : Image file name to be processed              <Type: string>
%% in_NN     : Matrix of character image                    <Type: Matrix of double>
%%             row: no. of pixcel | column: no. of character
%% m 		 : Vector of equation codes                     <Type: vector of integer>
%% result    : Calculation result for equation given        <Type: double>



clc;
clear all;

% Equation image acquisition
file_name = 'Capture3.PNG';

% Character Extraction
in_NN = segmentation(file_name);

% Character Identification
m = identify(in_NN);

% Equation Calculation
 result = mathoperator(m);
%result = 0;

% Result & Equation Display on command window
displayeqn(m,result);