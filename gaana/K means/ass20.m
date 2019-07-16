%K-means filtering
I=dlmread('image/l256.dat');
I1=dlmread('image/l256.dat');
I5=dlmread('image/l256.dat');
%I=padarray(I,[1 1],0,'both');
I=uint8(255*mat2gray(I));
I2=imnoise(I,'gaussian',0,0.002);
I3=imnoise(I,'gaussian',0,0.002);%noisy image for display
I2=padarray(I2,[1 1],0,'both');
I4=padarray(I3,[1 1],0,'both');
I6=padarray(I3,[1 1],0,'both');%second psnr value calculation (noisy)
[row col]=size(I2);
k=input('Enter the value of K = ');
mask=3;
maxi=max(max(I2));
for i=1:row-mask+1
    for j=1:col-mask+1
        x=i+1;y=j+1;
        kernel=zeros(mask,mask);
        kernel2=zeros(mask,mask);
        for ii=0:mask-1
            for jj=0:mask-1
                if I2(x,y)<I2(ii+i,jj+j)
                    kernel(ii+1,jj+1)=(I2(ii+i,jj+j)-I2(x,y));
                else
                    kernel(ii+1,jj+1)=(I2(x,y)-I2(ii+i,jj+j));
                end
                kernel2(ii+1,jj+1)=I2(ii+i,jj+j);
            end
        end
        %disp(I2(x,y));
        %disp(kernel2);
        %disp(kernel);
        index_x=1;index_y=1;summ=0;
        for kk=0:k-1
            minimum=maxi;
            for ii=0:mask-1
                for jj=0:mask-1
                    if kernel(ii+1,jj+1)<minimum
                        minimum=kernel(ii+1,jj+1);
                        index_x=ii+1;
                        index_y=jj+1;
                    end
                end
            end
            %disp(minimum);
            %disp(index_x);
            val=I2(i+index_x-1,j+index_y-1);
            summ=summ+uint16(val);
            %disp(val);
            %disp(summ);
            kernel(index_x,index_y)=maxi;
            %disp(kernel)
        end
        I2(x,y)=summ/k;
     end
end
%%%% PSNR value calculation
% Noisy and Kmeans Image
mse=0;
for i=1:row-mask+1
    for j=1:col-mask+1
        if I2(i,j)<I4(i,j)
            I4(i,j)=I4(i,j)-I2(i,j);
        else
            I4(i,j)=I2(i,j)-I4(i,j);
        end
        val=uint16(I4(i,j));
        %disp(val);
        mse=mse+uint32(val*val);
        %disp(mse);
    end
end
%disp(mse);
mse=double(mse/(row*col));
%disp(mse);
%disp((255*255)/mse);
PSNR=10*log10(ceil(255*255)/mse);
disp(PSNR);
%Noisy and Original Image
mse=0;
for i=1:row-mask+1
    for j=1:col-mask+1
        if I5(i,j)<I6(i,j)
            I6(i,j)=I6(i,j)-I5(i,j);
        else
            I6(i,j)=I5(i,j)-I6(i,j);
        end
        val=uint16(I6(i,j));
        %disp(val);
        mse=mse+uint32(val*val);
        %disp(mse);
    end
end
%disp(mse);
mse=double(mse/(row*col));
%disp(mse);
%disp((255*255)/mse);
PSNR=10*log10(ceil(255*255)/mse);
disp(PSNR);

figure()
subplot(1,3,1)
imshow(I,[])
title('original image')
subplot(1,3,2)
imshow(I3,[0,256])
title('Noisy Image')
subplot(1,3,3)
imshow(I2,[0,256])
title('K-MEANS Image')