clear;
close all;

img = imread('C:\Users\user\Desktop\Mine\¶h¥C≈È\HW1_Release\clash2.png');
img = im2double(img);
figure, imshow(img);

my_DFT = myDCT2(img);
img_DFT = dct2(img);
figure, imshow(my_DFT);
figure, imshow(img_DFT);