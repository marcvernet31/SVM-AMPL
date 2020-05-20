param numVar;
param v;
param numElements;
param dataset{m in 1..numElements, n in 1..(numVar+1)};

param x{m in 1..numElements, n in 1..numVar};
param y{n in 1..numElements};


var s{m in 1..numElements} >= 0;
var w{n in 1..numVar};
var gamma;

minimize objective_func:
	(1/2) * sum{n in 1..numVar}w[n]^2 + v*sum{m in 1..numElements}s[m];
	
subject to constr {m in 1..numElements}:
	y[m]*((sum{n in 1..numVar}w[n]*x[m,n]) + gamma) + s[m] >= 1;