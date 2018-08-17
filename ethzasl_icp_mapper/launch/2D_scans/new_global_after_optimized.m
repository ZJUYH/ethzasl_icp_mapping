for i=1:length(SiasunPG)
    
    r = eul2rotm([SiasunPG(i,4),0,0]);
    r=inv(r);
    rt = [r(1,:), -SiasunPG(i,2); r(2,:), SiasunPG(i,3); r(3,:), 0; 0,0,0,1];
%          rt = inv(rt);
    
    SiaSun_pose(i,:) = [rt(1,:), rt(2,:), rt(3,:), rt(4,:)];
    
end

dlmwrite('/home/yh/uts_2d/Siasun_global_poses.txt', SiaSun_pose, 'delimiter', ' ');