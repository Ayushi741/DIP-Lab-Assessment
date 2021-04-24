clc;    % Clear the command window.
close all;  % Close all figures (except those of imtool.)
clear;  % Erase all existing variables. Or clearvars if you want.
workspace;  % Make sure the workspace panel is showing.
format long g;
format compact;
fontSize = 15;
baseFileName = 'lena.jpg'; % Assign the one on the button that they clicked on.
folder = fileparts(which('lena.jpg'));
fullFileName = fullfile(folder, baseFileName);
% Read in a demo image.
grayImage = imread(fullFileName);
% Display the image.
subplot(2, 2, 1);
imshow(grayImage, []);
axis on;
caption = sprintf('Original Image, %s', baseFileName);
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
xlabel('Column', 'FontSize', fontSize, 'Interpreter', 'None');
ylabel('Row', 'FontSize', fontSize, 'Interpreter', 'None');
drawnow;

% Get the dimensions of the image.  numberOfColorChannels should be = 3.
[rows, columns, numberOfColorChannels] = size(grayImage);
% Display the image.
subplot(2, 2, 2);
imshow(grayImage, []);
axis on;
caption = sprintf('Original Gray Scale Image');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
drawnow;
hp = impixelinfo();

% Display the thermal image.
subplot(2, 2, 2);
imhist(grayImage);
axis on;
grid on;
title('Histogram of Original image', 'FontSize', fontSize, 'Interpreter', 'None');
drawnow;

% Quantize the image into 5 levels.
quantizedImage = imquantize(grayImage, linspace(0, 255, 6));
fprintf('Min = %.1f, max = %.1f\n', min(quantizedImage(:)), max(quantizedImage(:)));
% Find out what gray levels are in the image.
unique(quantizedImage)
% Now it's in the range 1-5.  Convert it to the range 0-255
quantizedImage = uint8(255 * mat2gray(quantizedImage));
fprintf('Min = %.1f, max = %.1f\n', min(quantizedImage(:)), max(quantizedImage(:)));
% Find out what gray levels are in the image.
unique(quantizedImage)

% Display the quantized image.
subplot(2, 2, 3);
imshow(quantizedImage, []);
axis on;
caption = sprintf('Quantized Image');
title(caption, 'FontSize', fontSize, 'Interpreter', 'None');
drawnow;

% Display the histogram of quantized image.
subplot(2, 2, 4);
imhist(uint8(quantizedImage));
axis on;
grid on;
title('Histogram of Quantized Image', 'FontSize', fontSize, 'Interpreter', 'None');
drawnow;


set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0.05 1 0.95]);