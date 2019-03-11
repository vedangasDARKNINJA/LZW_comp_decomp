clc ;
clear all;

fileID = fopen('output.txt','r');
a=bin2dec(num2str(fscanf(fileID,'%12lu')));


output=[];


x=1;
d=1;
dictCounter=256;
p=char(a(x));
c=char(a(x+1));
string=[p,c];
dict{d,1} = dictCounter;
dict{d,2} = string;
output=[output,p];
p=c;
d=d+1;
dictCounter=dictCounter+1;

x=x+1;


while x<length(a)
    if a(x+1)<255
        c= char(a(x+1));
    else
        c=dict{a(x+1)-255,2};
    end
    disp(num2str(dictCounter));
    disp(c);
    string = [p,c(1)];
    [bool,index] = inDictionary(dict,string);
    if bool
        p=string;
    else
        output = [output,p];
        dict{d,1} = dictCounter;
        dict{d,2} = string;
        dictCounter = dictCounter+1;
        d=d+1;
        p=c;
    end
    
    x=x+1;
end  
output=[output,p];

disp(output);