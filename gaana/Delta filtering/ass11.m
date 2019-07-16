img=load('image/l256.dat');
imshow(img,[0,255]);
[r c]=size(img);
B=img;
p = input('Enter the value of p: ');
q = input('Enter the value of q: ');
pixel_count = ceil(r*c*(p/100));
count = 0;
while count <= pixel_count
    i = randi(r);
    j = randi(c);
    
    if randi(2) == 1
        img(i,j) = img(i,j) - (img(i,j)*(q/100));
    else
        img(i,j) = img(i,j) + (img(i,j)*(q/100));
    end
    count = count + 1;
end
imshow(img,[0,255]);
% 
% I =importdata('l256.dat');
% I =uint8(255*mat2gray(I));
% %imshow(I);
% T=mat2gray(I);
%[r,c, e]=size(img);
A=zeros(258,258);
for i=1:r
    for j=1:c
        A(i+1,j+1)=img(i,j);
    end
end
C=zeros(258,258);
 for i=2:r+1
     for j=2:c+1

         M=ceil((A(i-1,j-1)+A(i-1,j)+A(i-1,j+1)+A(i,j-1)+A(i,j)+A(i,j+1)+A(i+1,j-1)+A(i+1,j)+A(i+1,j+1))/9);
         del = C(i,j) - M;
         del = abs(del);
         if(del>=20)
             C(i,j) = M;
         end
     end
         
 end
subplot(1,3,1);imshow(B,[0,255]);
subplot(1,3,2);imshow(img,[0,255]);
subplot(1,3,3);imshow(C,[0,255]);