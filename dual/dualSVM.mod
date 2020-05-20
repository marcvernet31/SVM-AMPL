
param numElements;
param numVar;
param v;
param dataset{m in 1..numElements, n in 1..(numVar + 1)};

param x{m in 1..numElements, n in 1..numVar};
param y{n in 1..numElements};
param K{i in 1..numElements, j in 1..numElements} = sum{k in 1..numVar}x[i,k]*x[j,k];

var lambda{m in 1..numElements} >= 0, <= nu;

maximize objective_func:
		sum{m in 1..numElements} lambda[m] - (1/2)*sum{mi in 1..numElements, mj in 1..numElements} lambda[mi]*y[mi]*lambda[mj]*y[mj]*K[mi,mj];

subject to constr:
	sum{m in 1..numElements} lambda[m]*y[m] = 0;