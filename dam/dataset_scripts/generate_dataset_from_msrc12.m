clc;
clear all;
addpath(genpath('../'));

[gestures,tags]=msrc12_load_files('dbs\MSRC_12\data','dbs\MSRC_12\data\separators\');

%% Save database to file

save('msrc12.mat', 'gestures','tags');

%% Visualize gestures

%gesture_to_show=25;
%animate_gesture(gestures(gesture_to_show),tags,1/30);
