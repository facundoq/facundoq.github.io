function gestures=mhad_read_and_convert(folder, print)
% read database files from folder containing mhad gestures and convert to
% standard format
JOINTS=43;

files_and_folders=dir(folder);
% remove folders
filenames=files_and_folders(not([files_and_folders.isdir]));
filenames= sort({filenames.name});
filename_count=length(filenames);


% put each (csv,tagstream) filename in a column of a 2-by-gestures matrix
gestures=[];
% read each gesture file
for i=1:filename_count
    filename=filenames{i};    
    if print
        fprintf(['Reading file ' filename ' (' num2str(i) '/' num2str(filename_count) ') ... ']);
    end
    gesture=load([folder '\' filename]);
    
    columns=size(gesture,2);    
    expected_columns=JOINTS*3+2;
    error_if( not(columns==expected_columns) ,['The number of columns should be: ' num2str(expected_columns)]);
    if print
        fprintf([ num2str(size(gesture,1)) ' frames loaded.\n']);
    end
    
    [class,person,instance]=mhad_gesture_info_from_filename(filename);
    %convert to standard format and add to struct vector gestures
    gesture=mhad_convert(gesture,class,person,instance,i);
    gestures=[gestures gesture];
end


fprintf('Read %d gesture files\n', filename_count );

function [class,subject,instance] = mhad_gesture_info_from_filename(filename)
    split=sscanf(filename,'moc_s%d_a%d_r%d.txt');
    error_if( not(length(split)==3),'Wrong filename format.');
    subject=split(1);
    class=split(2);
    instance=split(3);
