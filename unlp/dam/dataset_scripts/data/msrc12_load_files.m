function [xs,tagset]=msrc12_load_files(folder, separators_folder,discard_zero_frames)
%load all the gesture files in a given folder and generate an array of
%structs so that each represents a segmented gesture.
% the separators_folder containts the annotations necessary for the
% segmentation of the actions.
% the structure of each gesture is described in function generate_gestures
% returns:
%   xs: the struct array of gestures
%   tagset: a cellarray containing the names of each gesture class, indexed
%   by class index.

files_and_folders=dir(folder);
% remove folders
files=files_and_folders(not([files_and_folders.isdir]));
%get and sort filenames, so that each .csv is next to its corresponding .tagstream
filenames=sort({files.name});
filename_count=length(filenames);
% error if a csv doesn't have a tagstream or viceversa
error_if(mod(filename_count,2)>0,'There should be an even number of files'); 

gesture_files=filename_count/2; % true number of gesture files

% put each (csv,tagstream) filename in a column of a 2-by-gestures matrix
names=reshape(filenames, 2,gesture_files);
xs=[];
% read each gesture file
for i=1:gesture_files
    % check if the names of the files (without extension) are the same
    csv_name=strtok(names{1,i},'.');
    tagstream_name=strtok(names{1,i},'.');
    error_if( not(strcmp(tagstream_name,csv_name)),'There should be a pair of csv and tagstream files');
    separators=load([separators_folder csv_name '.sep']);
    fprintf(['Reading file ' csv_name ' (' num2str(i) '/' num2str(gesture_files) '),' num2str(size(separators,1)) 'gestures ... ']);
    %load file
    [x,y,tagset]=msrc12_load_file(csv_name,false);
    fprintf([ num2str(size(x,1)) 'frames loaded.\n']);
    %remove 1's separating fields
    columns=(1:20)*4;
    x(:,columns)=[];
    [id,person]=strtok(csv_name,'p');
    person=str2double(person(2:3));
    gestures=msrc12_generate_gestures(x,y,separators,person);
    
    %add to cell vector
    xs=[xs gestures];
    if (i>3)
        %break;
    end
end
