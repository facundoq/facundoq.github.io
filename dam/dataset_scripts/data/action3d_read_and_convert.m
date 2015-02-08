function gestures=action3d_read_and_convert(folder,whitelist, print)
% read database files from folder containing MSRAction3d gestures and convert to
% standard format

JOINTS=20;

files_and_folders=dir(folder);
% remove folders
filenames=files_and_folders(not([files_and_folders.isdir]));
filenames= sort({filenames.name});
%get and sort filenames, so that each .csv is next to its corresponding .tagstream
filename_count=length(filenames);

ignored=0;

gestures=[];
% read each gesture file
for i=1:filename_count
    filename=filenames{i};    
    if print
        fprintf(['Reading file ' filename ' (' num2str(i) '/' num2str(filename_count) ') ... ']);
    end
    gesture=load([folder '\' filename]);
    
    rows=size(gesture,1);    
    error_if( mod(rows,JOINTS)>0 ,'The number of rows should be a multiple of 20');
    if print
        fprintf([ num2str(rows/JOINTS) ' frames loaded.\n']);
    end

    [class,person,instance]=action3d_gesture_info_from_filename(filename);
    
    % check if gesture is in whitelist
    gesture_id=[class,person,instance];
    if (ismember(gesture_id,whitelist,'rows'))
        %convert to standard format and add to struct vector gestures
        gesture=action3d_convert(gesture,class,person,instance,i);
        gestures=[gestures gesture];
    else
        ignored=ignored+1;
        fprintf('Gesture %d was not in the whitelist (class %d, subject %d, instance %d) \n',i,class,person,instance);
    end
end


fprintf('Read %d gesture files, ignored %d -> %d gestures in database\n', filename_count,ignored,filename_count-ignored );

function [class,person,instance] = action3d_gesture_info_from_filename(filename)
    split=sscanf(filename,'a%d_s%d_e%d_skeleton3D.txt');
    error_if( not(length(split)==3),'Wrong filename format.');
    class=split(1);
    person=split(2);
    instance=split(3);
