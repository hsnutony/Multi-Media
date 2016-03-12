
imgPath = 'C:\Users\user\Desktop\Mine\¶h¥C≈È\HW1_Release\clash1.png';
img = imread(imgPath);
img = im2double(img);
d_colors = double(colors)/255;

[m, n, ~] = size(img);
result = zeros(m, n, 3);
table = zeros(m, n, 8);
for u = 1 : 8
   r_color = zeros(m, n) + d_colors(u, 1);
   g_color = zeros(m, n) + d_colors(u, 2);
   b_color = zeros(m, n) + d_colors(u, 3);
   table(:, :, u) =  (img(:, :, 1) - r_color).^2 + (img(:, :, 2) - g_color).^2 + (img(:, :, 3) - b_color).^2 ;
end

[~, index] = min(table, [], 3);

for u = 1 : m
     result(u, :, :) = d_colors(index(u, :), :);
end

imshow(result);
