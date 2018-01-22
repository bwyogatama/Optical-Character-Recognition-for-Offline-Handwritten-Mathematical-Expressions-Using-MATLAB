%% 
%% Funtion name : displayeqn
%% Description  : Display the equation and its calculation result 
%%                on command window MATLAB
%% Input        : vector of codes and calculation result
%% Output       : none
%% Compiler     : MATLAB
%% 
%%  
%% Reference    : none
%% Modified by  : - Hans Christian
%%                - Jhonson Lee
%% Date Created : 3 December 2017
%% Institution  : Bandung Institute of Technology
%% 
%% Revision     : 1
%% 

function displayeqn(m, result)
%% Input  : m = vector of equation codes
%%          result = calculation result
%% Output : none

%% Verification Panel
% m = [3 2 11 4 12 10 15 3 12 6 20 2 13 21]
%m

%% Output Text Generation
str='';
for i = 1:max(size(m))
    switch m(i)
        case 1
            str=strcat(str,'0');
        case 2
            str=strcat(str,'1');
        case 3
            str=strcat(str,'2');
        case 4
            str=strcat(str,'3');
        case 5
            str=strcat(str,'4');
        case 6
            str=strcat(str,'5');
        case 7
            str=strcat(str,'6');
        case 8
            str=strcat(str,'7');
        case 9
            str=strcat(str,'8');
        case 10
            str=strcat(str,'9');
        case 11
            str=strcat(str,'+');
        case 12
            str=strcat(str,'-');
        case 13
            str=strcat(str,'*');
        case 14
            str=strcat(str,'/');
        case 15
            str=strcat(str,'^');
        case 16
            str=strcat(str,'(');
        case 17
            str=strcat(str,')');
        case 18
            str=strcat(str,'3.1415');
        case 19
            str=strcat(str,'2.7183');
        case 20
            str=strcat(str,'==');
        case 21
            str=strcat(str,'x');
    end
end

%% Display on command window
str=strcat('Equation :   ',str);
disp(str);
msg = sprintf('Result   : %f', result');
disp(msg);


