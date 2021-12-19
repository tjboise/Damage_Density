%% Graphcut algorithm
function [SegIm,SegColorIm]=Graph_Cuts(im_org,im_cosal,ObjGMM,BkgGMM) 
sigma=10;% Similarity variance 
lambda=5; 
c=1;
%mex maxflowmex.cppmaxflow-v3.0/graph.cpp maxflow-v3.0/maxflow.cpp% Mex 
im=double(im_org);
m1=im(:,:,1); 
m2=im(:,:,2); 
m3=im(:,:,3);
[height,width]= size(im(:,:,1)); 
N=height*width; 
disp('building graph');% construct graph
%Calculate weighted graph
E=edges8connected(height,width); 
dist1=(m1(E(:,1))-m1(E(:,2))).^2; 
dist2=(m2(E(:,1))-m2(E(:,2))).^2; 
dist3=(m3(E(:,1))-m3(E(:,2))).^2; 
Smooth_Dist=(dist1+dist2+dist3);% define n-links
V=c*exp((-abs(Smooth_Dist))./(2*sigma^2)); 
K=max(V)+1;
A=sparse(E(:,1),E(:,2),V,N,N,8*N);% define t-links
T=Calc_Weights(im,im_cosal,K,lambda,ObjGMM,BkgGMM);%Max flow Algorithm
disp('calculating maximum flow');
[flow,labels]=maxflow(A,T);
labels =reshape(labels,height,width);
SegColorIm=zeros(height,width); 
for i=1:height
for j=1:width
if (labels(i,j)==0)
SegColorIm(i,j)=255; 
else
egColorIm(i,j)=0;
end
end
end
SegIm=labels;
