# Bit Slicing.

# Importing necessary packages.
import numpy as np
import cv2

# As color images are 16-bit and we have to work with 8-bit, image is read in Grayscale.
inp = cv2.imread('C:\\Users\\AYUSHI\\Desktop\\Assignments\\DIP\\lena512.bmp', 0)
# Image Resizing
img = cv2.resize(inp, (200, 200))

binlist = []
# img.shape has two values
# img.shape[0] has row count
# img.shape[1] has column count
row, col = img.shape

for i in range(row):
    for j in range(col):
        binlist.append(np.binary_repr(img[i][j], width=8))
# np.binary_repr(input_number,width)
# Returns binary form of input_number, where width defines the number of bits.

# We have a list of strings where each string represents binary pixel value

# np.unit8: 8-bit integer representation.
# A matrix is created using np.array and np.reshape functions using row and col values.
# Hence 8 matrices are created of sixe row x col.
# Multiply with 2^(n-1) for the respective bit and the sliced bit image is formed, n = 1,2,3,4,5,6,7,8
img8 = (np.array([int(i[0]) for i in binlist], dtype=np.uint8) * 128).reshape(row, col)
img7 = (np.array([int(i[1]) for i in binlist], dtype=np.uint8) * 64).reshape(row, col)
img6 = (np.array([int(i[2]) for i in binlist], dtype=np.uint8) * 32).reshape(row, col)
img5 = (np.array([int(i[3]) for i in binlist], dtype=np.uint8) * 16).reshape(row, col)
img4 = (np.array([int(i[4]) for i in binlist], dtype=np.uint8) * 8).reshape(row, col)
img3 = (np.array([int(i[5]) for i in binlist], dtype=np.uint8) * 4).reshape(row, col)
img2 = (np.array([int(i[6]) for i in binlist], dtype=np.uint8) * 2).reshape(row, col)
img1 = (np.array([int(i[7]) for i in binlist], dtype=np.uint8) * 1).reshape(row, col)



# Arranging all 8 images into 2 rows and 4 columns.
f1 = cv2.hconcat([img8, img7, img6, img5])
f2 = cv2.hconcat([img4, img3, img2, img1])
f = cv2.vconcat([f1, f2])

# Displaying the Image.
cv2.imshow('a', f)
cv2.waitKey(0)
