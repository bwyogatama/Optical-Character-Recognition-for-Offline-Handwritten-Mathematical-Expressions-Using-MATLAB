%% 
%% Funtion name : mathoperator
%% Description  : Conducting calculation on equation given 
%% Input        : vector of equation codes
%% Output       : calculation result
%% Compiler     : MATLAB
%% 
%%  
%% Reference    : none
%% Created by   : - Hans Christian
%% Date Created : 3 December 2017
%% Institution  : Bandung Institute of Technology
%% 
%% Revision     : 1
%% 

function finalresult = mathoperator(m)
%% Input  : m = vector of equation codes
%% Output : finalresult = calculation result

%% Verification Input
% m = [3 13 19 11 4 12 10 15 3 12 6 11 18 20]


if m(max(size(m)))~=20
    m(max(size(m))+1)=20;
end
%m = [ 3 13 19 11 4 14 10 15 3 12 6 11 18 20]
count=1;
postemp1=0;
for i = 1:max(size(m))
    if(m(i)==18)
        m(i)=pi+1;
    elseif(m(i)==19)
        m(i)=2.7183+1;
    end
end
%m
for i = 1:max(size(m))
    if m(i)>10
        postemp2=i;
        multiplier=1;
        resulttemp=0;
        for j = postemp2-1:-1:postemp1+1
            x=(m(j)-1)*multiplier;
            resulttemp=resulttemp+x;
            multiplier=multiplier*10;
        end
        n(count)=resulttemp;
        n(count+1)=m(i);
        count=count+2;
        postemp1=postemp2;
    end
end
%n
%%
for i=1:((max(size(n))/2)-1)
    switch n(2*i)
        case 15
            hasiltemp=n(2*i-1)^n(2*i+1);
            n(2*i+1)=hasiltemp;
            if (2*i<3)
                n(2*i)=11;
            else
                n(2*i)=n(2*i-2);
            end
            if (n(2*i)==13)||(n(2*i)==14)
                n(2*i-1)=1;
            else
                n(2*i-1)=0;
            end
    end
end
for i=1:((max(size(n))/2)-1)
    switch n(2*i)
        case 13
            hasiltemp=n(2*i-1)*n(2*i+1);
            n(2*i+1)=hasiltemp;
            if (2*i<3)
                n(2*i)=11;
            else
                n(2*i)=n(2*i-2);
            end
            n(2*i-1)=0;
        case 14
            hasiltemp=n(2*i-1)/n(2*i+1);
            n(2*i+1)=hasiltemp;
            if ((2*i)<3)
                n(2*i)=11;
            else
                n(2*i)=n(2*i-2);
            end
            n(2*i-1)=0;
    end
end
for i=1:((max(size(n))/2)-1)
    switch n(2*i)
        case 11
            hasiltemp=n(2*i-1)+n(2*i+1);
            n(2*i+1)=hasiltemp;
        case 12
            hasiltemp=n(2*i-1)-n(2*i+1);
            n(2*i+1)=hasiltemp;
    end
end

%% Calculation result generation
finalresult=n(max(size(n))-1);