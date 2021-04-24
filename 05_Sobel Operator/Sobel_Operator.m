clc;
close all;
% Display the original Image
mycolourimage = imread('lena.jpg');
imshow(mycolourimage); title('Original Color Image');
myimage = rgb2gray(mycolourimage);
subplot(1,4,1);
imshow(myimage); title('Original Image');

% Apply Sobel Operator
% Display only the horizontal Edges
sobelhz = edge(myimage,'sobel','horizontal');
subplot(1,4,2);
imshow(sobelhz,[]); title('Sobel - Horizontal Edges');
% Display only the vertical Edges
sobelvrt = edge(myimage,'sobel','vertical');
subplot(1,4,3);
imshow(sobelhz,[]); title('Sobel - Vertical Edges');

% Display both horizontal and vertical Edges
sobelvrthz = edge(myimage,'sobel','both');
subplot(1,4,4);
imshow(sobelvrthz,[]); title('Sobel - All edges');
