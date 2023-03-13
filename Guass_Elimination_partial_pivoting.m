
A = input('Enter your coeff matrix ');
B = input('Enter source matrix ');
N = length(B);
X = zeros(N,1);
Aug = [A B];
for j = 1:N-1
    %partial pivoting
    [M,P] = max(abs(Aug(j:N,j)));
    C = Aug(j,:);
    Aug(j,:) = Aug(P+j-1,:);
    Aug(P+j-1,:) = C;

    %echelon form
    for i = j+1:N
        m=Aug(i,j)/Aug(j,j);
        Aug(i,:)=Aug(i,:) - m*Aug(j,:);
    end
end


Aug

X(N) = Aug(N,N+1)/Aug(N,N);
for k = N-1:-1:1

    X(k) = (Aug(k,N+1) - Aug(k,k+1:N)*X(k+1:N))/Aug(k,k);
    %disp(X(k));
end

X

