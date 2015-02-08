clc;
clear all;
addpath(genpath('.'));
%folder='..\dbs\MHAD\samples\';
folder='D:\dev\gestures\mhad\'; % gestos en la compu de facu
print=true;
gestures=mhad_read_and_convert([folder 'data\'],print);

tags={ 'jumping in place','jumping jacks','bending - hand up all the way down',...
    'Punching (boxing)','Waving - two hands','Waving - one hand (right)',...
    'Clapping hands','Throwing a ball','Sit up then stand up',...
    'Sit down','Stand up','T-pose'};

%save('datasets\mhad.mat', 'gestures','tags');

save([folder 'mhad.mat'], 'gestures','tags');