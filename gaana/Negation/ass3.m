input=load('image/l256.dat');
imshow(input,[0,255]);
[r c]=size(input);
negation=zeros(r,c);
for i=1:r
    for j=1:c
        negation(i,j)=255-input(i,j);
    end;
end;
figure,imshow(negation,[0,255]);