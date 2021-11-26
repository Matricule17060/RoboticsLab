function robot_plotter_static(Param , col , fig)
  param = num2cell(Param);
  [a2 , a3 , a4 , tet1 , tet2 , tet3 , tet4]= deal(param{:});
    
  %Base
  x0 = 0;
  y0 = 0;
  z0 = 0;
    
  % Shoulder
  x1 = 0;
  y1 = 0;
  z1 = 6.3; 
  
  % Elbow
  x2 = a2 *cosd(tet2) *cosd(tet1);
  y2 = a2 *cosd(tet2) *sind(tet1);
  z2 = z1 + a2 *sind(tet2);
  
  % Wrist
  x3 = (a2 *cosd(tet2) + a3 *cosd(90-tet3)) *cosd(tet1);
  y3 = (a2 *cosd(tet2) + a3 *cosd(90-tet3)) *sind(tet1);
  z3 = z2 + a3 *sind(90-tet3);
  
  % Gripper
  x4 = (a2 *cosd(tet2) + a3 *cosd(90-tet3) + a4 *cosd(tet4)) *cosd(tet1);
  y4 = (a2 *cosd(tet2) + a3 *cosd(90-tet3) + a4 *cosd(tet4)) *sind(tet1);
  z4 = z3 + a4 *sind(tet4);
  
  % Gripper plot
  figure(fig), hold on
  plot3(x4,y4,z4 ,'k*'), 
  
  % Segments plot
  line([x0,x1],[y0,y1],[z0,z1] , 'Color',col,'LineStyle','-'),
  line([x1,x2],[y1,y2],[z1,z2] , 'Color',col,'LineStyle','-'),
  line([x2,x3],[y2,y3],[z2,z3] , 'Color',col,'LineStyle','-'),
  line([x3,x4],[y3,y4],[z3,z4] , 'Color',col,'LineStyle','-');
  grid on , grid minor, axis equal,
end