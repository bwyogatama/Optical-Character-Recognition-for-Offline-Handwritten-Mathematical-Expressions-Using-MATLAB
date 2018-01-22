%% 
%% Funtion name : dataset_acquisition
%% Description  : Read dataset images in specific folder 
%% Input        : dataset images
%% Output       : cell containing dataset images
%% Compiler     : MATLAB
%% 
%%  
%% Reference    : MathWorks Repository | scene_identification.m
%% Source       : http://www.mathworks.com/matlabcentral/mlc-downloads/downloads/submissions/62193/versions/1/previews/Scene_Identification.m/index.html?access_key=
%% Modified by  : Bobbi W. Yogatama
%% Date Created : 3 December 2017
%% Institution  : Bandung Institute of Technology
%% 
%% Revision     : 1
%% 

%% Read Image
imds = imageDatastore('C:\Users\Jhonson Lee\Desktop\Neural Network\NN Matlab\NN 14 Classes\Dataset\','IncludeSubfolders',true,'LabelSource','foldernames');
tbl=countEachLabel(imds);
img=readall(imds);
tbl1=tbl(:,2);
arr=table2array(tbl1);