# Importing necessary packages.
import numpy as np
from matplotlib import pyplot as plt

# 8-bit grayscale image represented by 8x8 array.
img=np.array([[52,55,61,59,79,61,76,61],
[62,59,55,104,94,85,59,71],
[63,65,66,113,144,104,63,72],
[64,70,70,126,154,109,71,69],
[67,73,68,106,122,88,68,68],
[68,79,60,70,77,66,58,75],
[69,85,64,58,55,61,65,83],
[70,87,69,68,65,73,78,90],
])

print("Original Matrix:\n",img)

#  Plotting the matrix in form of image.
plt.imshow(img, cmap = 'gray')
plt.xticks([]), plt.yticks([])
plt.show()

# Printing all the values present in 8x8 matrix and counting their frequency using np.unique
unique_elements, counts_elements = np.unique(img, return_counts=True)
print("Value\tCount")
for val,count in zip(unique_elements, counts_elements):
    print(val,"\t",count)

# Storing values and frequency in an array
hist=np.asarray((unique_elements, counts_elements))

print("Pixel Values:\n",hist[0][:])
print("Frequency:\n",hist[1][:])

# Finding Cumulative Distribution Frequency of the counts
cdf=hist[1][:].cumsum()
print("Cumulative Distribution Frequency:\n",cdf)

# Finding minumum element and length of CDF.
print("Minimum:{0}\tLength:{1}".format(cdf.min(),len(cdf)))

# Minimum pixel value is 52 and Maximum pixel value is 154. Now we have to scale this range of (52-154) into (0-255).

# Scaling the elements of the matrix.
out=[]
for i in range(len(cdf)):
    eq=round(((cdf[i]-1)/63)*255)
    out.append(eq)

print("Scaled Matrix:\n",out)

# Converting float values into 8-bit integer values.
hist_eq=np.uint8(np.asarray(out))
print("8-bit scaled matrix:\n",hist_eq)

# Creating key:value pairs for the scaled matrix.

kv = {hist[0][i]: hist_eq[i] for i in range(len(hist_eq))}
print("Old : New Pixel Values")
print(kv)


# Copying the old matrix.
new_img=img
print("Old Matrix:\n",new_img)

# Replacing the old elements with the scaled elements.
for i in range(8): 
    for j in range(8): 
            b=kv.get(new_img[i,j])
            new_img[i,j]=b

# Printing scaled matrix
print("New Matrix:\n",new_img)

# Plotting the scaled matrix in form of image.
plt.imshow(new_img, cmap = 'gray')
plt.xticks([]), plt.yticks([])
plt.show()
