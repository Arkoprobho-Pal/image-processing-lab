I=load('image/f256.dat');
[r c]=size(I);
pixels = r*c;
p = input('Enter the percentage of pixels to modify : ');
q = input('Enter the percentage to modify to pixels value : ');
k = (round((pixels*p)/100));
M = zeros(r,c);
for i = 1 : r
    for j = 1 : c
        M(i,j) = I(i,j);
    end;
end;
for i = 1 : k
    r1 = randi(r);
    c1 = randi(c);  
    val = I(r1,c1);   
    mid = randi(2);   
    if(mid == 2)
        val = val*((100+q))/100;
    else
        val = val*(100-q)/100;
    end;    
    M(r1,c1) = round(val);   
end;
subplot(2,2,1),imshow(M,[0,255]);
[x y] = size(M);
I2=zeros(x,y);
for i = 2:x-1
    for j = 2:y-1
        sum = 0;
        for ii = i-1:i+1  
            for jj = j-1:j+1
                sum = sum + M(ii,jj);
            end
        end
        I2(i,j) = ceil(sum/9);
    end
end
subplot(2,2,2),imshow(I2,[0,255]);
[x y] = size(M);
I3=zeros(x,y);
filt=zeros(1,9);
for i = 2:x-1
    for j = 2:y-1
        sum = 0;
        m=1;
        for ii = i-1:i+1  
            for jj = j-1:j+1
                filt(m)=M(ii,jj);
                m=m+1;
            end;
            m=m+1;
        end;
        filt = sort(filt);
        I3(i,j) =filt(5);
    end;
end;
subplot(2,2,3),imshow(I3,[0,255]);
