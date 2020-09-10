function new_gestures=discard_gestures_with_few_frames(gestures,minimum_number_of_frames)
new_gestures=[];
for i=1:length(gestures)
    gesture_frames=size(gestures(i).x,1);
    if (gesture_frames > minimum_number_of_frames)
        new_gestures=[new_gestures gestures(i)];
    else
        fprintf('Warning: discarding gesture %d because it has too few frames( %d frames, minimum: %d frames)\n',i,gesture_frames,minimum_number_of_frames);
    end
end
