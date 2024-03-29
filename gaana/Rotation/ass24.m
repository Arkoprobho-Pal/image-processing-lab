% Rotation of image

A=load('image/l256.dat');
[row, column] = size(A);
figure(1), imshow(A, [0, 255]);
prompt = 'Enter the value of theta : ';
theta = input(prompt);
theta = (3.14*theta/180);
B = zeros(size(A));
a0 = cos(theta);
b0 = sin(theta);
a1 = -b0;
b1 = a0;
for i = 1:row
    for j = 1:column
            mat1 = [a0 a1 0; b0 b1 0; 0 0 1];
            mat2 = [i; j; 1];
            mat3 = mat1*mat2;
            x1 = round(mat3(1, 1));
            y1 = round(mat3(2, 1));
            if((x1>=1 && y1>=1) && (x1 <= row && y1 <= column))
                B(x1, y1) = A(i, j);
            end
    end
end
figure(2), imshow(B, [0, 255]);