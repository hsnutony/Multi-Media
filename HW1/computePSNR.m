function psnr = computePSNR(input1_s, input2_s)

%���oinput�j�p
[m, n] = size(input1_s);

%�N������Xpsnr
psnr = 10*log10(m*n/(sum(sum((input1_s - input2_s).^2))));

end

