%% pre-process evaluation

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
imwrite(I1,'/Users/zhangtianjie/Documents/IR/Specialissue/preprocess/defects1_1/original.jpg');
%% histrec
J=imadjust(I1,[0.4 0.7],[0 1]);
imwrite(J,'/Users/zhangtianjie/Documents/IR/Specialissue/preprocess/defects1_1/resizehist.jpg');
%% histeq
K=histeq(I1);
imwrite(K,'/Users/zhangtianjie/Documents/IR/Specialissue/preprocess/defects1_1/histeq.jpg');
%% mean
h1 = fspecial('average',3);
P1=imfilter(I1,h1);
imwrite(P1,'/Users/zhangtianjie/Documents/IR/Specialissue/preprocess/defects1_1/mean.jpg');
%% median
h2 = fspecial('unsharp');
P2=imfilter(I1,h2);
imwrite(P2,'/Users/zhangtianjie/Documents/IR/Specialissue/preprocess/defects1_1/log.jpg');
%% Gaussian
h3 = fspecial('gaussian',3);
P3=imfilter(I1,h3);
imshow(P3);
imwrite(P3,'/Users/zhangtianjie/Documents/IR/Specialissue/preprocess/defects1_1/gaussian.jpg');


