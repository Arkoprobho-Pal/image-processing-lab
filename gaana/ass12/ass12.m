img = uint8(load('image/l256.dat'));
subplot(1,4,1), imshow(img);

[row,col] = size(img);
imgX = zeros(row,col);
imgY = zeros(row,col);
imgS = zeros(row,col);
dx = [1,-1];
dy = [1;-1];
neighbors = zeros(1,2);
for i=1:row
    for j=1:col
        if (isExists(i,j,row,col)); neighbors(1,1)=img(i,j); else neighbors(1,1)=0; end
        if (isExists(i,j+1,row,col)); neighbors(1,2)=img(i,j+1); else neighbors(1,2)=0; end
        
        imgX(i,j) = abs(neighbors(1,1)*dx(1,1) + neighbors(1,2)*dx(1,2));
    end
end
subplot(1,4,2), imshow(uint8(imgX));

for i=1:row
    for j=1:col
        if (isExists(i,j,row,col)); neighbors(1,1)=img(i,j); else neighbors(1,1)=0; end
        if (isExists(i+1,j,row,col)); neighbors(1,2)=img(i+1,j); else neighbors(1,2)=0; end
        
        imgY(i,j) = abs(neighbors(1,1)*dx(1,1) + neighbors(1,2)*dx(1,2));
    end
end
subplot(1,4,3), imshow(uint8(imgY));
subplot(1,4,4), imshow(uint8(imgX+imgY));