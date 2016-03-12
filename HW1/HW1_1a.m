e_patch = zeros(100, 800, 3);

for u = 0 : 7
    patch = zeros(1, 1, 3);
    patch(1, 1, :) = colors(u+1, :);
    patch =  double(patch)/255;
    patch = imresize(patch, 100);
    e_patch(:, (1 + 100*u) : (100 + 100* u) , :) = patch; 
end

imshow(e_patch)