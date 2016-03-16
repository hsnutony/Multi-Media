function [ output ] = myiDCT2( input)

%把圖片轉成double
input = im2double(input);

%取圖片大小
[m,n] = size(input);
mb = m/8;
nb = n/8;

M = 8;

coef = zeros(M,M);

for u = 1 : M
    x = (1 : M);
    coef(u, :) = cos((pi * (2 * (x - 1) + 1) *  (u - 1)) / (2 * M)) * sqrt(2/M);
end
coef(1, :) = coef(1, :) / sqrt(2);


for u = 0 : mb -1
    for v = 0 :nb -1
        output(1 + (u * 8) :  8 +(u * 8), 1 + (v * 8) :  8 +(v * 8)) = (coef.') * input(1 + (u * 8) :  8 +(u * 8), 1 + (v * 8) :  8 +(v * 8)) * coef;
    end
end


%output = idct2(input);

end

