function psnr = computePSNR(input1_s, input2_s)

%取得input大小
[m, n] = size(input1_s);

%代公式算出psnr
psnr = 10*log10(m*n/(sum(sum((input1_s - input2_s).^2))));

end

