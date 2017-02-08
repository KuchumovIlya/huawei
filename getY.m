function Y = getY(T, F)
	n = size(F, 1);
	Y = zeros(n, 1);

	for i = 6:n-6
		A = F(i-5:i+5, :);
		A = A(:);
		Y(i) = sum(A' * T);
	end
end