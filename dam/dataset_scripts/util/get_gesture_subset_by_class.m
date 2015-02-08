function [gestures]= get_gesture_subset_by_class(gestures, classes)
% se genera un subset con los gestos que correspondan con las clases
% pasadas como argumento
% classes es un array que indica las clases que serán tomadas en cuenta

gestures_classes= [gestures().y];
gestures_aux=[];
%por cada clase
for c= 1:length(classes)
    indexs_c= gestures_classes==classes(c); % indices de la clase c
    gestures_aux= [gestures_aux gestures(indexs_c)]; %tomar los gestos de esta clase
end
gestures= gestures_aux;