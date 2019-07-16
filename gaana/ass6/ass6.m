img=load('image/l256.dat');
subplot(1,2,1), imshow(img,[0,255]);
[r c]=size(img);

p = input('Enter the percentage of pixel to modify : ');
q = input('Enter the percentage to modify the fixel value : ');

pixel_count = ceil(r*c*(p/100));
for k = 1:pixel_count
    i = randi(r);
    j = randi(c);
    if randi(2) == 1
        img(i,j) = img(i,j) - (img(i,j)*(q/100));
    else
        img(i,j) = img(i,j) + (img(i,j)*(q/100));
    end
   
end
subplot(1,2,2), imshow(img,[0,255]);