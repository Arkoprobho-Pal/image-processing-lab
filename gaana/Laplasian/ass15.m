img = uint8(load('image/l256.dat'));
subplot(1,2,1), imshow(img);

[row,col] = size(img);
imgX = zeros(row,col);

dx = [1,1,1;1,-8,1;1,1,1];
neighbors = zeros(1,9);
for i=1:row
    for j=1:col
        if (isExists(i-1,j-1,row,col)); neighbors(1,1)=img(i-1,j-1); else neighbors(1,1)=0; end
        if (isExists(i-1,j,row,col)); neighbors(1,2)=img(i-1,j); else neighbors(1,2)=0; end
        if (isExists(i-1,j+1,row,col)); neighbors(1,3)=img(i-1,j+1); else neighbors(1,3)=0; end
        if (isExists(i,j-1,row,col)); neighbors(1,4)=img(i,j-1); else neighbors(1,4)=0; end
        if (isExists(i,j,row,col)); neighbors(1,5)=img(i,j); else neighbors(1,5)=0; end
        if (isExists(i,j+1,row,col)); neighbors(1,6)=img(i,j+1); else neighbors(1,6)=0; end
        if (isExists(i+1,j-1,row,col)); neighbors(1,7)=img(i+1,j-1); else neighbors(1,7)=0; end
        if (isExists(i+1,j,row,col)); neighbors(1,8)=img(i+1,j); else neighbors(1,8)=0; end
        if (isExists(i+1,j+1,row,col)); neighbors(1,9)=img(i+1,j+1); else neighbors(1,9)=0; end
        
        imgX(i,j) = abs(neighbors(1,1)*dx(1,1) + neighbors(1,2)*dx(1,2) + neighbors(1,3)*dx(1,3) + neighbors(1,4)*dx(2,1) + neighbors(1,5)*dx(2,2) + neighbors(1,6)*dx(2,3) + neighbors(1,7)*dx(3,1) + neighbors(1,8)*dx(3,2) + neighbors(1,9)*dx(3,3));
    end
end
subplot(1,2,2), imshow(uint8(imgX));