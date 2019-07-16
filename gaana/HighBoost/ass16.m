%high boost
I =importdata('image\l256.dat');
I =uint8(255*mat2gray(I));
%imshow(I);
T=mat2gray(I);
[r,c, e]=size(I);
A=zeros(258,258);
for i=1:r
    for j=1:c
        A(i+1,j+1)=I(i,j);
    end
end
C=zeros(258,258);
D=zeros(258,258);
E=zeros(258,258);
%  for i=2:r+1
%      for j=2:c+1
% 
%          C(i,j)=abs(A(i-1,j-1)+(-1)*A(i-1,j+1)+2*A(i,j-1)+(-2)*A(i,j+1)+A(i+1,j-1)+(-1)*A(i+1,j+1));
%          
%      end
%          
%  end
%  
k=.5;
 for i=2:r+1
     for j=2:c+1

         D(i,j)=abs((-1)*A(i-1,j-1)+(-1)*A(i-1,j)+(-1)*A(i-1,j+1)+(-1)*A(i,j-1)+(k+8)*A(i,j)+(-1)*A(i,j+1)+(-1)*A(i+1,j-1)+(-1)*A(i+1,j)+(-1)*A(i+1,j+1));
         
     end         
 end
 
%  for i=1:r
%     for j=1:c
%         E(i,j)=C(i,j)+D(i,j);
%     end
% end

subplot(1,2,1);imshow(A,[0,255]);
%subplot(2,2,2);imshow(C,[0,255]);
subplot(1,2,2);imshow(D,[0,255]);
%subplot(2,2,4);imshow(E,[0,255]);