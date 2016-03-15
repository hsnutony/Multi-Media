clear;
close all;

img = imread('C:\Users\user\Desktop\Mine\¶h¥C≈È\HW1_Release\clash3.png');
img = im2double(img);
%figure, imshow(img);

%%%%%NN%%%%%

NN_img = resizedImage_NN(img, 4);
figure, imshow(NN_img);

%%%Bilinear%%%

Bi_img =  resizedImage_bilinear(img, 4);
figure, imshow(Bi_img);