function matrix = dh_matrix(Param)
    % DHMatrix : define the Denavit Hartenberg matrix from one line of the DHtable 

    param = num2cell(Param);
    [alpha ,  a , d ,teta] = deal(param{:});

    matrix = [ cos(teta),   -cos(alpha)*sin(teta),  sin(alpha)*sin(teta),    a*cos(teta);
               sin(teta),    cos(alpha)*cos(teta),  -sin(alpha)*cos(teta),   a*sin(teta);
               0,             sin(alpha),            cos(alpha),              d;
               0,             0,                     0,                       1;];
end