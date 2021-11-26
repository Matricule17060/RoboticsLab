function table = dh_table(Param)
    % Define Denavit Hartenberg table

    param = num2cell(Param);
    [a2 , a3 , a4 , tet1 , tet2 , tet3 , tet4] = deal(param{:});


    table = [-90 , 0   , 6.3 , tet1;
             0   , a2  , 0   , tet2;
             0   , a3  , 0   , tet3;
             0   , a4  , 0   , tet4;];
end