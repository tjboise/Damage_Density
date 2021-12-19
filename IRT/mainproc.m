%% import image
[file_name, pathname] = uigetfile( '*.*','????????????');
I1 = imread([pathname,'/',file_name]); 

%% crop the ROI
[m, n, z] = size(I1);
figure(1),imshow(I1)%original

h=imrect;%use mouse get the ROI
pos=getPosition(h);%get the position,
%pos有四个值，分别是矩形框的左下角点的坐标 x y 和 框的 宽度和高度

I1 = imcrop( I1, pos );
figure(2),imshow(I1);
%% pre-processing
I=I1;
figure(3);
subplot(231);imshow(I,[]);title('原始图像');
subplot(234);imhist(I);title('由原始图像得到的直方图');
J=imadjust(I,[0.15 0.9],[0 1]);
subplot(232);imshow(J);title('由新直方图得到的新图像');
subplot(235);imhist(J);title('利用imadjust调节后的新直方图');
K=histeq(I);
subplot(233);imshow(K);title('由均衡化后的直方图得到的均衡后的图像');
subplot(236);imhist(K);title('均衡化后的直方图');

levelI = graythresh(I);BWI = im2bw(I,levelI);
levelJ = graythresh(J);BWJ = im2bw(J,levelJ);
levelK = graythresh(K);BWK = im2bw(K,levelK);
figure(4);
subplot(2,2,1),imshow(BWI);
subplot(2,2,2),imshow(BWJ);
subplot(2,2,3),imshow(BWK);

%% 
figure(5);
A=BWK;
subplot(2,3,1);
imshow(A)
title('噪声图像')
se=strel('square',30);
A2=imerode(A,se);
subplot(2,3,2);
imshow(A2)
title('腐蚀后的图像')
A3=imopen(A,se);
subplot(2,3,3);
imshow(A3)
title('A的开操作')
A4=imdilate(A3,se);
subplot(2,3,4);
imshow(A4)
title('开操作的膨胀')
A5=imclose(A3,se);
subplot(2,3,5);
imshow(A5)
title('开操作的闭操作')
se1=strel('square',5);
A6=imdilate(A,se);
A6=imerode(A6,se1);
subplot(2,3,6);
imshow(A6)

