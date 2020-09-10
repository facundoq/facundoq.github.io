function [ xs,ys, gesture_names] = read_gestures(filepath)

f = fopen(filepath);
if f==-1
    error(['Couldn''t open ',filepath]);
end

i=1;
while ~feof(f)
    l = fgetl(f);
    data=string_split(l, ',');
    names{i}= data{1};
    gs=[];
    
    elements=(length(data)-3)/3;
    for j=1:elements
        base=(j-1)*3+3;
        element=[ str2double(data{base+1})
                  str2double(data{base+2})
                  str2double(data{base+3})
                ];
        gs(:,j)= element;
    end;
    xs{i}=gs;
    ys(i)=str2double( data{2})+1;
    i=i+1;
end
fclose(f);
ys=squeeze(ys');
xs= squeeze(xs');
% f=fopen(filepath);
% names= textscan(f,'%s %*[^\n]','delimiter',',');
% fclose(f);
% names=names{1};
gesture_names= unique(names);

end

