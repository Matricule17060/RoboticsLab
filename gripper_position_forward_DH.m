function [XG_dh , YG_dh , ZG_dh] = gripper_position_forward_DH (param , dof)
  % Generate the global DH table
  table = dh_table(param);

  % Generate the 4 DH matrix (and put into m)  
  for k = 0 : dof - 1
      m(: , 4*k+1 : 4*(k+1)) = dh_matrix(table(k+1,:));
  end
  
  % display the 4 matrix
  m
  
  % Generate the global transformation matrix
  M = eye(4);
  for k = 0 : dof-1
      % m1 * m2 * m3 * m4
      M = M * m(: , 4*k+1 : 4*(k+1));
  end
  
  M
  
  XG_dh = M(1,4);
  YG_dh = M(2,4);
  ZG_dh = M(3,4);
end
