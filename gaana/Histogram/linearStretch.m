function [ img2 ] = linearStretch( img, c, d )

a = double(min(min(img)));
b = double(max(max(img)));

[row,col] = size(img);
img2 = zeros(row,col);
mul = (d-c)/(b-a);
img2 = round(((img-a)*(mul))+c);

end

