%% multi RGM(region-grow-method) with 4pic
% [filename, pathname] = uigetfile( '*.*','select the picture');
% pathfile=fullfile(pathname, filename);
clc;
clear;
pathname=uigetdir('*.*','select a dir');
imgdir=dir([pathname,'/*.jpg']);
for i=1:length(imgdir)
    img=imread([pathname,'/',imgdir(i).name]);
I_gray=rgb2gray(img);
h=max(max(I_gray));
% bw=adaptivethreshold(I_gray,12,3,1);
% imshow(bw)
% histogram(I_gray);
S=double(h)/255;
T=0.03;
S=50/255;
[g,NR,SI,TI]=regiongrow(S,T,I_gray);
h=figure(i);
subplot(221),imshow(img),title('Original Image');
subplot(222),imshow(I_gray),title('Gray Image');
subplot(223),histogram(I_gray),title('Histogram');
subplot(224),imshow(TI),title({['Segmentation by Regiongrow'];...
['T=',num2str(T),',S=',num2str(S)]});
saveas(h,[pathname,'/region-grow-method/',imgdir(i).name])     %save
   close(i)            %close figure

end

%% Multi RGM
clc;
clear;
pathname=uigetdir('*.*','select a dir');
imgdir=dir([pathname,'/*.jpg']);
for i=1:length(imgdir)
    img=imread([pathname,'/',imgdir(i).name]);
I_gray=rgb2gray(img);
h=max(max(I_gray));
% bw=adaptivethreshold(I_gray,12,3,1);
% imshow(bw)
% histogram(I_gray);
S=double(h)/255;
T=0.03;
S=50/255;
[g,NR,SI,TI]=regiongrow(S,T,I_gray);
h=figure(i);
imshow(TI),title({['Segmentation by Regiongrow'];...
['T=',num2str(T),',S=',num2str(S)]});
saveas(h,[pathname,'/region-grow-method/single-',imgdir(i).name])     %save
   close(i)            %close figure

end