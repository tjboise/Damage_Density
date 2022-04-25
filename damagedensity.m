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
imwrite(I1,[pathname,'/','cropped_image.jpg']);

%% histeq
K=histeq(I1);
imwrite(K,[pathname,'/','histeq.jpg']);

%% segment
level = graythresh(K);
BW = im2bw(K,level);
imwrite(BW,[pathname,'/','segmented_image.jpg']);
%% postprocess
A22=imdilate(BW,strel('diamond',10));
A22=imerode(A22,strel('diamond',5));
imwrite(A22,[pathname,'/','postprocess.jpg']);
%% account area
image_in=A22;
[areacount,MajorAxis,MinorAxis,BW_seg,geshu,fuhe,stats]=tiqu(image_in);

%% calculate gradient map
I1=rgb2gray(I1);
A=double(I1);
[GX,GY]=gradient(A);
G=sqrt(GX.*GX+GY.*GY);
imwrite(G,[pathname,'/','gradientmap.jpg']);
G1=mat2gray(G);
imwrite(G1,[pathname,'/','gradientmap_normalized.jpg']);

%% detect the edge
[GX0,GY0]=gradient(A22);
G0=sqrt(GX0.*GX0+GY0.*GY0);
imwrite(G0,[pathname,'/','edge.jpg']);

x=find(G0~=0);

%% calculate the mean gradient of the edge in raw image
mean_gradient1=mean(G(x));% get the mean gradient

disp('mean_gradient:')
disp(mean_gradient1)



