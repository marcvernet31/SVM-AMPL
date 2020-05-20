# enter the parameters from data
param m >= 1; # number of observations
param n >= 1; # number of dimensions (4)

param y {i in 1..m};
param X {i in 1..m, j in 1..n};

# the variables to find
var w {i in 1..n};
var b;
var s {i in 1..m}

# objective function
minimize eucNorm: sum{i in 1..n} w[i]^2 + sum{i in 1..m} s[i];

# conditions
subject to c1 {i in 1..m}: y[i] * (sum{j in 1..n} (w[j]*X[i,j]) + b) >= 1-s[i];
c2 {i in 1..m}: s[i]>=0;
