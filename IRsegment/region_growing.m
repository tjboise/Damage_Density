%% Region-Based Segmentation
%% Region Growing
image=imread('o1.jpg'); 
I=rgb2gray(image);
figure,imshow(I),title('original image '); 
I=double(I)/255;
[M,N]=size(I); %Get the number of rows and columns of the image 
[y,x]=getpts; % Obtain the starting point ofregion growing 
x1=round(x); %Abscissa rounding 
y1=round(y); % Ordinate rounding 
seed=I(x1,y1); %The gray value of the growing start point is stored in seed 
Y=zeros(M,N); %Do a image matrix Y with all-zero and as large as the original image as the output image matrix
Y(x1,y1)=1; % Set the point in Y to the corresponding position of the point to the white field
sum=seed; % Store the sum of the gray values of the points that meet the regior growing conditions
suit=1; % Store the number of the points that meet the region growing cond itions
count=1; %Record the number of new points that meet the criteria at eight points around a point each time
threshold=0.05555; %Threshold 
while count>0
s=0; %Record the sum of the gray values of the new points meeting the criteria at eight points around a point 
count=0; 
for i=1:M 
    for j=1:N 
        if Y(i,j)==1
           if(i-1)>0&&(i+1)<(M+1)&&(j-1)>0&&(j+1)<(N+1)% Determine if this point is on the boundary
for u=-1:1 %Determine whether the surrounding points meet the field conditions 
for v=-1:1 %uvis offset 
%It is judged whether or not it is present in the output matrix Y and is a point that satisfies the field condition
if Y(i+u,j+v)==0&&abs(I(i+u,j+v)-seed)<=threshold
%In accordance with the above two conditions, the point corresponding to the position in Y is set to white field
Y(i+u,j+v)=1;count=count+1;
s=s+I(i+u,j+v); %The gray level ofthis point is added to s 
end
end
end
           end
        end
    end
end
suit=suit+count; %Addn to the count counter 
sum=sum+s; %Add s to the sum of the point grayscale 
seed=sum/suit; % Calculate the new gray average 
end
figure,imshow(Y),title('Segmented image')