clc;
close all;
clear all;

% Read Colour Image and convert it to a grey level Image
% Display the original Image
mycolourimage = imread('lena.jpg');
myimage = rgb2gray(mycolourimage);
subplot(1,2,1);
imshow(myimage); title('Original Image');

% Apply LOG edge detection
% The sigma used is 3
f=fspecial('log',[15,15],3.0);
logedg1 = edge(myimage,'zerocross',[],f);
subplot(1,2,2);
imshow(logedg1); title('Log with sigma 3');
