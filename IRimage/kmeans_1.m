%% kmeans
function kmeans_demo1() 
clear;close all;clc;
%%Read the test image 
im=imread('o1.jpg');
imshow(im),title('Imput image');
%% Transform the color space of the image to get the sample
cform=makecform('srgb2lab'); %rgb is a matrixofm*n*3 
lab=applycform(im,cform); % converts the rgb value in m *n * 3 to the value of lab 
ab=double(lab(:,:,2:3)); % let the a,b component ofthe lab be amatrixofm*n*2 
nrows=size(lab,1); %take m from lab 
ncols=size(lab,2); %take n from lab 
X=reshape(ab,nrows*ncols,2)'; %The three-dimensionalm*n*2matrixin ab is transformed into a 
%two-dimensional matrix of2*(m *n),where the first row is the value of component a and the
%second row is the value of component b
figure,scatter(X(1,:)',X(2,:)',3,'filled');box on;% Shows the spatial distribution of the
%two-dimensional sample space after the conversion of the color space, where the first row of X is the abscissa and the second row ofXis the ordinate%print -dpdf2D1.pdf
%%Kmeans clustering the sample space
k=5; % Number of clusters 
max_iter=100; %maximum number ofiterations 
[centroids,labels]=run_kmeans(X,k,max_iter);%%Kmeans clustering the sample space
figure,scatter(X(1,:)',X(2,:)',3,labels,'filled');% Display the two-dimensional sample space clustering
%effect,where labels is the category tag and number is one of the 1-5,which can be used as a color area to sort the good category, all the points by cluster results for color classification
hold on,scatter(centroids(1,:),centroids(2,:),60,'r','filled') %Mark the center of the cluster where 
%centroids is the center of the coordinate matrix
hold on; scatter(centroids(1,:),centroids(2,:),30,'g','filled'); 
box on; hold off;%print -dpdf2D2.pdf
pixel_labels=reshape(labels,nrows,ncols);% The two-dimensional classification results into rgb space and display the image
rgb_labels=label2rgb(pixel_labels);
figure,imshow(rgb_labels),title('Segmented_Image');%print -dpdf Seg pdf 
end
function [centroids,labels]=run_kmeans(X,k,max_iter)
%%The K-means ++algorithm is used to initialize the clustering center
centroids=X(:,1+round(rand*(size(X,2)-1)));%Randomly take a column as the first cluster center 
labels = ones(1,size(X,2)); 
for i=2:k
D=X-centroids(:,labels);
D=cumsum(sqrt(dot(D,D,1)));
if D(end)==0,centroids(:,i:k)=X(:,ones(1,k-i+1));
    return;
end
centroids(:,i)=X(:,find(rand<D/D(end),1));%why
[~,labels]=max(bsxfun(@minus,2*real(centroids'*X),dot(centroids,centroids,1).')); 
end
%%standard Kmeans algorithm
for iter=1:max_iter
for i=1:k
    l=labels==i;
    centroids(:,i)=sum(X(:,1),2)/sum(l);
end
[~,labels] = max(bsxfun(@minus,2*real(centroids'*X),dot(centroids,centroids,1).'),[],1);% Value output labels,~means ignoring the output 
end
end