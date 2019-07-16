img = uint8(load('image/l256.dat'));
[r,c] = size(img);
total_pixels = r*c;

dark_img = linearStretch(img,0,40);
bright_img = linearStretch(img,150,200);

subplot(3,4,1), imshow(img);
subplot(3,4,2), imhist(img);
subplot(3,4,5), imshow(dark_img);
subplot(3,4,6), imhist(dark_img);
subplot(3,4,9), imshow(bright_img);
subplot(3,4,10), imhist(bright_img);

img_table = zeros(256,5);
dark_img_table = zeros(256,5);
bright_img_table = zeros(256,5);

img_table(:,1) = imhist(img);
dark_img_table(:,1) = imhist(dark_img);
bright_img_table(:,1) = imhist(bright_img);

img_table(:,2) = double(img_table(:,1)) / double(total_pixels);
dark_img_table(:,2) = double(dark_img_table(:,1)) / double(total_pixels);
bright_img_table(:,2) = double(bright_img_table(:,1)) / double(total_pixels);

img_table(1,3) = img_table(1,2);
dark_img_table(1,3) = dark_img_table(1,2);
bright_img_table(1,3) = bright_img_table(1,2);
for i=2:256
    img_table(i,3) = img_table(i,2) + img_table(i-1,3);
    dark_img_table(i,3) = dark_img_table(i,2) + dark_img_table(i-1,3);
    bright_img_table(i,3) = bright_img_table(i,2) + bright_img_table(i-1,3);
end

img_table(:,4) = img_table(:,3) * 255;
dark_img_table(:,4) = dark_img_table(:,3) * 255;
bright_img_table(:,4) = bright_img_table(:,3) * 255;

img_table(:,5) = floor(img_table(:,4));
dark_img_table(:,5) = floor(dark_img_table(:,4));
bright_img_table(:,5) = floor(bright_img_table(:,4));

for i=1:r
    for j=1:c
        img(i,j) = img_table(img(i,j)-1,5);
        if( dark_img(i,j)-1 > 0 )
            dark_img(i,j) = dark_img_table(dark_img(i,j)-1,5);
        end
        bright_img(i,j) = bright_img_table(bright_img(i,j)-1,5);
    end
end
subplot(3,4,3), imshow(img);
subplot(3,4,4), imhist(img);
subplot(3,4,7), imshow(dark_img);
subplot(3,4,8), imhist(dark_img);
subplot(3,4,11), imshow(bright_img);
subplot(3,4,12), imhist(bright_img);