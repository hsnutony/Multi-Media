function [ output ] = resizedImage_NN( input, n)

    originSize = [size(input), 1];
    scaleSize = originSize;
    scaleSize(1:2) = round(scaleSize(1:2) * n);

    yMapping = (originSize(1) - 1) / (scaleSize(1) - 1);
    xMapping = (originSize(2) - 1) / (scaleSize(2) - 1);

    yIndex = round(( 0 : (scaleSize(1) - 1)) * yMapping + 1);
    xIndex = round(( 0 : (scaleSize(2) - 1)) * xMapping + 1);

    output = zeros(scaleSize(1:3), class(input));

    for u  = 1 : scaleSize(2)
        output(:, u, :) = input(yIndex, xIndex(u), :);
    end

end

