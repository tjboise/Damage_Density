### This repository includes some methods to process images or videos from IR camera.

---

1. **IRvideo**: This file folder is mainly used to process videos🌵
2. **IRimage**: This file folder is mainly used to process images.
- *boundary_image.m*: segment objects by find the boundary of the object.
<div align="center">
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimage_matlab/boundary_image1.jpg" width=15%/> 
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimage_matlab/boundary_image2.jpg" width=15%/>
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimage_matlab/boundary_image3.jpg" width=15%/>  
</div>

- *K_means1.m*: use k-means algorithm to segment the boundary of the object.
<div align="center">
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimage_matlab/kmeans.png" width=15%/> 
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimage_matlab/kmeans1.png" width=15%/>
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimage_matlab/kmeans2.png" width=15%/>
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimage_matlab/kmeans3.png" width=15%/> 
</div>

- *Globalthresholdseg.m*: use global threshold to segment the boundary of the object.
<div align="center">
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimage_matlab/Global_threshold.jpg" width=15%/> 
</div>


3. **DamageDensity**: This file foler is to calculate the index "damage density" in a IR image🌳

*preprocess.m*: Evaluate the performance of different preprocess methods.

*overallprocess.m*: The overall procedure to preprocess and segment the IR images. The results includes:

 1. all the processed images
 2. damages' area
