clear;
close all;

img = imread('C:\Users\user\Desktop\Mine\�h�C��\HW1_Release\clash2.png');
img = im2double(img);


[my_DCT] = myDCT2(img, 8);

figure, imshow(my_DCT);

s_DCT = myiDCT2(my_DCT);
figure, imshow(s_DCT);