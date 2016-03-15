function [ output ] = myDCT2(input)

%��Ϥ��নsingle
input = im2double(input);

%���Ϥ��j�p
[M,N] = size(input);

%�гy��ӯx�}  ��Ӻ��פ��}��
degree_x = zeros(M,M);
degree_y = zeros(N,N);

%�Ψ�hfor�p��U���I������value ��J�x�}
%�Ӥ�����
for u = 0 : (M - 1)
    Cu = sqrt(2/M);
    if(u == 0)
        Cu = sqrt(1/M);
    end
    for x = 0 : (M - 1)
        degree_x(u + 1, x + 1) = Cu * cos((2 * x + 1) * pi * u / (2 * M));
    end
end

%�Ψ�hfor�p��U���I������value ��J�x�}
for v = 0 : (N - 1)
    Cu = sqrt(2/M);
    if(u == 0)
        Cu = sqrt(1/M);
    end
    for y = 0 : (N - 1)
         degree_y(v + 1, y + 1) = Cu *  cos((2 * y + 1) * pi * v / (2 * N));
    end
end


%�⵲�G�ÿ�X
output = degree_x * input * degree_y;

end

