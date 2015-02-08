function gestures=msrc12_generate_gestures(x,y,separators,person)
%separates the gestures in the stream x according to separators,
% and generates a struct array of gesture structs,
% such that each struct contains fields:
%  x=joint information for each frame of the gesture
%  y= class index of the gesture
%  detection_frame= frame in which the gesture should be detected
%  person= person who performed the gesture

gestures=[];
for i=1:size(separators,1)
    slice=separators(i,:);
    gesture.x=x(slice(1):slice(2),:);
    gesture.person=person;
    gesture_y=y(slice(1):slice(2),:);
    [detection_frame,class]=find(gesture_y);
    gesture.y=class;
    gesture.detection_frame=detection_frame;
    gestures{i}=gesture;
end

gestures=cell2mat(gestures);