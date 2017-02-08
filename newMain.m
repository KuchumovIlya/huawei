
X = load('../signal_1_in_adap.dat');
Y = load('../signal_1_out_adap.dat');
	
Amp = sqrt(max(sum(X .^ 2, 2)))

X = X ./ Amp;

F = getFeatures(X);

TR = zeros(8*11, 1);
TI = zeros(8*11, 1);

funR = @(T) newCostFunction(T, F, Y(:,1));
funI = @(T) newCostFunction(T, F, Y(:,2));

TRBest = fminsearch(funR, TR);
TIBest = fminsearch(funI, TI);

AnsR = getY(TRBest, F);
AnsI = getY(TIBest, F);

n = size(Y, 1);

for i = 1:5
	AnsR(i) = Y(i, 1);
	AnsI(i) = Y(i, 2);

	AnsR(n - i + 1) = Y(n - i + 1, 1);
	AnsI(n - i + 1) = Y(n - i + 1, 2);
end

Ans = [AnsR, AnsI];
%Ans = X;

D = sum(sum((Ans - Y) .^ 2, 1), 2);
Down = sum(sum((Y) .^ 2, 1), 2);
10 * log(D / Down)

C = [TRBest, TIBest; Amp, 0]

fout = fopen('coef1.dat', 'w');
%fprintf(fout, "%d %d\n", int32(C' .* 1));
fprintf(fout, "%.20e %.20e\n", C');
fclose(fout);

