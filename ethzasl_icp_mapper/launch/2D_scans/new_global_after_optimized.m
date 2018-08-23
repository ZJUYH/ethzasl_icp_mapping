for i=1:length(Pose)

    %1
     r = eul2rotm([Pose(i,4),0,0]);

    % 2
%     r = angle2dcm(Pose(i,4),0,0, 'ZYX');

     rt = [r(1,:), Pose(i,2); r(2,:), Pose(i,3); r(3,:), 0; 0,0,0,1];
    
    SiaSun_pose(i,:) = [rt(1,:), rt(2,:), rt(3,:), rt(4,:)];
    
end

dlmwrite('/home/yh/uts_2d/Siasun_global_poses.txt', SiaSun_pose, 'delimiter', ' ');