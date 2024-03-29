A=load('image/l256.dat');
[row, column] = size(A);
figure(1), imshow(A, [0, 255]);
prompt = 'Enter the value of horizontal scaling factor : ';
Sx = input(prompt);
prompt = 'Enter the value of vertical scaling factor : ';
Sy = input(prompt);
B = zeros(size(A));
for i = 1:row
    for j = 1:column     
            mat1 = [Sx 0 0; 0 Sy 0; 0 0 1];
            mat2 = [i; j; 1];
            mat3 = mat1*mat2;
            x1 = round(mat3(1, 1));
            y1 = round(mat3(2, 1));
            B(x1, y1) = A(i, j);
    end
end
figure(2), imshow(B, [0, 255]);