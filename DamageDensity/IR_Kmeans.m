%% K-means

[file_name, pathname] = uigetfile( '*.*','select a file');
I_rgb = imread([pathname,file_name]);      
figure();imshow(I_rgb);                  %original image
title('original image');
C = makecform('srgb2lab');       %Convert RGB image to L*a*b*
I_lab = applycform(I_rgb, C); %apply

%K-means
ab = double(I_lab(:,:,2:3));    
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);
nColors = 3;        %types=3
[cluster_idx cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean','Replicates',3);  
pixel_labels = reshape(cluster_idx,nrows,ncols);
figure();
imshow(pixel_labels,[]), title('Results');

%??????????
segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);
I_gray=rgb2gray(I_rgb);
for k = 1:nColors    
    color = I_rgb;    
    color(rgb_label ~= k) = 0; % 
    segmented_images{k} = color;
end
figure(),imshow(segmented_images{1}), title('????——??1');
figure(),imshow(segmented_images{2}), title('????——??2');
figure(),imshow(segmented_images{3}), title('????——??3');
   
 for h=1:nColors  
 red=segmented_images{h}(:,:,1);
   [m,n]=size(red);
for k=1:m
for x=1:n
    if((red(k,x)==0))
       segmented_images{h}(k,x,1)=I_gray(k,x);
     segmented_images{h}(k,x,2)=I_gray(k,x);
     segmented_images{h}(k,x,3)=I_gray(k,x);
end
end
end
 end
figure(),imshow(segmented_images{1}), title('????——??1');
figure(),imshow(segmented_images{2}), title('????——??2');        
figure(),imshow(segmented_images{3}), title('????——??3');       