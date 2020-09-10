clc;
clear all;
addpath(genpath('.'));
base_folder='dbs\MSR_Action3D\';
folder=[base_folder 'gestures'];

whitelist=load([base_folder 'JiangExperimentFileList.txt']);

gestures=action3d_read_and_convert(folder, whitelist, false);

tags={ 'high arm wave', 'horizontal arm wave', 'hammer', 'hand catch', 'forward punch'... 
        'highthrow', 'draw x', 'draw tick', 'draw circle', 'hand clap',...
        'two hand wave', 'side-boxing','bend', 'forward kick', 'side kick', ...
        'jogging', 'tennisswing', 'tennisserve','golfswing', 'pickup and throw'};

%% fix    
% arreglar rodillas y pies
gestures=action3d_fix_knees_subject2(gestures);
gestures=action3d_fix_subject3(gestures);
 % remover gestos defectuosos
gestures = action3d_remove_corrupt(gestures);
    
%% guardar BD
save('action3d_fix.mat', 'gestures','tags');

%% Split datasets to generate AS1, AS2 and AS3

AS1=[2,3,5,6,10,13,18,20];
AS2=[1,4,7,8,9,11,12,14];
AS3=[6,14,15,16,17,18,19,20];
AS=[AS1;AS2;AS3];
gestures_all=gestures;
classes=[gestures.y];
for i=1:3
    ASi=AS(i,:);
    gestures=gestures_all(ismember(classes,ASi));
    filename=['action3dAS' num2str(i) '_fix.mat'];
    save(filename, 'gestures','tags');
    fprintf('Action Set %d generated with %d gestures (file: %s)\n',i,length(gestures),filename);
end
gestures=gestures_all;

%% animate
% for i=1:10:length(gestures)
%     animate_gesture(gestures(i),tags,0.033);
% end