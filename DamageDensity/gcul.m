%% This code mainly calculates the damage density
%% read imageN = 500; % 每个维度的数据点数
% 网格化x,y二维空间
[X,Y] = meshgrid(linspace(xmin,xmax,N),linspace(ymin,ymax,N));
% 采用插值法扩展数据，可用方法有'linear'(default)|'nearest'|'natural'|'cubic'|'v4'|
Z = griddata(x,y,z,X,Y,'v4');
%% 等高线法
figure('NumberTitle','off','Name','等高线法','Color','w','MenuBar','none','ToolBar','none');
contourf(X,Y,Z,N, 'LineColor','none');
colormap('jet');
colorbar;
axis off;
%% 投影图法
figure('NumberTitle','off','Name','投影图法','Color','w','MenuBar','none','ToolBar','none');
surf(X,Y,Z,'LineStyle','none');
xlim([min(X(:)) max(X(:))]);
ylim([min(Y(:)) max(Y(:))]);
axis off;
colormap('jet');
colorbar;
shading interp;
view(0,90);
%% imagesc法
figure('NumberTitle','off','Name','imagesc法','Color','w','MenuBar','none','ToolBar','none');
% 因为图像坐标和笛卡尔坐标起始位置不一样，需要上下翻转
imagesc(flipud(Z));
colormap('jet');
colorbar;
axis off;
%% pcolor法
figure('NumberTitle','off','Name','pcolor法','Color','w','MenuBar','none','ToolBar','none');
pcolor(X,Y,Z);
colormap('jet');
colorbar;
shading interp;
axis off;
[file_name, pathname] = uigetfile( '*.*','choose a file');
I1 = imread([pathname,'/',file_name]); 
dirc='test1';
%% crop the ROI
[m, n, z] = size(I1);
figure(1),imshow(I1);
h=imrect;%use mouse get the ROI
pos=getPosition(h);%get the position,
I1 = imcrop( I1, pos );
%figure(1),imshow(I1);
imwrite(I1,[pathname,dirc,'/original_',file_name]);
%% get the location of the eage of defects
K1=histeq(I1);
imwrite(K1,[pathname,dirc,'/preprocess_',file_name]);
% K1=rgb2gray(K1);
%%
%level = graythresh(K1);
level=200/255;
%%
BW = im2bw(K1,level);
%se=strel('square',10);
%se1=strel('square',10);
%BW=imdilate(BW,se);
%BW=imerode(BW,se1);
figure(2),imshow(BW);
imwrite(BW,[pathname,dirc,'/bw_',file_name]);
[GX0,GY0]=gradient(BW);
G0=sqrt(GX0.*GX0+GY0.*GY0);
imwrite(G0,[pathname,dirc,'/edge_',file_name]);
figure(3),imshow(G0);
%% calculate the gradient
[areacount,MajorAxis,MinorAxis,BW_seg,geshu,fuhe,stats]=tiqu(BW);

x=find(G0~=0);
I1=rgb2gray(I1);
A=double(I1);
[GX,GY]=gradient(A);
G=sqrt(GX.*GX+GY.*GY);
mean_gradient=mean(G);

mean_gradient1=mean(G(x));% get the mean gradient
sum_gradient=sum(G(x));
figure(4),imshow(G);
imwrite(G,[pathname,dirc,'/Gradientoriginal_',file_name]);
G1=mat2gray(G);
imwrite(G1,[pathname,dirc,'/Gradient_',file_name]);
figure(5),imshow(G1);
% mean_gradient=mean(G(x));% get the mean gradient
% sum_gradient=sum(G(x));
% subplot(3,2,3),histogram(G1);
% level = graythresh(G1);
% BW = im2bw(G1,level);
% imwrite(BW,'/Users/zhangtianjie/Documents/IR/Specialissue/damage_density/test1/bw2.jpg');
% figure(6),imshow(BW);
sum_areacount=sum(areacount);