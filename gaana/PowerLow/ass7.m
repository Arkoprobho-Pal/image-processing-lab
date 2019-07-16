Img=load('image/f256.dat');
%figure,imshow(Img,[0,255]);
[r col]=size(Img);
a=min(Img(:));
b=max(Img(:));
O=zeros(r,col);
c = input('Please enter the value of c:');
d = input('Please enter the value of d:');
t1=b-a;
t2=d-c;
for i=1:r
    for j=1:col
        y=((Img(i,j)/t1)*t2)+c;
        O(i,j)=round(y);
    end;
end;
subplot(1,3,1),imshow(O,[0,255]);

gamma=[1.8,2.5];
outmat=zeros(r,c);
cons=0.25;
for gam=1:length(gamma)
    for i=1:r
        for j=1:col
            pix=cons*(O(i,j)^gamma(gam));
            outmat(i,j)=round(pix);
        end;
    end;
       subplot(1,3,gam+1),imshow(outmat,[0,255]);       
end;