% 2D TRANSLATION

A=load('image/l256.dat');
[row, column] = size(A);
prompt = 'Enter the right shift amount : ';
right = input(prompt);
prompt = 'Enter the upward shift amount : ';
upward = input(prompt);
B = zeros(size(A));
for i = 1:row
    for j = 1:column     
            mat1 = [1 0 upward; 0 1 right; 0 0 1];
            mat2 = [i; j; 1];
            mat3 = mat1*mat2;
            x1 = round(mat3(1, 1));
            y1 = round(mat3(2, 1));
            if(x1>row)
                diff=x1-row;
                x1=diff;
            end;
            if(y1>column)
                diff=y1-column;
                y1=diff;
            end;
            B(x1, y1) = A(i, j);
    end
end
figure, imshow(B, [0, 255])