function [x,y,z] = gripper_position_forward_trigo (a2 , a3 , a4 , tet1 , tet2 , tet3 , tet4)
  
    x = (a2 *cosd(tet2) + a3 *cosd(tet3 + tet2) + a4 *cosd(tet4 + tet3 + tet2)) *cosd(tet1);
    y = (a2 *cosd(tet2) + a3 *cosd(tet3 + tet2) + a4 *cosd(tet4 + tet3 + tet2)) *sind(tet1);
    z = 6.3 + a2 *sind(tet2) + a3 *sind(tet3 + tet2) + a4 *sind(tet4 + tet3 + tet2);
end