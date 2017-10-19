function gestures = action3d_fix_knees_subject2(gestures)
subject2_switched_knees=find(and([gestures.person]==2,[gestures.y]<13) );

KNEE_LEFT_INDEX=14;
KNEE_RIGHT_INDEX=18;
KNEE_LEFT=(KNEE_LEFT_INDEX-1)*3;
KNEE_RIGHT=(KNEE_RIGHT_INDEX-1)*3;
% swap the joints (LEFT and RIGHT) of all those gestures with switched knees
fprintf('Actions fixed (class,person,instance):\n');
for i=subject2_switched_knees
    x=gestures(i).x;
    temp=x(:,KNEE_LEFT:KNEE_LEFT+8);
    x(:,KNEE_LEFT:KNEE_LEFT+8)=x(:,KNEE_RIGHT:KNEE_RIGHT+8);
    x(:,KNEE_RIGHT:KNEE_RIGHT+8)=temp;
    gestures(i).x=x;
    fprintf('%d,%d,%d\n',gestures(i).y,gestures(i).person,gestures(i).instance);
end

end