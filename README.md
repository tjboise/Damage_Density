### The purpose of this repository is to process the IR_images obtained from civil infrastructures, analyze and transfer the results to what engineers and decision-makers needed.


#### Images --> Segment -->Damage density index -->application
---


An new index was proposed to quantify the defects intensity.

 **DamageDensity**: This file foler is to calculate the index "damage density" in a IR image🌳

Framework to calculate the damage density in infrastructure

<div align="center">
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimages/damageindex_images/framework.png" width=60%/> 
</div>


<div align="center">
<img width="300" alt="image" src="https://user-images.githubusercontent.com/95270677/164761702-882518bf-ed66-4ca8-9283-04b9626c336d.png">
</div>


*preprocess.m*: Evaluate the performance of different preprocess methods.

*postprocess.m*: Evaluate the performance of different postprocess methods.

*overallprocess.m*: The overall procedure to preprocess and segment the IR images. The results includes:

 1. all the processed images
 2. damages' area

*area_account.m*: To get the damages' area.

*gcul.m*: Calculate the gradient on the edge of damages.




---




Results of some lab tests: 

<div align="center">
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimages/damageindex_images/dd.png" width=60%/> 
</div>


It was shown that the index damage density has a positive linear relationship (the correlation coefficient is 0.94) with total
volumes of the subsurface voids in the detection area compared to traditional image segmentation methods. 

<div align="center">
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimages/damageindex_images/volume1.png" width=60%/> 
</div>


---

---
**The image process method:**

**A demo:**

The original image is like this:
<div align="center">
<img src="https://github.com/TianjieZhang1993/IRI_image_process/blob/main/IRimages/oriimg/21inch-135-2nd.jpg" width=30%/> 
</div>

 **IRimage_matlab**+**IRimage_opencv**: These two file folders are mainly used to process and segment images.

#### Mainly included three main kinds of image processing methods:

- *boundary_image.m*: segment objects **by find the boundary of the object**.
<div align="center">
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimage_matlab/boundary_image1.jpg" width=15%/> 
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimage_matlab/boundary_image2.jpg" width=15%/>
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimage_matlab/boundary_image3.jpg" width=35%/>  
</div>

- *K_means1.m*:  segment objects **by clustering**.
<div align="center">
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimage_matlab/kmeans.png" width=15%/> 
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimage_matlab/kmeans1.png" width=15%/>
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimage_matlab/kmeans2.png" width=15%/>
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimage_matlab/kmeans3.png" width=15%/> 
 
![image](https://user-images.githubusercontent.com/95270677/162312473-ed69729b-dd03-4235-b690-8f128d4dab98.png)
</div>

- *Globalthresholdseg.m*: segment objects by **global threshold**.
<div align="center">
<img src="https://github.com/TianjieZhang1993/IRimage_Club/blob/main/IRimage_matlab/Global_threshold.jpg" width=15%/> 
</div>







2. **IRvideo**: This file folder is mainly used to process videos🌵

---




