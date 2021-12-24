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
imwrite(I1,'/Users/zhangtianjie/Documents/IR/Specialissue/mainprocess/original.jpg');
%% histeq
K=histeq(I1);
imwrite(K,'/Users/zhangtianjie/Documents/IR/Specialissue/mainprocess/histeq.jpg');
level = graythresh(K);
BW = im2bw(K,level);

A22=imdilate(BW,strel('diamond',30));
A22=imerode(A22,strel('diamond',5));
imwrite(A22,'/Users/zhangtianjie/Documents/IR/Specialissue/mainprocess/final.jpg');
[areacount22,MajorAxis22,MinorAxis22,BW_seg,geshu,fuhe,stats]=tiqu(A22);
