function F = getFeatures(X)
	Z = X(:,1) .^ 2 + X(:,2) .^ 2;
	Z = sqrt(Z);
	R = X(:,1);
	I = X(:,2);
	F = [R, I, R .* Z, I .* Z, R .* (Z .^ 2), I .* (Z .^ 2), R .* (Z .^ 3), I .* (Z .^ 3)];
	%F = [R, I];
end