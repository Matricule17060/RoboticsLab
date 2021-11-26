function  [alphaf , betaf , gammaf, alphab , betab , gammab] = processing(tet1 , tet2 , tet3 ,tet4 , color , fig)
  
  dof = 4; % degrees of freedom
  a2 = 14.6;
  a3 = 18.7;
  a4 = 8.6 ;
  
  param = [a2 , a3 , a4 , tet1 , tet2 , tet3 , tet4];

  % Generate the global DH table
  table = dh_table(param);

  % Generate the 4 DH matrix (and put into m)
  for k = 0 : dof - 1
      m(: , 4*k+1 : 4*(k+1)) = dh_matrix(table(k+1,:));
  end


  % Generate the global transformation matrix
  M = eye(4);
  for k = dof-1 : -1 : 0
      M = M * m(: , 4*k+1 : 4*(k+1));
  end
  
  robot_plotter2(param , color ,fig);

end
