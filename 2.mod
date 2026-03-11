set INTERSECTIONS;
set FIXED within INTERSECTIONS;
set PROHIBITED within INTERSECTIONS;
set NEIGHBORHOOD_EDGES within {INTERSECTIONS, INTERSECTIONS};  
set PATHS;
param flow{PATHS};
set PATH_INTERSECTION within {PATHS cross INTERSECTIONS};

var x{INTERSECTIONS} binary;  
var y{PATHS} binary;         

maximize TotalFlow: sum{p in PATHS} flow[p] * y[p];

subject to MaxSensors:
    sum{i in INTERSECTIONS} x[i] <= 15;

subject to FixedConstraints{i in FIXED}:
    x[i] == 1;

subject to ForbiddenConstraints{i in PROHIBITED}:
    x[i] == 0;

subject to PathCoverage{p in PATHS}:
    sum{(p,i) in PATH_INTERSECTION} x[i] >= 2 * y[p];

subject to MinDistance {(i,j) in NEIGHBORHOOD_EDGES}:
    x[i] + x[j] <= 1;  
 
    
option solver gurobi;
option gurobi_options 'outlev=1';    
    
solve;
display x, y, z;