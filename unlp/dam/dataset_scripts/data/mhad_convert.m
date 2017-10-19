function gesture=mhad_convert(data,class,person,instance,id)


% get timestamps
timestamps=data(:,end);
% remove timestamps and frame number (last 2 columns)
x=data(:,1:end-2);
x=smooth_gesture(x,5);
x=resample_gesture(x,128);
% generate struct
gesture.x=x;
gesture.person=person;
gesture.y=class;
gesture.detection_frame=-1;
gesture.instance=instance;
gesture.id=id;
gesture.timestamps=timestamps;