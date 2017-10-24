function F=fscore(estimated,true)

    %missing=setdiff(true,estimated);
    %added=setdiff(estimated,true);
    correct=intersect(estimated,true);
    if isempty(estimated)
        precision= 0;
    else
         precision= length(correct)/length(estimated);
    end
    
    recall= length(correct)/length(true);
    
if (precision+recall < 0.1)
    F=0;
else
    F= 2* precision*recall/(precision+recall);
end