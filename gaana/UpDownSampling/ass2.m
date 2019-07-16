%downsampling from 256x256 to 128x128

I=load('image/l256.dat');
imshow(I,[0,255]);
[r,c]=size(I);
rn=r/2;
cn=c/2;
i=1;j=1;k=1;l=1;
Q=zeros(rn,c);
while(i<=r)
    if(mod(i,2)==1)
        Q(k,:)=I(i,:);
        k=k+1;
    end;
    i=i+1;
end;
R=zeros(rn,cn);
while(j<=c)
    if(mod(j,2)==1)
        R(:,l)=Q(:,j);
        l=l+1;
    end;
    j=j+1;
end;
figure,imshow(R,[0,256]);

%downsampling from 128x128 to 64x64

rnt=rn/2;
cnt=cn/2;
S=zeros(rnt,cn);
i=1;j=1;k=1;l=1;
while(i<=rn)
    if(mod(i,2)==1)
        S(k,:)=R(i,:);
        k=k+1;
    end;
    i=i+1;
end;
T=zeros(rnt,cnt);
while(j<=cn)
    if(mod(j,2)==1)
        T(:,l)=S(:,j);
        l=l+1;
    end;
    j=j+1;
end;
figure,imshow(T,[0,256]);

%Upsampling from 64x64 to 128x128 
i=1;j=1;k=1;l=1;
newr=rnt*2;
newc=cnt*2;
S=zeros(newr,cnt);
while(i<=rnt)
    S(k,:)=T(i,:);
    S(k+1,:)=T(i,:);
    k=k+2;
    i=i+1;
end;
U=zeros(newr,newc);
while(j<=cnt)
    U(:,l)=S(:,j);
    U(:,l+1)=S(:,j);
    l=l+2;
    j=j+1;
end;
figure,imshow(U,[0,255]);

%Upsampling from 128x128 to 256x256
i=1;j=1;k=1;l=1;
newrn=newr*2;
newcn=newc*2;
X=zeros(newrn,newc);
while(i<=newr)
    X(k,:)=U(i,:);
    X(k+1,:)=U(i,:);
    k=k+2;
    i=i+1;
end;
Y=zeros(newrn,newcn);
while(j<=newc)
    Y(:,l)=X(:,j);
    Y(:,l+1)=X(:,j);
    l=l+2;
    j=j+1;
end;
figure,imshow(Y,[0,255]);

%Upsampling by averaging 2 rows from 64x64 to 128x128

% i=1;j=1;k=1;l=1;
% newr=rnt*2;
% newc=cnt*2;
% A=zeros(newr,cnt);
% temp=zeros(1,cnt);
% T=[T;temp];
% tempans=zeros(1,cnt);
% while(i<=rnt)
%     temp=T(i,:);
%     tempn=T(i+1,:);
%     tempans(1,:)=round((temp+tempn)/2);
%     A(k,:)=tempans(1,:);
%     A(k+1,:)=A(k,:);
%     k=k+2;
%     i=i+1;
% end;
% B=zeros(newr,newc);
% temp=zeros(newr,1);
% A=[A temp];
% tempans=zeros(rnt,1);
% j=1;
% while(j<=cnt)
%     temp=A(:,j);
%     tempn=A(:,j+1);
%     tempans(:,1)=round((temp+tempn)/2);
%     B(:,l)=tempans(:,1);
%     B(:,l+1)=B(:,l);
%     l=l+2;
%     j=j+1;
% end;
% imshow(B,[0,255]);
