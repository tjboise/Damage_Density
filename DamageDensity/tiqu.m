function [areacount,MajorAxis,MinorAxis,BW_seg,geshu,fuhe,stats]=tiqu(image_in)
%%对图像进行识别
[L_BW,NUM]=bwlabel(image_in,4);%标记连通分量
[m,n]=size(L_BW);%记录图像尺寸
BW_seg=double(zeros(m,n));%创建同样大小的0矩阵
stats=regionprops(L_BW,'all');
fuhe=[];
areacount=[];
MajorAxis=[];
MinorAxis=[];

for k=1:NUM
    S(k)=stats(k).Area; %图像各个区域中像素总个数
    MajorAxisLength(k)=stats(k).MajorAxisLength;%与区域具有相同标准二阶中心矩的椭圆的长轴长度（像素意义下）
    MinorAxisLength(k)=stats(k).MinorAxisLength;%与区域具有相同标准二阶中心矩的椭圆的短轴长度（像素意义下）
    bizhi(k)=MajorAxisLength(k)/MinorAxisLength(k);%长轴与短轴比值
    mouge=stats(k).BoundingBox;%包含相应区域的最小矩形
   
    width=size(stats(k).Image,1);%stats(k).Image与K区域具有相同大小的逻辑矩阵
    height=size(stats(k).Image,2);%获取第k个图像的长和宽
    bbb=sum(sum(stats(k).Image(floor(width/2)+1:width,floor(height/2)+1:height)));
    %floor(x):不超过x 的最大整数
    

            if  S(k)>700 && bizhi(k)<4 %&& S(k)<90000
             
                  fuhe=[fuhe,k];
                  areacount=[areacount,S(k)];
                  MajorAxis=[MajorAxis,MajorAxisLength(k)];
                  MinorAxis=[MinorAxis,MinorAxisLength(k)];
                  
                 
%                       for h=1:m
%                         for j=1:n
%                             if(L_BW(h,j)==k)
%                                 BW_seg(h,j)=L_BW(h,j);
%                             end
%                         end
%                       end

            end
end

geshu=length(fuhe);
disp('-------------------------------')
disp('The number of defects：')
disp(geshu)
disp('-------------------------------')
disp('The area of defects：')
disp(areacount)
disp('-------------------------------')
disp('The length of defects：')
disp(MajorAxis)
disp('-------------------------------')
disp('The width of defects：') 
disp(MinorAxis)
disp('-------------------------------')
