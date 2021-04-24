%Matlab Code for Morphological operation - Dilation
% read image
I1=imread('lena.jpg');	
figure, imshow(I1); title('Original Image');
% convert to binary
I=im2bw(I1);
figure, imshow(I); title('Input Image');
% create structuring element			
se=ones(5, 5);

% store number of rows in P and number of columns in Q.		
[P, Q]=size(se);

% create a zero matrix of size I.		
In=zeros(size(I, 1), size(I, 2));

for i=ceil(P/2):size(I, 1)-floor(P/2)
	for j=ceil(Q/2):size(I, 2)-floor(Q/2)

		% take all the neighbourhoods.
		on=I(i-floor(P/2):i+floor(P/2), j-floor(Q/2):j+floor(Q/2));
		
		% take logical se
		nh=on(logical(se));	

		% compare and take minimum value of the neighbor
		% and set the pixel value to that minimum value.	
		In(i, j)=max(nh(:));	
	end
end
figure, imshow(In); title(' Image after applying Dilation');