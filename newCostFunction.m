function J = newCostFunction(T, F, Y)
	Y2 = getY(T, F);
	J = getDiff(Y, Y2);
end