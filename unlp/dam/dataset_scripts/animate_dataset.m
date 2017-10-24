clc;
clear;
addpath(genpath('.'));
%rng('shuffle');
tic;

%% Load data
fprintf('Reading data...\n');

%dataset='action3d_fix';
dataset='msrc12';
%dataset='mhad_n128';
data=load(['datasets/' dataset '.mat']);
tags=data.tags;
gestures=data.gestures;
gestures=gestures';

%% animate all gestures
%feos=[4 5 46 58 59 109 110 111  189 190 191 218 219 220 223 248:253 278:283 312 313 442 447 478 501 510 ];


%selection=find(and([gestures.person]==5,[gestures.y]<=5) );
selection=1:1:length(gestures);

% raros: 4 (1,2,3)

for i=4
    label=sprintf('%d/%d - (C,S,I) = (%d,%d,%d)',i,length(gestures),gestures(i).y,gestures(i).person,gestures(i).instance);
    disp(label);
   animate_gesture(gestures(i),tags,1/150,label); 
   %pause;
end




