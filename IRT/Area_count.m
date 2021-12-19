%% count the number of defects
[file_name, pathname] = uigetfile( '*.*','????????????');
I = imread([pathname,'/',file_name]); 
imgdir=dir([pathname,'/*.jpg']);
level = graythresh(I);
BW = im2bw(I,level);

se=strel('square',10);
se1=strel('square',10);
A6=imdilate(BW,se);
A6=imerode(A6,se1);
image_in=A6;
[areacount,MajorAxis,MinorAxis,BW_seg,geshu,fuhe,stats]=tiqu(image_in);

%resultshow(image_in,geshu,fuhe,stats);
imwrite(image_in,[pathname,'/bw/',file_name]);
