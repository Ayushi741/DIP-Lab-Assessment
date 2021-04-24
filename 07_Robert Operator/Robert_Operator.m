% MATLAB Code for Robert operator
% Basic Edge detection Mask

% Read Input Image
input_image = imread('lena.jpg');

% Displaying Input Image
input_image = uint8(input_image);
figure, imshow(input_image); title('Input Image');

% Convert the truecolor RGB image to the grayscale image
input_image = rgb2gray(input_image);

% Convert the image to double
input_image = double(input_image);

% Pre-allocate the filtered_image matrix with zeros
filtered_image = zeros(size(input_image));

% Robert Operator Mask
Mx = [1 0; 0 -1];
My = [0 1; -1 0];

% Edge Detection Process
for i = 1:size(input_image, 1) - 1
	for j = 1:size(input_image, 2) - 1

		% Gradient approximations
		Gx = sum(sum(Mx.*input_image(i:i+1, j:j+1)));
		Gy = sum(sum(My.*input_image(i:i+1, j:j+1)));
				
		% Calculate magnitude of vector
		filtered_image(i, j) = sqrt(Gx.^2 + Gy.^2);
		
	end
end

% Displaying Filtered Image
filtered_image = uint8(filtered_image);
figure, imshow(filtered_image); title('Filtered Image');

% Define a threshold value
thresholdValue = 100; % varies between [0 255]
output_image = max(filtered_image, thresholdValue);
output_image(output_image == round(thresholdValue)) = 0;

% Displaying Output Image
output_image = im2bw(output_image);
figure, imshow(output_image); title('Edge Detected Image');

%In the output image, we can observe that the Diagonal direction points are
%preserved but the edge detection is not very accurate.
