function new_frame=reorder_joints(frame,joint_order)
JOINTS=length(joint_order);
new_frame=zeros(1,length(frame));
for i=1:JOINTS
    old_start=(i-1)*3+1;
    old_end=old_start+2;
    new_start=(joint_order(i)-1)*3+1;
    new_end=new_start+2;
    new_frame(1,new_start:new_end)=frame(1,old_start:old_end);
end