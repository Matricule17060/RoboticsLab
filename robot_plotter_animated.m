function robot_plotter_animated(Param , col , fig)
  
  param = num2cell(Param);
  [a2 , a3 , a4 , teta1 , teta2 , teta3 , teta4]= deal(param{:});
  
  teta_max = max([teta1 , teta2 , teta3 , teta4]); % donne le nombre de pas à réaliser
  l_max    = a2 + a3 + a4;                         % determine les dimensions du graphe
  
  %Computer coordinates
  
  tet1 = linspace(0 , teta1 , teta_max);
  tet2 = linspace(0 , teta2 , teta_max);
  tet3 = linspace(0 , teta3 , teta_max);
  tet4 = linspace(0 , teta4 , teta_max);
  
  figure(fig),
  
  for i = 1 : teta_max
    %Base
    x0 = 0;
    y0 = 0;
    z0 = 0;
      
    % Shoulder
    x1 = 0;
    y1 = 0;
    z1 = 6.3; 
    
    % Elbow
    x2 = a2 *cosd(tet2(i)) *cosd(tet1(i));
    y2 = a2 *cosd(tet2(i)) *sind(tet1(i));
    z2 = z1 + a2 *sind(tet2(i));
    
    % Wrist
    x3 = (a2 *cosd(tet2(i)) + a3 *cosd(90-tet3(i))) *cosd(tet1(i));
    y3 = (a2 *cosd(tet2(i)) + a3 *cosd(90-tet3(i))) *sind(tet1(i));
    z3 = z2 + a3 *sind(90-tet3(i));
    
    % Gripper
    x4 = (a2 *cosd(tet2(i)) + a3 *cosd(90-tet3(i)) + a4 *cosd(tet4(i))) *cosd(tet1(i));
    y4 = (a2 *cosd(tet2(i)) + a3 *cosd(90-tet3(i)) + a4 *cosd(tet4(i))) *sind(tet1(i));
    z4 = z3 + a4 *sind(tet4(i));
    
    % clear previous plot
    clf,
    
    % Gripper plot
    plot3(x4,y4,z4 ,'k*'), 
    
    % Segments plot
    line([x0,x1],[y0,y1],[z0,z1] , 'Color',col,'LineStyle','-'),
    line([x1,x2],[y1,y2],[z1,z2] , 'Color',col,'LineStyle','-'),
    line([x2,x3],[y2,y3],[z2,z3] , 'Color',col,'LineStyle','-'),
    line([x3,x4],[y3,y4],[z3,z4] , 'Color',col,'LineStyle','-'),
    
    grid on , grid minor, axis equal,
    xlim([-l_max l_max]),
    ylim([-l_max l_max]),
    zlim([-l_max l_max]),
    
    pause(.0001),
    drawnow;
    %hold off,
  end
end






