I=load('image/l256.dat');
imshow(I,[0,256]);
[r c]=size(I);
s1=0;
for i=1:10
    for j=1:10
        s1=s1+I(i,j);
    end;
end;
for i=1:10
    for j=(c-10):c
        s1=s1+I(i,j);
    end;
end;
for i=(r-10):r
    for j=1:10
        s1=s1+I(i,j);
    end;
end;
for i=(r-10):r
    for j=(c-10):c
        s1=s1+I(i,j);
    end;
end;

m1=s1/400;

s2=0;
for i=11:(r-11)
    for j=1:c
        s2=s2+I(i,j);
    end;
end;
for i=1:10
    for j=11:(c-11)
        s2=s2+I(i,j);
    end;
end;
for i=(r-10):r
    for j=11:(c-11)
        s2=s2+I(i,j);
    end;
end;

m2=s2/(r*c-400);
T1=0;
T2=round((m1+m2)/2);
s1=0;s2=0;
c1=0;c2=0;
z=1;
while(z<=15)
    for i=1:r
        for j=1:c
            if(I(i,j)<T2)
                s1=s1+I(i,j);
                c1=c1+1;
            else
                s2=s2+I(i,j);
                c2=c2+1;
            end;
        end;
    m1=s1/c1;
    m2=s2/c2;
    T1=T2;
    T2=round((m1+m2)/2);
    end;
    z=z+1;
end;

O=zeros(r,c);
for i=1:r
    for j=1:c
        if(I(i,j)>T2)
            O(i,j)=1;
        else
            O(i,j)=0;
        end;
    end;
end;
subplot(1,2,1);imshow(I,[0,255]);title('Original image')
subplot(1,2,2);imshow(O,[0,1]);title('Thresholding image')