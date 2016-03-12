function [ color ] = rgb_dist( input, colors )
colors = double(colors)/255;
index = 0;
min_dist = 200000;
for u = 1 : 8
    cur_dist = (input(1) - colors(u, 1))^2 + (input(2) - colors(u, 2))^2 + (input(3) - colors(u, 3))^2;
    if cur_dist < min_dist
        min_dist = cur_dist;
        index = u;
    end
end

color = colors( index, :);

end

