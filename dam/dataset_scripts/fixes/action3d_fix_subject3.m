function gestures = action3d_fix_subject3(gestures)

% indices of gestures with switched knees of subject 3
subject3_switched_knees=[448 449]; 
% indices of gestures with switched feet of subject 3
subject3_switched_feet=[ 8 9  223   251   252   253   281   282   283   311]; 


%% KNEE ANKLE AND FEET
% swap the joints (LEFT and RIGHT) of all those gestures with switched knees
LEFT_INDEX=14;
RIGHT_INDEX=18;
LEFT=(LEFT_INDEX-1)*3;
RIGHT=(RIGHT_INDEX-1)*3;

for i=subject3_switched_knees
    x=gestures(i).x;
    temp=x(:,LEFT:LEFT+8);
    x(:,LEFT:LEFT+8)=x(:,RIGHT:RIGHT+8);
    x(:,RIGHT:RIGHT+8)=temp;
    gestures(i).x=x;
end


%% ANKLE AND FEET
% swap the joints of all those gestures with switched knees
LEFT_INDEX=15;
RIGHT_INDEX=19;
LEFT=(LEFT_INDEX-1)*3;
RIGHT=(RIGHT_INDEX-1)*3;
fprintf('Actions fixed (class,person,instance):\n');
for i=subject3_switched_feet
    x=gestures(i).x;
    temp=x(:,LEFT:LEFT+5);
    x(:,LEFT:LEFT+5)=x(:,RIGHT:RIGHT+5);
    x(:,RIGHT:RIGHT+5)=temp;
    gestures(i).x=x;
    fprintf('%d,%d,%d\n',gestures(i).y,gestures(i).person,gestures(i).instance);
end

end