function [ transformed ] = globalToRelative( savedGlobalPoses )
%GLOBALTORELATIVE Summary of this function goes here
%   Detailed explanation goes here

    realations = savedGlobalPoses(:,1:2);
    globalPoses = savedGlobalPoses(:,3:end);
    
    for i=1:length(globalPoses)
        
       globalCells{i} = [globalPoses(i, 1:3); globalPoses(i, 4:6); globalPoses(i, 7:end)];
        
    end
    
    % transform
    for i=1:length(globalCells)
        
        if i == 1
            relatives(i, :) = [globalCells{i}(1,:), globalCells{i}(2,:), globalCells{i}(3,:)];
        else
            relativeM = inv(globalCells{i}) *globalCells{i-1};
            relatives(i, :) = [relativeM(1,:), relativeM(2,:), relativeM(3,:)];
        end
                    
    end
    
    transformed = [realations, relatives];
    
end

