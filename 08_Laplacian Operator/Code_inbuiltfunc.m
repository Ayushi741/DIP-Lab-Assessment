clc;
close all;
clear all;

% Read Colour Image and convert it to a grey level Image
% Display the original Image
mycolourimage = imread('lena.jpg');
myimage = rgb2gray(mycolourimage);
subplot(3,3,1);
imshow(myimage); title('Original Image');

% Apply Laplacian Filter
f=fspecial('laplacian');
lapedg = imfilter(myimage,f,'symmetric');
subplot(3,3,7);
imshow(lapedg,[]); title('Laplacian Filter');
