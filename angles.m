function [alpha,beta,gamma] = angles(M)
    az = M(3,3);
    oz = M(3,2);
    nx = M(1,1);
    ny = M(2,1);
    nz = M(3,1);
    
    alpha = NaN; % Default value 
    beta = atan2(-nz,sqrt(1 - nz^2));
    gamma = NaN; % default value
    
    if beta ~= 0
        alpha = atan2(oz/cos(beta) , az/cos(beta));
        gamma = atan2(ny/cos(beta) , nx/cos(beta));
    end
end