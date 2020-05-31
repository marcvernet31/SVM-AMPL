
param numElements;
param numVar;
param v;

param dataset{m in 1..numElements, n in 1..(numVar + 1)};

param x{m in 1..numElements, n in 1..numVar};
param y{m in 1..numElements};
# in this case we compute the Gaussian (RBF) kernel: K(x, y) = exp((norm(x-y)^2)/(2*sd^2));∫
param K{i in 1..numElements, j in 1..numElements} = (sum{k in 1..numVar} exp(abs(x[i,k]-x[j,k])**2));

var lambda{m in 1..numElements} >= 0, <= v;

maximize objective_func:
	sum{m in 1..numElements} lambda[m] - (1/2)*sum{mi in 1..numElements, mj in 1..numElements} lambda[mi]*y[mi]*lambda[mj]*y[mj]*K[mi,mj];

subject to constr:
	sum{m in 1..numElements} lambda[m]*y[m] = 0;
