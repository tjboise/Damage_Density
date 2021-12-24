%% import image
[file_name, pathname] = uigetfile( '*.*','choose a file');
I1 = imread([pathname,'/',file_name]); 

%% crop the ROI
[m, n, z] = size(I1);
figure(1),imshow(I1)%original

h=imrect;%use mouse get the ROI
pos=getPosition(h);%get the position,
%pos有四个值，分别是矩形框的左下角点的坐标 x y 和 框的 宽度和高度

I1 = imcrop( I1, pos );
figure(2),imshow(I1);
%imwrite(I1,[])
%% pre-processing
I=I1;
imwrite(I,'/Users/zhangtianjie/Documents/IR/Specialissue/crop.jpg');

% figure(3);
% subplot(251);imshow(I,[]);title('原始图像');
% subplot(256);imhist(I);title('由原始图像得到的直方图');
J=imadjust(I,[0.4 0.7],[0 1]);
imwrite(J,'/Users/zhangtianjie/Documents/IR/Specialissue/0.4_0.7.jpg');
% subplot(252);imshow(J);title('由新直方图得到的新图像');
figure,imshow(J);
% subplot(257);imhist(J);title('利用imadjust调节后的新直方图');
J1=imadjust(I,[0.3 0.75],[0 1]);
imwrite(J1,'/Users/zhangtianjie/Documents/IR/Specialissue/0.3_0.75.jpg');
figure,imshow(J1);
% subplot(253);imshow(J1);title('由新直方图得到的新图像');
% subplot(258);imhist(J1);title('利用imadjust调节后的新直方图');
J2=imadjust(I,[0.5 0.8],[0 1]);
imwrite(J2,'/Users/zhangtianjie/Documents/IR/Specialissue/0.5_0.8.jpg');
% subplot(254);imshow(J2);title('由新直方图得到的新图像');
figure,imshow(J2);
% subplot(259);imhist(J2);title('利用imadjust调节后的新直方图');
% 
K=histeq(I);
% subplot(255);imshow(K);title('由均衡化后的直方图得到的均衡后的图像');
% subplot(2,5,10);imhist(K);title('均衡化后的直方图');
figure,imshow(K);
imwrite(K,'/Users/zhangtianjie/Documents/IR/Specialissue/histeq.jpg');
levelI = graythresh(I);BWI = im2bw(I,levelI);
levelJ = graythresh(J);BWJ = im2bw(J,levelJ);
levelJ1 = graythresh(J1);BWJ1 = im2bw(J1,levelJ1);
levelJ2 = graythresh(J2);BWJ2 = im2bw(J2,levelJ2);
levelK = graythresh(K);BWK = im2bw(K,levelK);
% figure(4);
figure;
subplot(2,3,1),imshow(BWI);
subplot(2,3,2),imshow(BWJ);
subplot(2,3,3),imshow(BWJ1);
subplot(2,3,4),imshow(BWJ2);
subplot(2,3,5),imshow(BWK);

