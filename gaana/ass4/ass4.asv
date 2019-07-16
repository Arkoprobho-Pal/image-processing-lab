I=load('image/n256.dat');
imshow(I,[0,256]);
high=max(I(:));
low=min(I(:));
minv=input('Enter new low value : ');
maxv=input('Enter new high value : ');
[r c]=size(I);
output=zeros(r,c);
for i=1:r
    for j=1:c
        x=I(i,j);
        t=x-low;
        y=t*((maxv-minv)/(high-low))+minv;
        output(i,j)=round(y);
    end;
end;
figure, imshow(output,[0,255]);