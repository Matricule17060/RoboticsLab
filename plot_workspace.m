function plot_workspace(animation ,fig)
    a2 = 14.6;
    a3 = 18.7;
    a4 = 8.6 ;
    
    X = [];
    Y = [];
    Z = [];

    figure(fig),
    for teta1 =  -90 : 10  :90
        for teta2 = 0 : 10 : 180
            for teta3 = -90 : 10 : 90
                for teta4 = 0 : 10 : 180
                      % Gripper positions
                      xg = (a2 *cosd(teta2) + a3 *cosd(90-teta3) + a4 *cosd(teta4)) *cosd(teta1);
                      yg = (a2 *cosd(teta2) + a3 *cosd(90-teta3) + a4 *cosd(teta4)) *sind(teta1);
                      zg = 6.3 + a2 *sind(teta2) + a3 *sind(90-teta3) + a4 *sind(teta4);
    
                      X = [X xg]; % X.append(x)
                      Y = [Y yg];
                      Z = [Z zg];

                      if animation
                          hold on
                          plot3(xg , yg , zg , '*'), pause(.00001) , drawnow
                      end
                end
            end
        end
    end

    if ~animation
        plot3(X,Y,Z,'b');
    end
end