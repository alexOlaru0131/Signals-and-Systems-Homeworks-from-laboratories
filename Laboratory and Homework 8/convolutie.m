function C = convolutie(A,h)

    filtru = fliplr(h);

    B = zeros(length(A(1,:))+2,length(A(:,1))+2);
    B(2:length(B(1,:))-1 , 2:length(B(:,1)) - 1) = A;
    B(2:length(B(1,:))-1, length(B(:,length(B(:,1))))) = A(1:length(A(:,1)),1);
    B(2:length(B(1,:))-1, 1) = A(1:length(A(:,1)),length(A(:,1)));
    B(length(B(1,:)),2:length(B(:,1))-1) = A(1,1:length(A(1,:)));
    B(1,2:length(B(:,1))-1) = A(length(A(1,:)),1:length(A(1,:)));
    B(1,1) = A(length(A(1,:)),length(A(1,:)));
    B(1,length(B(1,:))) = A(length(A(1,:)),1);
    B(length(B(1,:)),1) = A(1,length(A(1,:)));
    B(length(B(1,:)),length(B(1,:))) = A(1,1);

    C = zeros(length(A(1,:)),length(A(:,1)));
    
    k_l = length(filtru(1,:));
    k_c = length(filtru(:,1));
    b_l = length(B(1,:));
    b_c = length(B(:,1));

    for i = 1:b_l-k_l+1
        for j=1:b_c-k_c+1

            D = B(i:k_l+i-1,j:k_c+j-1).*filtru;
            C(i,j) = sum(D,"all");

        end

    end

end