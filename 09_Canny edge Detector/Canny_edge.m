clc;
close all;
clear all;
  
% Read Colour Image and convert it to a grey level Image
% Display the original Image
mycolourimage = imread('lena.jpg');
myimage = rgb2gray(mycolourimage);
subplot(1,2,1); 
imshow(myimage); title('Original Image');
  
% Apply Canny edge detection   
cannyedg = edge(myimage,'canny');
subplot(1,2,2); 
imshow(cannyedg,[]); title('Final Image');

%Canny Edge Detector gives the best results compared to other filters/masks used to detect the edges in an image.