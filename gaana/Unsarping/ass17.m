%mean filtered unsharpening

img=load('image\l256.dat');
imshow(img,[0,255]);
[r c]=size(img);

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
% [r,c, e]=size(I);
A=zeros(258,258);
for i=1:r
    for j=1:c
        A(i+1,j+1)=img(i,j);
    end
end
C=zeros(258,258);
D=zeros(258,258);
 for i=2:r+1
     for j=2:c+1

         C(i,j)=ceil((A(i-1,j-1)+A(i-1,j)+A(i-1,j+1)+A(i,j-1)+A(i,j)+A(i,j+1)+A(i+1,j-1)+A(i+1,j)+A(i+1,j+1))/9);
         
     end
         
 end
 
%  A=zeros(258,258);
% for i=1:r
%     for j=1:c
%         A(i+1,j+1)=img(i,j);
%     end
% end

D=zeros(258,258);
 for i=2:r+1
     for j=2:c+1

         M=ceil((A(i-1,j-1)+A(i-1,j)+A(i-1,j+1)+A(i,j-1)+A(i,j)+A(i,j+1)+A(i+1,j-1)+A(i+1,j)+A(i+1,j+1))/9);
         Del=A(i,j)-M;
         Del=abs(Del);
         if(Del>=20)
             D(i,j)=M;
         else
             D(i,j)=A(i,j);
         end
     end
         
 end
 E=zeros(258,258);
 F=zeros(258,258);
 for i=2:r
    for j=2:c
        E(i+1,j+1)=img(i,j)-C(i+1,j+1);
        F(i+1,j+1)=img(i,j)-D(i+1,j+1);
    end
end
%  figure;
%  imshow(I,[0,255]);

% figure;
subplot(2,3,1);imshow(img,[0,255]);
subplot(2,3,2);imshow(C,[0,255]);
subplot(2,3,3);imshow(D,[0,255]);
subplot(2,3,4);imshow(E,[0,255]);
subplot(2,3,5);imshow(F,[0,255]);