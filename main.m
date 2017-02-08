
X = load('../signal_3_in_adap.dat');
Y = load('../signal_3_out_adap.dat');
	
Amp = sqrt(max(sum(X .^ 2, 2)))

X = X ./ Amp;

F = getFeatures(X);

TR = zeros(size(F, 2), 1);
TI = zeros(size(F, 2), 1);

funR = @(T) costFunction(T, F, Y(:,1));
funI = @(T) costFunction(T, F, Y(:,2));

TRBest = fminsearch(funR, TR);
TIBest = fminsearch(funI, TI);

AnsR = F * TRBest;
AnsI = F * TIBest;

Ans = [AnsR, AnsI];
%Ans = X;

D = sum(sum((Ans - Y) .^ 2, 1), 2);
Down = sum(sum((Y) .^ 2, 1), 2);
10 * log(D / Down)

C = [TRBest, TIBest; Amp, 0]

fout = fopen('coef33.dat', 'w');
fprintf(fout, "%d %d\n", int32(C' .* 1));
%fprintf(fout, "%.20e %.20e\n", C');
fclose(fout);