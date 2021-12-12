function matrix = dh_matrix(Param)
    % DHMatrix : define the Denavit Hartenberg matrix from one line of the DHtable 

    param = num2cell(Param);
    [alpha ,  a , d ,teta] = deal(param{:});

    matrix = [ cosd(teta),   -cosd(alpha)*sind(teta),  sind(alpha)*sind(teta),    a*cosd(teta);
               sind(teta),    cosd(alpha)*cosd(teta),  -sind(alpha)*cosd(teta),   a*sind(teta);
               0,             sind(alpha),            cosd(alpha),              d;
               0,             0,                     0,                       1;];
end