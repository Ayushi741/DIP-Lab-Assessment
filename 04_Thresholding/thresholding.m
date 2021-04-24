%Code for Thresholding
%Thresholding is the simplest method of image segmentation 
%Most common way to convert a grayscale image to a binary image
% Input - Grayscale/RGB Image ;  Output- Binary Image

clc;
x=imread('lena.jpg');
subplot(1,3,1);
imshow(x); title('Original Image');
x=rgb2gray(x);
subplot(1,3,2);
imshow(x); title('Grayscale Image');
x=double(x);
tot=0;
[a,b]=size(x);
y=zeros(a,b);
for i=1:a
    for j=1:b
        y(i,j)=0;
    end
end
for i=1:a
    for j=1:b
        tot=tot+x(i,j);
    end
end
thr=tot/(a*b);
for i=1:a
    for j=1:b
        if x(i,j) > thr
            y(i,j)=0;
        else
            y(i,j)=1;
        end
    end
end
subplot(1,3,3);
imshow(y);title('Output Image');