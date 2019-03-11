function [bool,index] = inDictionary(dict,str)
    if size(dict,1)>1
        for i=1:size(dict,1)
            if strcmp(str,dict{i,2})
                bool=1;
                index=dict{i,1};
                break;
            end
        end
        if i==size(dict,1)
            bool=0;
            index=-1;
        end
    else
       if strcmp(str,dict{1,2})
                bool=1;
                index=dict{1,1};
       else
           bool=0;
           index=-1;
       end
    end
end