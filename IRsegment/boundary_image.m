%% find the boundary of the image
rgb=imread('o1.jpg'); % read the original image 
I=rgb2gray(rgb); %convert to gray scale image 
figure;subplot(121); %show the gray scale image 
imshow(I);
hy=fspecial('sobel'); %sobel operator 
hx=hy';
Iy=imfilter(double(I),hy,'replicate'); %filter the y-direction edge 
Ix=imfilter(double(I),hx,'replicate'); %filter the x-direction edge 
gradmag = sqrt(Ix.^2+ Iy.^2); %model 
subplot(122);imshow(gradmag,[]); %display gradient 
title(' Gradient map' );
%directly use gradient model values for watershed algorithm(often exist over segmentation,not work well)
L=watershed(gradmag); %wastershe algorithm is applied directly 
Lrgb=label2rgb(L); %convert to RGB image 
figure;imshow(Lrgb); %show the segmented images 
title('Gradient map after watershed transformation');%The foreground and background are marked separately
se =strel('disk',20); % circular structure element 
Io =imopen(I,se); % morphological opening operation 
figure;subplot(121);
imshow(Io); %show the image after opening operation 
title('Opening operation processed image');
Ie=imerode(I,se); %image eroding 
Iobr = imreconstruct(Ie,I); %morphological reconstruction 
subplot(122);imshow(Iobr); %show the reconstructed image 
title('Reconstructed image')
Ioc= imclose(Io,se); %morphological closing operation 
figure;subplot(121);
imshow(Ioc); %show the image after closing operation 
title('Closing operation processed image');
Iobrd=imdilate(Iobr,se); %dilating image 
Iobrcbr=imreconstruct(imcomplement(Iobrd),imcomplement(Iobr));
Iobrcbr=imcomplement(Iobrcbr);% image inversing
subplot(122);imshow(Iobrcbr); %show the image after recionstructing and inversing
title( 'Reconstructed and inversed image');
fgm=imregionalmax(Iobrcbr);%ocal maximal value
figure;imshow(fgm); % show reconstructed local maximal value image 
title( 'Reconstructed local maximal value image');
I2=I;
I2(fgm)=255; % the pixel value at the local maximum is set to 255 
figure;imshow(I2); %show the maximum value region on the orginal image 
title(' the maximum value region on the orginal image' );
se2 = strel(ones(5,5)); % structure element 
fgm2=imclose(fgm,se2); %close operation 
fgm3=imerode(fgm2,se2); %eroding image 
fgm4=bwareaopen(fgm3,20); %open operation 
I3=I;
I3(fgm4)=255; %foreground set value 255 
figure;subplot(121);
imshow(I3); %show the modified maximal value region 
title('the modified maximal value region');
bw=im2bw(Iobrcbr,graythresh(Iobrcbr));%convert to binary image
subplot(122);imshow(bw); %show the binary image 
title('Binary image');
%watershed transform and display
D=bwdist(bw); %calculate the distance 
DL=watershed(D); %watershed transformation 
bgm=DL==0; %obtain the segement boundary 
figure;imshow(bgm); %show the segemented boundary 
title('The segemented boundary');
gradmag2=imimposemin(gradmag,bgm|fgm4);%set minimum value
L=watershed(gradmag2); %watershed transformation 
I4=I;
I4(imdilate(L==0,ones(33))|bgm|fgm4)=255;%set 255 to foreground and boundary value
figure;subplot(121);
imshow(I4); %highlight the foreground and boundary 
title(' Highlight the foreground and boundary ');
Lrgb=label2rgb(L,'jet','w','shuffle'); %convert to a pseudo RGB image
subplot(122);imshow(Lrgb); %show the pseudo RGB image 
title('The pseudo RGB image')