### This repository includes some methods to process images or videos from IR camera.

---

1. **IRvideo**: This file folder is mainly used to process videos🌵

---

2. **IRimage**: This file folder is mainly used to process images.
- *boundary_image.m*: segment objects by find the boundary of the object.
<div align="center">
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimage_matlab/boundary_image1.jpg" width=15%/> 
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimage_matlab/boundary_image2.jpg" width=15%/>
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimage_matlab/boundary_image3.jpg" width=35%/>  
</div>

- *K_means1.m*: use k-means algorithm to segment the boundary of the object.
<div align="center">
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimage_matlab/kmeans.png" width=15%/> 
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimage_matlab/kmeans1.png" width=15%/>
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimage_matlab/kmeans2.png" width=15%/>
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimage_matlab/kmeans3.png" width=15%/> 
 
![image](https://user-images.githubusercontent.com/95270677/162312473-ed69729b-dd03-4235-b690-8f128d4dab98.png)
</div>

- *Globalthresholdseg.m*: use global threshold to segment the boundary of the object.
<div align="center">
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimage_matlab/Global_threshold.jpg" width=15%/> 
</div>

---

3. **DamageDensity**: This file foler is to calculate the index "damage density" in a IR image🌳

Framework to calculate the damage density in infrastructure

<div align="center">
<img src="" width=15%/> 
</div>




*preprocess.m*: Evaluate the performance of different preprocess methods.

*postprocess.m*: Evaluate the performance of different postprocess methods.

*overallprocess.m*: The overall procedure to preprocess and segment the IR images. The results includes:

 1. all the processed images
 2. damages' area

*area_account.m*: To get the damages' area.

*gcul.m*: Calculate the gradient on the edge of damages.

*gradient_main.m*: To process the pictures like.

<div align="center">
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimages/%E5%9B%BE%E7%89%871.jpg" width=15%/> 
</div>



