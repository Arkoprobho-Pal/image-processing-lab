%%write a program to calculate PSNR value for an enhanced image over the

load 'image/l256.dat';
A = importdata('image/l256.dat');
n = size(A);
B = zeros(size(A));
min=0;
max=255;
%%prompt = 'Enter the percent  value of p: ';
a = 1000;
p=(a/100)*n;
%%prompt = 'Enter the percent value of q: ';
b = 100;
for x=1:n
    for y=1:n
        B(x,y)=A(x,y);
    end
end

    for m= 1:p
    x=min+rand(1,1)*(max-min);
    X=ceil(x);
    y=min+rand(1,1)*(max-min);
    Y=ceil(y);
    k=A(X,Y);
    pp=0+rand(1,1)*(1-0);  
     if  pp> 0.5
            B(X,Y)=k+k*(b/100);
        else
            B(X,Y)=k-k*(b/100);
     end
   
    end
subplot(2,1,1);
imshow(B, [0, 256])
t=sprintf('Original Image');
title(t); 
subplot(2,1,2);
imshow(A, [0, 256]);
t=sprintf('After Enhancing of the image');
title(t); 
M=n(1);
N=n(2);

MSE = sum(sum((B-A).^2))/(M*N);

PSNR = 10*log10(256*256/MSE);

fprintf('\nMSE: %f ', MSE);
fprintf('\nPSNR: %f dB\n', PSNR);