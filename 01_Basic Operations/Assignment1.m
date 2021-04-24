
% Basic implementation of Image processing Functions in MatLab.
% Read an Image
B = imread('sample1.jpg');
% Size of an image
[M,N] = size(B);
whos B
% Display an image
figure('Name','RGB Image')
imshow(B)

%To navigate within image
%imtool(B) 

%To obtain pixel value of the marked coordinates
Pixels_B = impixel(B);
disp(Pixels_B);

%To obtain the pixel value wrt  cursor position
impixelinfo

%Converting an RGB Image into Grayscale Image
C = rgb2gray(B);
[Q,R] = size(C);
whos C
figure('Name','Grayscale Image')
imshow(C)

%Displaying Image Information
info_1 = imageinfo('sample1.jpg');
info_2 = imageinfo('sample2.jpg');

%Displaying Multiple Images within one figure
figure('Name','RGB and Grayscale Image')
subplot(1,2,1),imshow(B)
subplot(1,2,2),imshow(C)
impixelinfo

%Obtaining Average Pixel intensity of the Image
Avg_Pixel = mean(B(:));
disp(Avg_Pixel)

% Extracting color channels.
RedChannel = B(:,:,1); % Red channel
GreenChannel = B(:,:,2); % Green channel
BlueChannel = B(:,:,3); % Blue channel

%Obtaining Average pixel intensity of each color in the image
Mean_R = mean2(RedChannel);
Mean_G = mean2(GreenChannel);
Mean_B = mean2(BlueChannel);
disp(Mean_R)
disp(Mean_G)
disp(Mean_B)









