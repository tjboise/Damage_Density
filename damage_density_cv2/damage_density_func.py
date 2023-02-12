import cv2
import matplotlib.pyplot as plt
import numpy as np
from skimage import data, util
from skimage.measure import label, regionprops
from skimage import measure, morphology

#imread
img_path = '../IRimages/June30/3333.jpg'
img = cv2.imread(img_path,cv2.IMREAD_GRAYSCALE)
m,n = img.shape
#histeq
#plt.imshow(img)
# (b, g, r) = cv2.split(img)
# bH = cv2.equalizeHist(b)
# gH = cv2.equalizeHist(g)
# rH = cv2.equalizeHist(r)
# histeq = cv2.merge((bH, gH, rH))
histeq = cv2.equalizeHist(img)

#plt.imshow(histeq)

#segment
#t1, result_img = cv2.threshold(img, 127, 255, cv2.THRESH_BINARY)
t2, otsu_img = cv2.threshold(histeq, 0, 255, cv2.THRESH_BINARY+cv2.THRESH_OTSU)
plt.imshow(otsu_img)
#postprocess
kernel = cv2.getStructuringElement(cv2.MORPH_RECT, (3, 3))
#kernel = np.ones((1, 1), dtype=np.uint8)
# dilate = cv2.dilate(otsu_img, kernel, 1)
# erosion = cv2.erode(dilate, kernel, iterations=1)
erosion = cv2.morphologyEx(otsu_img, cv2.MORPH_CLOSE, kernel, iterations=1)
#plt.imshow(erosion)

# account area
def account_area(erosion):
    img = erosion.copy()
    # thresh_B = np.zeros(erosion.shape, np.unit8)
    # img = util.img_as_ubyte(img2) > 110
    label_img = label(img, connectivity=img.ndim)
    props = regionprops(label_img)
    # centroid of first labeled object
    #     props[0].centroid

    # centroid of first labeled object
    #     props[0]['centroid']
    return props


props = account_area(erosion)

areas = []
major_length = []

min_length = []

for prop in props:

    if prop.area > 4000:
        areas.append(prop.area)
        major_length.append(prop.major_axis_length)
        min_length.append(prop.minor_axis_length)


sobelx = cv2.Sobel(img,cv2.CV_64F,1,0,ksize=3)#默认ksize=3
sobely = cv2.Sobel(img,cv2.CV_64F,0,1)
gm = cv2.sqrt(sobelx ** 2 + sobely ** 2)
print(gm/255)
plt.imshow(gm)

#erosion = otsu_img
sobelx0 = cv2.Sobel(erosion,cv2.CV_64F,1,0,ksize=3)#默认ksize=3
sobely0 = cv2.Sobel(erosion,cv2.CV_64F,0,1)
gm0 = cv2.sqrt(sobelx0 ** 2 + sobely0 ** 2)
plt.imshow(gm0)

b = np.nonzero(gm0)
# print(b)
# c = np.vstack((b[0],b[1]))
# print(c)
gm = gm/255
mean_gradient = np.mean(gm[b[0]][b[1]])

damage_density=mean_gradient*sum(areas)/(m*n)

print(damage_density)





