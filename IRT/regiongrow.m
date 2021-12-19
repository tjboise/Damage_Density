function [g,NR,SI,TI]=regiongrow(S,T,img)
%% 区域生长算法
%以标量性质处理
%f为原图像
%S为种子点像素(0-1)，也可输入位置
%T为全局阈值(0-1)
%g表示区域分割的结果
%NR表示分割的区域数量
%SI表示最终的种子图像
%TI表示满足阈值条件但是还未被重构的结果图
%% 读取图像
% if isempty(varargin)
% disp('请选择您要进行处理的图片');
% [filename, pathname] = uigetfile( '*.*','请选择您要进行处理的图片'); %选择图片文件
%     if isequal(filename,0)   %判断是否选择
%      msgbox('没有选择任何图片');
%     else
%       pathfile=fullfile(pathname, filename);  %获得图片路径
%       img=imread(pathfile);
%     end
% else
%     img=varargin;
% end
% %% 判断维数并改变图像尺寸
% image_size=size(img);
% dimension=numel(image_size);
% if dimension==3
% img=rgb2gray(img);
% end

%% 读取种子点像素或者位置
f=tofloat(img);%转化为浮点
if numel(S)==1
    SI=f==S;
    S1=S;
else
    SI=bwmorph(S,'shrink',Inf);
    S1=f(SI);
end

%% 区域生长
TI=false(size(f));%
for K=1:length(S1)%如果是像素的话长度就是1了
    seedvalue=S1(K);
    S=abs(f-seedvalue)<=T;
    TI=TI|S;%把TI或者S赋给TI
end
[g,NR]=bwlabel(imreconstruct(SI,TI));