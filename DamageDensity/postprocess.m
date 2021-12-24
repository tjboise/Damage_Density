%% post-process evaluation

%% import image
[file_name, pathname] = uigetfile( '*.*','choose a file');
I = imread([pathname,'/',file_name]); 


level = graythresh(I);
BW = im2bw(I,level);
imwrite(BW,[pathname,'/bw/','original',file_name]);
%% shape
A1=imdilate(BW,strel('square',30));
A1=imerode(A1,strel('square',5));
imwrite(A1,[pathname,'/bw/','square',file_name]);
[areacount1,MajorAxis1,MinorAxis1,BW_seg,geshu,fuhe,stats]=tiqu(A1);
A2=imdilate(BW,strel('rectangle',[30,30]));
A2=imerode(A2,strel('rectangle',[5,5]));
imwrite(A2,[pathname,'/bw/','rectangle',file_name]);
[areacount2,MajorAxis2,MinorAxis2,BW_seg,geshu,fuhe,stats]=tiqu(A2);
A22=imdilate(BW,strel('diamond',30));
A22=imerode(A22,strel('diamond',5));
imwrite(A22,[pathname,'/bw/','diamond',file_name]);
[areacount22,MajorAxis22,MinorAxis22,BW_seg,geshu,fuhe,stats]=tiqu(A22);
%% way
A3=imclose(BW,strel('square',30));
imwrite(A3,[pathname,'/bw/','imclose-square',file_name]);
[areacount3,MajorAxis3,MinorAxis3,BW_seg,geshu,fuhe,stats]=tiqu(A3);
A4=imclose(BW,strel('rectangle',[30,30]));
imwrite(A4,[pathname,'/bw/','imclose-rectangle',file_name]);
[areacount4,MajorAxis4,MinorAxis4,BW_seg,geshu,fuhe,stats]=tiqu(A4);
A5=imclose(BW,strel('diamond',30));
imwrite(A5,[pathname,'/bw/','imclose-diamond',file_name]);
[areacount5,MajorAxis5,MinorAxis5,BW_seg,geshu,fuhe,stats]=tiqu(A5);
%% size

% A5=imdilate(BW,strel('rectangle',[40,40]));
% A5=imerode(A5,strel('rectangle',[5,5]));
% imwrite(A5,[pathname,'/bw/','rectangle-40',file_name]);
% 
% A6=imdilate(BW,strel('rectangle',[50,50]));
% A6=imerode(A6,strel('rectangle',[5,5]));
% imwrite(A6,[pathname,'/bw/','rectangle-50',file_name]);

