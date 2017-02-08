function J = costFunction(T, X, Y)
	X2 = X * T;
	D = X2 - Y;
	J = sum(D .^ 2, 1);
end