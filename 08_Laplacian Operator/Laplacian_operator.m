clc 
clear all 
close all 
image=imread('lena.jpg');
imshow(image); title('Original Image');
filter=[0 -1 0 ; -1 5 -1 ; 0 -1 0];
rows = size(image,1);
cols = size(image,2);
outputimage = zeros(rows,cols);

for row = 2:rows-1
    for col = 2:cols-1
        for i=1:3
        outputimage (row,col,i)= sum (sum(double(image(row-1: row+1, col-1: col+1 , i)) .* filter )); 
        end
    end
end 
image =uint8(image);
figure,imshow (outputimage); title('Laplacian Filtered Image');