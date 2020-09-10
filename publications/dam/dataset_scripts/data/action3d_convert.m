function gesture=action3d_convert(data,class,person,instance,id)
% remove joint estimation confidence score
data = data(:,1:3);

%joint_order=[01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20]; %default
 joint_order=[05 09 03 02 13 17 01 06 10 07 11 08 12 14 18 15 19 16 20 04];
 
JOINTS=20;
rows=size(data,1);
frames=rows/JOINTS;
x=[];
% turn each row of the gesture into a frame (ie, put all the joint info of
% a frame in the same row)

for i=1:frames
    start_row=(i-1)*JOINTS+1;
    end_row=start_row+JOINTS-1;
    frame=data(start_row:end_row,:);
    frame = reshape(frame',1,[]);
    frame=reorder_joints(frame,joint_order);
    x=[x; frame];
end




gesture.x=x;
gesture.person=person;
gesture.y=class;
gesture.detection_frame=-1;
gesture.instance=instance;
gesture.id=id;