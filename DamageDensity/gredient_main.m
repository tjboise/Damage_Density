%% multi-gredient

clc;
clear;
pathname=uigetdir('*.*','select a dir');
imgdir=dir([pathname,'/*.jpg']);
for kk=1:length(imgdir)
    img=imread([pathname,'/',imgdir(kk).name]);
img1=rgb2gray(img);
img2=img1;
b=img(:,:,2);
[m,n]=size(b);
c=zeros(m,n);
d=zeros(m,n);
e=zeros(m,n);
g=zeros(m,n);
for i=1:m
    for j=1:n
        if b(i,j)<120
            c(i,j)=b(i,j);
        else
            d(i,j)=b(i,j);
        end
    end
end
for i=1:m
    for j=1:n
        if c(i,j)>80
            e(i,j)=0;
        else
            e(i,j)=c(i,j);
        end
        if c(i,j)>90
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

h=figure(kk);
imshow(c);

saveas(h,[pathname,'/Gredient/',imgdir(kk).name])     %save
   close(kk)            %close figure

end



