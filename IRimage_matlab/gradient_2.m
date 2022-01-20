%主程序
clear
%% read image
[file_name, pathname] = uigetfile( '*.*','choose a file');
I1 = imread([pathname,'/',file_name]); 
dirc='test1';
%% crop the ROI
[m, n, z] = size(I1);
figure(1),imshow(I1);
h=imrect;%use mouse get the ROI
pos=getPosition(h);%get the position,
img = imcrop( I1, pos );
%figure(1),imshow(I1);
imwrite(img,[pathname,dirc,'/original_',file_name]);

%img=imread('/Users/zhangtianjie/Downloads/drive-download-20220118T042650Z-001/deck4.1.png');
img1=rgb2gray(img);
img2=img1;
%[a,h]=contour(img,[133,133]);
%subplot(111),a;
b=img(:,:,2);
[m,n]=size(b);
c=zeros(m,n);
d=zeros(m,n);
e=zeros(m,n);
g=zeros(m,n);
for i=1:m
    for j=1:n
        if b(i,j)>160
            c(i,j)=b(i,j);
        else
            d(i,j)=b(i,j);
        end
    end
end
for i=1:m
    for j=1:n
        if c(i,j)<230
            e(i,j)=0;
        else
            e(i,j)=c(i,j);
        end
        if c(i,j)<200
            g(i,j)=0;
        else
            g(i,j)=c(i,j);
        end
    end
end
f(:,:,1)=g*255;
f(:,:,2)=(c-e)*255;
f(:,:,3)=0;
f1=rgb2gray(f);
for i=1:m
    for j=1:n
        if 255*f1(i,j)==0
        else
            img1(i,j)=0;
        
        end
        
    end
end
bl=bini(f(:,:,1));
L = bwlabel(bl,4);

figure,imshow(c);
figure,imshow(d);
figure,imshow(e);
[B,L] = bwboundaries(bl,'noholes');
total = bwarea(bl);
ff(:,:,1)=floor(img1);
ff(:,:,2)=floor(img1);
ff(:,:,3)=floor(img1);
%subplot(414),imshow(ff+uint8(f));
figure,imshow(ff+uint8(f));
imwrite(ff+uint8(f),[pathname,dirc,'/process_',file_name]);
% hold on
% for k = 1:length(B)
%    boundary = B{k};
%    plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
% end
% STATS = regionprops(L,'ALL');