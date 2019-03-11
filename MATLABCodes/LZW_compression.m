clc;
clear all;

%counters
x=1;
dictCounter=256;
d=1;

%file input
fileID = fopen('../data.txt','r');
a = fscanf(fileID,'%s');
fclose(fileID);
fileLength = length(a)*8;


%output array
output=[];

%init
p=a(x);
c=a(x+1);
string =[p,c];
output=[output,dec2bin(double(p),12)];
dict{d,1} = dictCounter;
dict{d,2} = string;
dictCounter= dictCounter+1;
x=x+1;
d=d+1;
p=c;


while x<length(a)
    c=a(x+1);    
    disp(['current: ',p,'    Next: ',c]);
    string=[p,c];
    [bool,index] = inDictionary(dict,string);
    if bool
        disp(['MatchFound for: ',string, 'at: ', num2str(index)]);
        p=string;
    else
        disp(['adding: ',p]);
        if length(p)==1
            output=[output,dec2bin(double(p),12)];
        else
            [bool,index] = inDictionary(dict,p);
            output=[output,dec2bin(double(index),12)];
        end
        
        if dictCounter ~= 4096
            dict{d,1} = dictCounter;
            dict{d,2} = string;
            dictCounter = dictCounter+1;
            d=d+1;
        end
        p=c;
    end
    x=x+1;
end

if length(p)==1
    disp(['p: ', p]);
    output=[output,dec2bin(double(p),12)];
else
    [bool,index] = inDictionary(dict,p);
    output=[output,dec2bin(double(index),12)];
end

for i=1:12:length(output)
    
    ce{floor(i/12)+1} = ['Decimal: ',num2str(bin2dec(output(i:i+11)))];
    disp(ce{floor(i/12)+1});
    disp(['Binary: ',output(i:i+11),'    Decimal: ',num2str(bin2dec(output(i:i+11)))]);
end

fileID = fopen('output.txt','w');
for i=1:12:length(output)
    fprintf(fileID,'%s',output(i:i+11));
    fprintf(fileID,'\n');
end
fclose(fileID);

compressedLength = length(output);

Compression = 100*(1-(compressedLength/fileLength));
disp(['fileLength: ',num2str(fileLength)]);
disp(['CompressedLength: ',num2str(compressedLength)]);
disp(['Compression: ',num2str(Compression),'%']);