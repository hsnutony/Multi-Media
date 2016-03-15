function [ output ] = myDCT2(input)

%把圖片轉成single
input = im2double(input);

%取圖片大小
[M,N] = size(input);

%創造兩個矩陣  兩個維度分開算
degree_x = zeros(M,M);
degree_y = zeros(N,N);

%用兩層for計算各個點應乘的value 放入矩陣
%照公式算
for u = 0 : (M - 1)
    Cu = sqrt(2/M);
    if(u == 0)
        Cu = sqrt(1/M);
    end
    for x = 0 : (M - 1)
        degree_x(u + 1, x + 1) = Cu * cos((2 * x + 1) * pi * u / (2 * M));
    end
end

%用兩層for計算各個點應乘的value 放入矩陣
for v = 0 : (N - 1)
    Cu = sqrt(2/M);
    if(u == 0)
        Cu = sqrt(1/M);
    end
    for y = 0 : (N - 1)
         degree_y(v + 1, y + 1) = Cu *  cos((2 * y + 1) * pi * v / (2 * N));
    end
end


%算結果並輸出
output = degree_x * input * degree_y;

end

