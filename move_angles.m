function move_angles(tet1 , tet2 , tet3 ,tet4 , color , fig)
  
% PART 0 : Robots parameters
  
  dof = 4; % degrees of freedom
  a2 = 14.6;
  a3 = 18.7;
  a4 = 8.6 ;
  
  param = [a2 , a3 , a4 , tet1 , tet2 , tet3 , tet4];
  
% PART 1 : calculate gripper coordinates from Denavit Hartenberg matrix
  
  [XG_dh , YG_dh , ZG_dh] = gripper_position_forward_DH(param, dof)

% PART 2 : calculate gripper position from trigonometric equations
  [XG_trigo , YG_trigo , ZG_trigo] = gripper_position_forward_trigo (a2 , a3 ,a4 ,tet1 , tet2 , tet3 , tet4)
  
% PART 3 : Animated deplacement of the Robot
  robot_plotter_animated_forward_kinematics(param , color ,fig, XG_dh , YG_dh , ZG_dh);

end
