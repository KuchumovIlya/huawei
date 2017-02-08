function D = getDiff(Y1, Y2)
	D = sum(sum((Y1 - Y2) .^ 2, 1), 2);
end