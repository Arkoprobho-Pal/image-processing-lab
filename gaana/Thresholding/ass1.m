input = load('image/f256.dat');
imshow(input, [0,255]);
[r c] = size(input);
output1=zeros(r,c);
for i=1:r
    for j=1:c
        if(input(i,j)>127)
            output1(i,j)=1;
        end;
    end;
end;
figure,imshow(output1);


output2=zeros(r,c);
low=min(input(:))
high=max(input(:))
thresh=(high+low)/2;
for i=1:r
    for j=1:c
        if(input(i,j)>thresh)
            output2(i,j)=1;
        end;
    end;
end;
figure,imshow(output2);

output3=zeros(r,c);
modal=mode(double(input(:)))
for i=1:r
    for j=1:c
        if(input(i,j)>modal)
            output3(i,j)=1;
        end;
    end;
end;
figure,imshow(output3);