X = load('../signal_3_in_test.dat');
C = load('./coef33.dat');

Amp = C(end,1);
C = C(1:end-1,:);

X = X ./ Amp;

TR = C(:,1);
TI = C(:,2);

F = getFeatures(X);

YR = F * TR;
YI = F * TI;

Y = [YR,YI];

fout = fopen('ans33.dat', 'w');
for i=1:size(Y, 1)
    fprintf(fout, '%f ', Y(i,:));
    fprintf(fout, '\n');
end
fclose(fout);