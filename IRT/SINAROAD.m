function varargout = SINAROAD(varargin)
% SINAROAD MATLAB code for SINAROAD.fig
%      SINAROAD, by itself, creates a new SINAROAD or raises the existing
%      singleton*.
%
%      H = SINAROAD returns the handle to a new SINAROAD or the handle to
%      the existing singleton*.
%
%      SINAROAD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SINAROAD.M with the given input arguments.
%
%      SINAROAD('Property','Value',...) creates a new SINAROAD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SINAROAD_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SINAROAD_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SINAROAD

% Last Modified by GUIDE v2.5 17-Sep-2021 21:35:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SINAROAD_OpeningFcn, ...
                   'gui_OutputFcn',  @SINAROAD_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before SINAROAD is made visible.
function SINAROAD_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SINAROAD (see VARARGIN)

% Choose default command line output for SINAROAD
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SINAROAD wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SINAROAD_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%图像载入
global im   %定义一个全局变量im
[filename,pathname]=...
    uigetfile({'*.*';'*.bmp';'*.tif';'*.png'},'select picture');  %选择图片路径
str=[pathname filename];  %合成路径+文件名
im=imread(str);   %读取图片
axes(handles.axes1);  %使用第一个axes
imshow(im);  %显示图片

% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
axes(handles.axes2);  %使用第一个axes
imshow(im);  %显示图片

% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname,filterindex]=...
    uiputfile({'*.bmp';'*.tif';'*.png'},'save picture');%存储图片路径
if filterindex==0
return  %如果取消操作，返回
else
str=[pathname filename];  %合成路径+文件名
pix=getframe(handles.axes2);
% axes(handles.axes1);  %使用第1个axes
imwrite(pix.cdata,str);  %写入图片信息，即保存图片
end


% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_9_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
global grayimg
axes(handles.axes2);   %使用第二个axes
grayimg=rgb2gray(im);
imshow(grayimg);

% --------------------------------------------------------------------
function Untitled_10_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global grayimg
global Cannyimg  %定义全局变量
answer=inputdlg('输入阈值分割的点，取值范围为0-1','SEU-TJ');
a=str2num(answer{:});


axes(handles.axes2);   %使用第二个axes

Cannyimg=im2bw(grayimg,a);
%Cannyimg=edge(grayimg,'canny');
%Cannyimg=ordfilt2(Cannyimg,7,ones(3,3));
 imshow(Cannyimg);

% --------------------------------------------------------------------
function Untitled_11_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Cannyimg
answer=inputdlg('输入一个数值，小于该数值的面积将被删除（建议值：30）','SEU-TJ');
a=str2num(answer{:});

Cannyimg=bwareaopen(Cannyimg,a);
axes(handles.axes2);   %使用第二个axes

imshow(Cannyimg);


% --------------------------------------------------------------------
function Untitled_12_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_13_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Cannyimg
global grayimg

c=fspecial('average',[3 3]);
grayimg=imfilter(grayimg,c,'replicate');
axes(handles.axes2);   %使用第二个axes
imshow(grayimg)


% --------------------------------------------------------------------
function Untitled_14_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global grayimg
global Gray_gaussian

h=[1 1 1;1 1 1;1 1 1];
h=h./9;

grayimg=imfilter(grayimg,h,'replicate'); 
axes(handles.axes2);   %使用第二个axes
imshow(grayimg);


% --------------------------------------------------------------------
function Untitled_16_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_17_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global BW_seg
global fuhe
global stats
global Cannyimg

[L_BW,NUM]=bwlabel(Cannyimg,4);%标记连通分量
%figure;imshow(L_BW);%显示figure7
[m,n]=size(L_BW);%记录图像尺寸
BW_seg=double(zeros(m,n));%创建同样大小的0矩阵
stats=regionprops(L_BW,'all');%%%%%%%
fuhe=[];
for k=1:NUM
    S(k)=stats(k).Area; %图像各个区域中像素总个数
    MajorAxisLength(k)=stats(k).MajorAxisLength;%与区域具有相同标准二阶中心矩的椭圆的长轴长度（像素意义下）
    MinorAxisLength(k)=stats(k).MinorAxisLength;%与区域具有相同标准二阶中心矩的椭圆的短轴长度（像素意义下）
    bizhi(k)=MajorAxisLength(k)/MinorAxisLength(k);%长轴与短轴比值
    mouge=stats(k).BoundingBox;%包含相应区域的最小矩形
   
    width=size(stats(k).Image,1);%stats(k).Image与K区域具有相同大小的逻辑矩阵
    height=size(stats(k).Image,2);%获取第k个图像的长和宽
    bbb=sum(sum(stats(k).Image(floor(width/2)+1:width,floor(height/2)+1:height)));%floor(x):不超过x 的最大整数
    
   % if bizhi(k)<4
%         if  S(k)<1000 && S(k)>300 && S(k)/(width*height)<0.3
            if  S(k)>70 &&S(k)<1000%&& S(k)/(width*height)<0.3 && bbb/S(k)<0.3%&&stats(k).Orientation<0
                %%%如果面积大于80小于1000且图像/长*宽<0.3且bbb/图像面积<0.3
                  fuhe=[fuhe,k];
                      for h=1:m
                        for j=1:n
                            if(L_BW(h,j)==k)
                                BW_seg(h,j)=L_BW(h,j);
                            end
                        end
                      end
%                 end
        end
    end
%end
BW_seg=bwareaopen(BW_seg,10);
h1=msgbox('特征提取已完成',...
    'SEU-TJ','help');


% --------------------------------------------------------------------
function Untitled_15_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global grayimg
global Zhongzhi

grayimg=medfilt2(grayimg); 
axes(handles.axes2);   %使用第二个axes
imshow(grayimg);

% --------------------------------------------------------------------
function Untitled_18_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fuhe
global stats
% global im

geshu=length(fuhe);%识别个数
% pix1=getframe(handles.axes1);
% img5=pix1.cdata;
% figure; imshow(im)
for i=1:geshu
    mouge=stats(fuhe(i)).BoundingBox;
    xMin=mouge(1);
    yMin=mouge(2);
    width=mouge(3);
    height=mouge(4);      
    axes(handles.axes1);
%     hold(handles.axes2,'on') 
hold on
    rectangle('Position',[xMin,yMin,width,height],'EdgeColor','r');
    axes(handles.axes2);
    hold on
% %     hold(handles.axes1,'on')
    rectangle('Position',[xMin,yMin,width,height],'EdgeColor','g');
end


% --------------------------------------------------------------------
function Untitled_19_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fuhe
global geshu
geshu=length(fuhe);
%[cdata,map]=imread('站点图标.png');
h=msgbox('个数统计已完成',...
    'SEU-TJ','help');
set(handles.text5,'string',geshu);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text2.
function text2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text3.
function text3_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_20_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_21_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ObjDir
ObjDir=uigetdir('E:\','请选择所需处理图片的文件夹');

% --------------------------------------------------------------------
function Untitled_22_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OutputDir
OutputDir=uigetdir('E:\','请选择保存图片的文件夹');


% --------------------------------------------------------------------
function Untitled_23_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_24_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ObjDir
ObjDir=uigetdir('E:\','请选择所需处理图片的文件夹');
global OutputDir
OutputDir=uigetdir('E:\','尺寸统计结果保存在？');
answer=inputdlg('请输入你所要处理的图片数量：','SEU-TJ');
tnum=str2num(answer{:});
%tnum = str2double( get(handles.edit2,'string'));%获取目标图片数目
B=zeros(tnum,3);
h=waitbar(0,'程序正在运行中...');
for i=1:tnum
    waitbar(i/tnum)
    bgFile = [ObjDir,'\',int2str(i),'.png'];% 读入图片的完整路径
    orimg = imread(bgFile);
    
    grayimg=rgb2gray(orimg);
    c1=size(grayimg,1);%行数
  c2=size(grayimg,2);%列数
   
  B(i,1)=i;
  B(i,2)=c1;
  B(i,3)=c2;
end

d={'图像编号','原图高度','原图宽度','COPYRIGHT:章天杰'};
xlswrite([OutputDir,'\','尺寸统计表.xls'],d,'A1:D1');
xlswrite([OutputDir,'\','尺寸统计表.xls'],B,'A2:C1001');
close(h);
h=msgbox('尺寸统计已完成',...
    'SEU-TJ','help');


% --------------------------------------------------------------------
function Untitled_25_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ObjDir
ObjDir=uigetdir('E:\','请选择所需处理图片的文件夹');
global OutputDir
OutputDir=uigetdir('E:\','尺寸统计结果保存在？');
answer=inputdlg('请输入你所要处理的图片数量：','SEU-TJ');
tnum=str2num(answer{:});
h=waitbar(0,'程序正在运行中...');
B=zeros(tnum,7);
for i=1:tnum
     waitbar(i/tnum)
    bgFile = [ObjDir,'\',int2str(i),'.png'];% 读入图片的完整路径
    orimg = imread(bgFile);
    f=rgb2gray(orimg);
    p = imhist(f); 
p = p./numel(f); 
L = length(p); 
 
% Compute the three moments. We need the unnormalized ones 
% from function statmoments. These are in vector mu. 
[v, mu] = statmoments(p, 3); 
 
% Compute the six texture measures: 
% Average gray level. 
t(1) = mu(1); 
% Standard deviation. 
t(2) = mu(2).^0.5; 
% Smoothness. 
% First normalize the variance to [0 1] by 
% dividing it by (L-1)^2. 
varn = mu(2)/(L - 1)^2; 
t(3) = 1 - 1/(1 + varn); 
% Third moment (normalized by (L - 1)^2 also). 
t(4) = mu(3)/(L - 1)^2; 
% Uniformity. 
t(5) = sum(p.^2); 
% Entropy. 
t(6) = -sum(p.*(log2(p + eps))); 
B(i,1)=i;
  B(i,2:1:7)=t;
   
end
d={'图像编号','平均灰度','平均对比度','平滑度','三阶矩','一致性','熵'};
xlswrite([OutputDir,'\','纹理统计表.xls'],d,'A1:G1');
xlswrite([OutputDir,'\','纹理统计表.xls'],B,'A2:G1001');
close(h);
h=msgbox('纹理统计已完成',...
    'SEU-TJ','help');






% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_26_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ObjDir
ObjDir=uigetdir('E:\','请选择所需处理图片的文件夹');
global OutputDir
OutputDir=uigetdir('E:\','结果保存在？');
answer=inputdlg('请输入你所要处理的图片数量：','SEU-TJ');
tnum=str2num(answer{:});
h1=waitbar(0,'程序正在运行中...');

for i=1:tnum
     waitbar(i/tnum)
     bgFile = [ObjDir,'\',int2str(i),'.png'];% 读入图片的完整路径
    orimg = imread(bgFile);
    grayimg=rgb2gray(orimg);%灰度化
    imwrite(grayimg,[OutputDir,'\',int2str(i),'_gray.png']);
end
close(h1);
msgbox('灰度图已生成',...
    'SEU-TJ','help');

% --------------------------------------------------------------------
function Untitled_27_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ObjDir
ObjDir=uigetdir('E:\','请选择所需处理图片的文件夹');
global OutputDir
OutputDir=uigetdir('E:\','结果保存在？');
answer=inputdlg('请输入你所要处理的图片数量：','SEU-TJ');
tnum=str2num(answer{:});
h1=waitbar(0,'程序正在运行中...');

for i=1:tnum
     waitbar(i/tnum)
     bgFile = [ObjDir,'\',int2str(i),'.png'];% 读入图片的完整路径
    orimg = imread(bgFile);
    grayimg=rgb2gray(orimg);%灰度化
    [filterimg]=medfilt2(grayimg);%中值滤波
    imwrite(filterimg,[OutputDir,'\',int2str(i),'_filter.png']);
    
end
close(h1);
msgbox('滤波图已生成',...
    'SEU-TJ','help');

% --------------------------------------------------------------------
function Untitled_28_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ObjDir
ObjDir=uigetdir('E:\','请选择所需处理图片的文件夹');
global OutputDir
OutputDir=uigetdir('E:\','结果保存在？');
answer=inputdlg('请输入你所要处理的图片数量：','SEU-TJ');
tnum=str2num(answer{:});
answer1=inputdlg('请输入你所要分割图片的阈值（范围为0-1，建议取值靠近1）：','SEU-TJ');
num1=str2num(answer1{:});
h1=waitbar(0,'程序正在运行中...');

for i=1:tnum
     waitbar(i/tnum)
     bgFile = [ObjDir,'\',int2str(i),'.png'];% 读入图片的完整路径
    orimg = imread(bgFile);
    grayimg=rgb2gray(orimg);%灰度化
    [filterimg]=medfilt2(grayimg);%中值滤波

   yuzhi_img=im2bw(filterimg,num1);%阈值分割
   imwrite(yuzhi_img,[OutputDir,'\',int2str(i),'_yuzhi.png']);
end
close(h1);
msgbox('阈值分割图已生成',...
    'SEU-TJ','help');

% --------------------------------------------------------------------
function Untitled_29_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ObjDir
ObjDir=uigetdir('E:\','请选择所需处理图片的文件夹');
global OutputDir
OutputDir=uigetdir('E:\','结果保存在？');
answer=inputdlg('请输入你所要处理的图片数量：','SEU-TJ');
tnum=str2num(answer{:});
answer1=inputdlg('请输入你所要分割图片的阈值（范围为0-1，建议取值靠近1）：','SEU-TJ');
num1=str2num(answer1{:});
h1=waitbar(0,'程序正在运行中...');

for i=1:tnum
     waitbar(i/tnum)
     bgFile = [ObjDir,'\',int2str(i),'.png'];% 读入图片的完整路径
    orimg = imread(bgFile);
    grayimg=rgb2gray(orimg);%灰度化
    [filterimg]=medfilt2(grayimg);%中值滤波

   yuzhi_img=im2bw(filterimg,num1);%阈值分割
   
   c=size(yuzhi_img,1);%提取行数


amax=c/2-20;

yuzhi_img(amax:c,:)=0;%把第c行到amax行的像素值为0

  imwrite(yuzhi_img,[OutputDir,'\',int2str(i),'_qiege.png']);
   
end
close(h1);
msgbox('图像截取已完成，并已生成图片',...
    'SEU-TJ','help');
% --------------------------------------------------------------------
function Untitled_30_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ObjDir
ObjDir=uigetdir('E:\','请选择所需处理图片的文件夹');
global OutputDir
OutputDir=uigetdir('E:\','结果保存在？');
answer=inputdlg('请输入你所要处理的图片数量：','SEU-TJ');
tnum=str2num(answer{:});
answer1=inputdlg('请输入你所要分割图片的阈值（范围为0-1，建议取值靠近1）：','SEU-TJ');
num1=str2num(answer1{:});
h1=waitbar(0,'程序正在运行中...');

for i=1:tnum
     waitbar(i/tnum)
     bgFile = [ObjDir,'\',int2str(i),'.png'];% 读入图片的完整路径
    orimg = imread(bgFile);
    grayimg=rgb2gray(orimg);%灰度化
    [filterimg]=medfilt2(grayimg);%中值滤波

   yuzhi_img=im2bw(filterimg,num1);%阈值分割
   
   c=size(yuzhi_img,1);%提取行数


amax=c/2-20;

yuzhi_img(amax:c,:)=0;%把第c行到amax行的像素值为0
 strel_1=[1 1 1 1 1];%设计结构元

  xt_img=imclose(yuzhi_img,strel_1);%闭操作
imwrite(xt_img,[OutputDir,'\',int2str(i),'_imclose.png']);
 
   
end
close(h1);
msgbox('闭操作已完成，并已生成图片',...
    'SEU-TJ','help');
% --------------------------------------------------------------------
function Untitled_31_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ObjDir
ObjDir=uigetdir('E:\','请选择所需处理图片的文件夹');
global OutputDir
OutputDir=uigetdir('E:\','结果保存在？');
answer=inputdlg('请输入你所要处理的图片数量：','SEU-TJ');
tnum=str2num(answer{:});
answer1=inputdlg('请输入你所要分割图片的阈值（范围为0-1，建议取值靠近1）：','SEU-TJ');
num1=str2num(answer1{:});
h1=waitbar(0,'程序正在运行中...');

for i=1:tnum
     waitbar(i/tnum)
     bgFile = [ObjDir,'\',int2str(i),'.png'];% 读入图片的完整路径
    orimg = imread(bgFile);
    grayimg=rgb2gray(orimg);%灰度化
    [filterimg]=medfilt2(grayimg);%中值滤波

   yuzhi_img=im2bw(filterimg,num1);%阈值分割
   
   c=size(yuzhi_img,1);%提取行数


amax=c/2-20;

yuzhi_img(amax:c,:)=0;%把第c行到amax行的像素值为0
 strel_1=[1 1 1 1 1];%设计结构元

  xt_img=imclose(yuzhi_img,strel_1);%闭操作
[L_BW,NUM]=bwlabel(xt_img,4);%标记连通分量
[m,n]=size(L_BW);%记录图像尺寸
BW_seg=double(zeros(m,n));%创建同样大小的0矩阵
stats=regionprops(L_BW,'all');
fuhe=[];
for k=1:NUM
    S(k)=stats(k).Area; %图像各个区域中像素总个数
    MajorAxisLength(k)=stats(k).MajorAxisLength;%与区域具有相同标准二阶中心矩的椭圆的长轴长度（像素意义下）
    MinorAxisLength(k)=stats(k).MinorAxisLength;%与区域具有相同标准二阶中心矩的椭圆的短轴长度（像素意义下）
    bizhi(k)=MajorAxisLength(k)/MinorAxisLength(k);%长轴与短轴比值
    mouge=stats(k).BoundingBox;%包含相应区域的最小矩形
   
    width=size(stats(k).Image,1);%stats(k).Image与K区域具有相同大小的逻辑矩阵
    height=size(stats(k).Image,2);%获取第k个图像的长和宽
    bbb=sum(sum(stats(k).Image(floor(width/2)+1:width,floor(height/2)+1:height)));%floor(x):不超过x 的最大整数
    

            if  S(k)>70 %&& bizhi(k)<2
             
                  fuhe=[fuhe,k];
                      for h=1:m
                        for j=1:n
                            if(L_BW(h,j)==k)
                                BW_seg(h,j)=L_BW(h,j);
                            end
                        end
                      end

        end
    end

geshu=length(fuhe);
disp('脱空部位总数为：')
disp(geshu)
disp('个')%识别个数
 figure,imshow(orimg)%显示figure，并画上矩形
for h=1:geshu
    mouge=stats(fuhe(h)).BoundingBox;
    xMin=mouge(1);
    yMin=mouge(2);
    width=mouge(3);
    height=mouge(4);        
    hold on
    rectangle('Position',[xMin,yMin,width,height],'EdgeColor','m');
end
  gfframe=getframe(gcf);
gffim=frame2im(gfframe);

  imwrite(gffim,[OutputDir,'\',int2str(i),'_final.png']);%将处理后的图片保存到目标文件夹
  close(figure(gcf));
end
 close(h1);
msgbox('最终识别图已生成',...
    'SEU-TJ','help');  


% --------------------------------------------------------------------
function Untitled_32_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ObjDir
ObjDir=uigetdir('E:\','请选择所需处理图片的文件夹');
global OutputDir
OutputDir=uigetdir('E:\','结果保存在？');
answer=inputdlg('请输入你所要处理的图片数量：','SEU-TJ');
tnum=str2num(answer{:});
answer1=inputdlg('请输入你所要分割图片的阈值（范围为0-1，建议取值靠近1）：','SEU-TJ');
num1=str2num(answer1{:});
h1=waitbar(0,'程序正在运行中...');

for i=1:tnum
     waitbar(i/tnum)
     bgFile = [ObjDir,'\',int2str(i),'.png'];% 读入图片的完整路径
    orimg = imread(bgFile);
    grayimg=rgb2gray(orimg);%灰度化
    mkdir([OutputDir,'\','灰度图']);
    imwrite(grayimg,[OutputDir,'\','灰度图','\',int2str(i),'_gray.png']);
    [filterimg]=medfilt2(grayimg);%中值滤波
 mkdir([OutputDir,'\','滤波']);
 imwrite(filterimg,[OutputDir,'\','滤波','\',int2str(i),'_filter.png']);
   yuzhi_img=im2bw(filterimg,num1);%阈值分割
    mkdir([OutputDir,'\','阈值分割']);
    imwrite(yuzhi_img,[OutputDir,'\','阈值分割','\',int2str(i),'_yuzhi.png']);
   c=size(yuzhi_img,1);%提取行数
amax=c/2-20;
yuzhi_img(amax:c,:)=0;%把第c行到amax行的像素值为0
mkdir([OutputDir,'\','图像截取']);
imwrite(yuzhi_img,[OutputDir,'\','图像截取','\',int2str(i),'_qiege.png']);
 strel_1=[1 1 1 1 1];%设计结构元
  xt_img=imclose(yuzhi_img,strel_1);%闭操作
  mkdir([OutputDir,'\','闭操作']);
  imwrite(xt_img,[OutputDir,'\','闭操作','\',int2str(i),'_imclose.png']);
  
  
[L_BW,NUM]=bwlabel(xt_img,4);%标记连通分量
[m,n]=size(L_BW);%记录图像尺寸
BW_seg=double(zeros(m,n));%创建同样大小的0矩阵
stats=regionprops(L_BW,'all');
fuhe=[];
for k=1:NUM
    S(k)=stats(k).Area; %图像各个区域中像素总个数
    MajorAxisLength(k)=stats(k).MajorAxisLength;%与区域具有相同标准二阶中心矩的椭圆的长轴长度（像素意义下）
    MinorAxisLength(k)=stats(k).MinorAxisLength;%与区域具有相同标准二阶中心矩的椭圆的短轴长度（像素意义下）
    bizhi(k)=MajorAxisLength(k)/MinorAxisLength(k);%长轴与短轴比值
    mouge=stats(k).BoundingBox;%包含相应区域的最小矩形
   
    width=size(stats(k).Image,1);%stats(k).Image与K区域具有相同大小的逻辑矩阵
    height=size(stats(k).Image,2);%获取第k个图像的长和宽
    bbb=sum(sum(stats(k).Image(floor(width/2)+1:width,floor(height/2)+1:height)));%floor(x):不超过x 的最大整数
    

            if  S(k)>70 %&& bizhi(k)<2
             
                  fuhe=[fuhe,k];
                      for h=1:m
                        for j=1:n
                            if(L_BW(h,j)==k)
                                BW_seg(h,j)=L_BW(h,j);
                            end
                        end
                      end

        end
    end

geshu=length(fuhe);
disp('脱空部位总数为：')
disp(geshu)
disp('个')%识别个数
 figure,imshow(orimg)%显示figure，并画上矩形
for h=1:geshu
    mouge=stats(fuhe(h)).BoundingBox;
    xMin=mouge(1);
    yMin=mouge(2);
    width=mouge(3);
    height=mouge(4);        
    hold on
    rectangle('Position',[xMin,yMin,width,height],'EdgeColor','m');
end
  gfframe=getframe(gcf);
gffim=frame2im(gfframe);
  mkdir([OutputDir,'\','最终结果']);
   imwrite(gffim,[OutputDir,'\','最终结果','\',int2str(i),'_final.png']);%将处理后的图片保存到目标文件夹
  close(figure(gcf));
end
close(h1);
msgbox('结果已生成',...
    'SEU-TJ','help');


% --------------------------------------------------------------------
function Untitled_34_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ObjDir
ObjDir=uigetdir('E:\','请选择所需处理图片的文件夹');
global OutputDir
OutputDir=uigetdir('E:\','结果保存在？');
answer=inputdlg('请输入你所要处理的图片数量：','SEU-TJ');
tnum=str2num(answer{:});
answer1=inputdlg('请输入你所要分割图片的阈值（范围为0-1，建议取值靠近1）：','SEU-TJ');
num1=str2num(answer1{:});
h1=waitbar(0,'程序正在运行中...');

%num1=str2double( get(handles.edit3,'string'));

B=zeros(tnum,2);
for i=1:tnum
     waitbar(i/tnum)
     bgFile = [ObjDir,'\',int2str(i),'.png'];% 读入图片的完整路径
    orimg = imread(bgFile);
    grayimg=rgb2gray(orimg);%灰度化
    [filterimg]=medfilt2(grayimg);%中值滤波

   yuzhi_img=im2bw(filterimg,num1);%阈值分割
   
   c=size(yuzhi_img,1);%提取行数


amax=c/2-20;

yuzhi_img(amax:c,:)=0;%把第c行到amax行的像素值为0
 strel_1=[1 1 1 1 1];%设计结构元

  xt_img=imclose(yuzhi_img,strel_1);%闭操作
[L_BW,NUM]=bwlabel(xt_img,4);%标记连通分量
[m,n]=size(L_BW);%记录图像尺寸
BW_seg=double(zeros(m,n));%创建同样大小的0矩阵
stats=regionprops(L_BW,'all');
fuhe=[];
for k=1:NUM
    S(k)=stats(k).Area; %图像各个区域中像素总个数
    MajorAxisLength(k)=stats(k).MajorAxisLength;%与区域具有相同标准二阶中心矩的椭圆的长轴长度（像素意义下）
    MinorAxisLength(k)=stats(k).MinorAxisLength;%与区域具有相同标准二阶中心矩的椭圆的短轴长度（像素意义下）
    bizhi(k)=MajorAxisLength(k)/MinorAxisLength(k);%长轴与短轴比值
    mouge=stats(k).BoundingBox;%包含相应区域的最小矩形
   
    width=size(stats(k).Image,1);%stats(k).Image与K区域具有相同大小的逻辑矩阵
    height=size(stats(k).Image,2);%获取第k个图像的长和宽
    bbb=sum(sum(stats(k).Image(floor(width/2)+1:width,floor(height/2)+1:height)));%floor(x):不超过x 的最大整数
    

            if  S(k)>70 %&& bizhi(k)<2
             
                  fuhe=[fuhe,k];
                      for h=1:m
                        for j=1:n
                            if(L_BW(h,j)==k)
                                BW_seg(h,j)=L_BW(h,j);
                            end
                        end
                      end

        end
    end

geshu=length(fuhe);
disp('脱空部位总数为：')
disp(geshu)
disp('个')%识别个数
 B(i,2)=geshu;
B(i,1)=i;
end
d={'图像编号','层间不良数目','COPYRIGHT:章天杰'}
xlswrite([OutputDir,'\','病害统计表.xls'],d,'A1:C1')
xlswrite([OutputDir,'\','病害统计表.xls'],B,'A2:B101')
close(h1);
msgbox('病害数量统计已完成',...
    'SEU-TJ','help');

% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_35_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --------------------------------------------------------------------
function Untitled_36_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web -broswer http://47.107.106.122/sinaroad-voiddect/

% --------------------------------------------------------------------
function Untitled_37_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web -broswer http://47.107.106.122/ten/


% --------------------------------------------------------------------
function Untitled_38_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global grayimg
global Gaosi
c1=fspecial('gaussian',[3 3]);
grayimg=imfilter(grayimg,c1,'replicate');

axes(handles.axes2);   %使用第二个axes
imshow(grayimg);

% --------------------------------------------------------------------
function Untitled_39_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global grayimg
global Lpls
e=fspecial('laplacian');
grayimg=imfilter(grayimg,e,'replicate');


axes(handles.axes2);   %使用第二个axes
imshow(grayimg);

% --------------------------------------------------------------------
function Untitled_40_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global grayimg
global d2
c2=fspecial('prewitt');
grayimg=imfilter(grayimg,c2,'replicate');
axes(handles.axes2);   %使用第二个axes
imshow(grayimg);

% --------------------------------------------------------------------
function Untitled_41_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global grayimg
global d3
c3=fspecial('sobel');
grayimg=imfilter(grayimg,c3,'replicate');
axes(handles.axes2);   %使用第二个axes
imshow(grayimg);




% --------------------------------------------------------------------
function Untitled_43_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_44_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Cannyimg
global BW_seg
global fuhe
global stats
global OutputDir
OutputDir=uigetdir('E:\','面积统计结果保存在？');
%pix=getframe(handles.axes2);

%mm=pix.cdata;
%mm=mm(:,:,3);

[L_BW,NUM]=bwlabel(Cannyimg,4);%标记连通分量
%figure;imshow(L_BW);%显示figure7
[m,n]=size(L_BW);%记录图像尺寸
BW_seg=double(zeros(m,n));%创建同样大小的0矩阵
stats=regionprops(L_BW,'all');%%%%%%%
fuhe=[];
b=0;
for k=1:NUM
    S(k)=stats(k).Area; %图像各个区域中像素总个数
    MajorAxisLength(k)=stats(k).MajorAxisLength;%与区域具有相同标准二阶中心矩的椭圆的长轴长度（像素意义下）
    MinorAxisLength(k)=stats(k).MinorAxisLength;%与区域具有相同标准二阶中心矩的椭圆的短轴长度（像素意义下）
    bizhi(k)=MajorAxisLength(k)/MinorAxisLength(k);%长轴与短轴比值
    mouge=stats(k).BoundingBox;%包含相应区域的最小矩形   
    width=size(stats(k).Image,1);%stats(k).Image与K区域具有相同大小的逻辑矩阵
    height=size(stats(k).Image,2);%获取第k个图像的长和宽
    bbb=sum(sum(stats(k).Image(floor(width/2)+1:width,floor(height/2)+1:height)));%floor(x):不超过x 的最大整数
            if  S(k)>70 %&& S(k)/(width*height)<0.3 && bbb/S(k)<0.3%&&stats(k).Orientation<0
          b=b+S(k);
                   B(k,2)=S(k);
         B(k,1)=k;
        end
end
       d={'编号','面积','COPYRIGHT:章天杰'};
xlswrite([OutputDir,'\','长宽统计表.xls'],d,'A1:C1');
xlswrite([OutputDir,'\','长宽统计表.xls'],B,'A2:B1001');

h=msgbox('面积统计已完成',...
    'SEU-TJ','help');
set(handles.text4,'string',b);





% --------------------------------------------------------------------
function Untitled_45_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Cannyimg
global BW_seg
global fuhe
global stats
global OutputDir
OutputDir=uigetdir('E:\','尺寸统计结果保存在？');
%pix=getframe(handles.axes2);

%mm=pix.cdata;
%mm=mm(:,:,3);

[L_BW,NUM]=bwlabel(Cannyimg,4);%标记连通分量
%figure;imshow(L_BW);%显示figure7
[m,n]=size(L_BW);%记录图像尺寸
BW_seg=double(zeros(m,n));%创建同样大小的0矩阵
stats=regionprops(L_BW,'all');%%%%%%%
fuhe=[];

for k=1:NUM
    S(k)=stats(k).Area; %图像各个区域中像素总个数
    MajorAxisLength(k)=stats(k).MajorAxisLength;%与区域具有相同标准二阶中心矩的椭圆的长轴长度（像素意义下）
    MinorAxisLength(k)=stats(k).MinorAxisLength;%与区域具有相同标准二阶中心矩的椭圆的短轴长度（像素意义下）
    bizhi(k)=MajorAxisLength(k)/MinorAxisLength(k);%长轴与短轴比值
    mouge=stats(k).BoundingBox;%包含相应区域的最小矩形   
    width=size(stats(k).Image,1);%stats(k).Image与K区域具有相同大小的逻辑矩阵
    height=size(stats(k).Image,2);%获取第k个图像的长和宽
    bbb=sum(sum(stats(k).Image(floor(width/2)+1:width,floor(height/2)+1:height)));%floor(x):不超过x 的最大整数
            if  S(k)>70 %&& S(k)/(width*height)<0.3 && bbb/S(k)<0.3%&&stats(k).Orientation<0
          B(k,2)=MajorAxisLength(k);
          B(k,3)=MinorAxisLength(k);
         B(k,1)=k;
        end
end
   d={'编号','长轴','短轴','COPYRIGHT:章天杰'};
xlswrite([OutputDir,'\','长宽统计表.xls'],d,'A1:D1');
xlswrite([OutputDir,'\','长宽统计表.xls'],B,'A2:C1001');
h=msgbox('长宽统计已完成',...
    'SEU-TJ','help');


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text5.
function text5_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text4.
function text4_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_46_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_46 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_47_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global im
grayimg=rgb2gray(im);
axes(handles.axes2); 
BW = im2bw(grayimg,0.8); %二值化
[B, L] = bwboundaries(BW, 'noholes'); %得到区域的边界
imshow(label2rgb(L, @jet, [0.5, 0.5, 0.5])); % 伪彩显示
hold on;
for k = 1 : length(B) % 边界着色
    boundary = B{k}; 
    plot(boundary(:, 2), boundary(:, 1), 'k', 'LineWidth', 2); 
end
title('边界着色');
hold off;

% --------------------------------------------------------------------
function Untitled_48_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global im   %定义一个全局变量im

[T,~]=graythresh(im);
c=T*255;
g=im2bw(im,T);
axes(handles.axes2);   %使用第二个axes

imshow(g);

title('Ostu’s阈值分割结果');
set(handles.text6,'string',T);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text6.
function text6_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_49_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
axes(handles.axes1);  %使用第一个axes
imshow(im);  %显示图片
grayimg=rgb2gray(im);
axes(handles.axes2); 
imhist(grayimg)
axis tight
title('直方图');


% --------------------------------------------------------------------
function Untitled_50_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global im   %定义一个全局变量im
grayimg=rgb2gray(im);
axes(handles.axes2);
h=imhist(grayimg,25);%直方图
horz=linspace(0,255,25);
bar(horz,h);%直方图条状化
axis tight
title('直方图条状化');

% --------------------------------------------------------------------
function Untitled_51_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global im   %定义一个全局变量im
grayimg=rgb2gray(im);
axes(handles.axes2);
h=imhist(grayimg,25);%直方图
horz=linspace(0,255,25);
stem(horz,h,'fill');%直方图杆状化

axis tight
title('直方图杆状化');


% --------------------------------------------------------------------
function Untitled_52_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global im   %定义一个全局变量im
grayimg=rgb2gray(im);
axes(handles.axes2);
h=imhist(grayimg);%直方图
plot(h);%将直方图顶点连起来
axis tight
title('直方图连续化');

% --------------------------------------------------------------------
function Untitled_53_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global im   %定义一个全局变量im
grayimg=rgb2gray(im);
axes(handles.axes2);
p=imhist(grayimg)./numel(grayimg);
cdf=cumsum(p);
x=linspace(0,1,256);
plot(x,cdf);%累积分布函数（cdf）绘制
axis tight
xlabel('输入灰度值','fontsize',9);
ylabel('输出灰度值','fontsize',9);
title('累积分布函数');


% --------------------------------------------------------------------
function Untitled_54_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes2);
cla reset 
axes(handles.axes1);
cla reset 
set(handles.text4,'String','病害总面积')
set(handles.text5,'String','病害数量统计')
set(handles.text6,'String','Ostu‘s 阈值处理')
set(handles.text7,'String','管道数量')


% --------------------------------------------------------------------
function Untitled_55_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Cannyimg

strel_1=[1 1 1 1 1];%设计结构元
Cannyimg=imclose(Cannyimg,strel_1);
axes(handles.axes2);
imshow(Cannyimg);


% --------------------------------------------------------------------
function Untitled_56_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Cannyimg

 se = strel('disk',1); %盘型结构元素
 Cannyimg = imerode(Cannyimg,se,4);%腐蚀运算
axes(handles.axes2);  %使用第二个axes
imshow(Cannyimg),title('腐蚀')


% --------------------------------------------------------------------
function Untitled_57_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Cannyimg

Cannyimg=ordfilt2(Cannyimg,7,ones(3,3));
axes(handles.axes2);  %使用第二个axes
imshow(Cannyimg),title('膨胀')


% --------------------------------------------------------------------
function Untitled_58_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_58 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global grayimg
global Cannyimg  %定义全局变量
axes(handles.axes2);   %使用第二个axes
Cannyimg=edge(grayimg,'canny');
Cannyimg=ordfilt2(Cannyimg,7,ones(3,3));
 imshow(Cannyimg);


% --------------------------------------------------------------------
function Untitled_59_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_59 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox({'对不起，你没有权限！' '请在帮助菜单中联系开发者'});


% --------------------------------------------------------------------
function Untitled_60_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_60 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mm
global BW_seg
global fuhe
global stats
pix=getframe(handles.axes2);

mm=pix.cdata;
mm=mm(:,:,3);
[L_BW,NUM]=bwlabel(mm,4);
% figure;imshow(L_BW);
[m,n]=size(L_BW);
BW_seg=double(zeros(m,n));
stats=regionprops(L_BW,'all');
fuhe=[];
for k=1:NUM
    S(k)=stats(k).Area; 
    MajorAxisLength(k)=stats(k).MajorAxisLength;
    MinorAxisLength(k)=stats(k).MinorAxisLength;
    bizhi(k)=MajorAxisLength(k)/MinorAxisLength(k);
    mouge=stats(k).BoundingBox;
    width=size(stats(k).Image,1);
    height=size(stats(k).Image,2);
    bbb=sum(sum(stats(k).Image(floor(width/2)+1:width,floor(height/2)+1:height)));

    if bizhi(k)<4
        if  S(k)<1000 && S(k)>80 && S(k)/(width*height)<0.3 && bbb/S(k)<0.3%&&stats(k).Orientation<40
                  fuhe=[fuhe,k];
                      for i=1:m
                        for j=1:n
                            if(L_BW(i,j)==k)
                                BW_seg(i,j)=L_BW(i,j);
                            end
                        end
                      end
        end
    end
end
BW_seg=bwareaopen(BW_seg,30);
h1=msgbox('管道特征提取已完成',...
    'SEU-TJ','help');


% --------------------------------------------------------------------
function Untitled_61_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_61 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fuhe
global stats
% global im
geshu=length(fuhe);%识别个数
% pix1=getframe(handles.axes1);
% img5=pix1.cdata;
% figure; imshow(im)
for i=1:geshu
    mouge=stats(fuhe(i)).BoundingBox;
    xMin=mouge(1);
    yMin=mouge(2);
    width=mouge(3);
    height=mouge(4);      
    axes(handles.axes1);
%     hold(handles.axes2,'on') 
hold on
    rectangle('Position',[xMin,yMin,width+10,height+10],'curvature',[1,1],'edgecolor','r');
    axes(handles.axes2);
    hold on
% %     hold(handles.axes1,'on')
    rectangle('Position',[xMin,yMin,width+10,height+10],'curvature',[1,1],'edgecolor','g');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text7.
function text7_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_62_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fuhe
global geshu
geshu=length(fuhe);
set(handles.text7,'string',geshu);


% --------------------------------------------------------------------
function Untitled_63_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
global grayimg
axes(handles.axes2);   %使用第二个axes
grayimg=rgb2gray(im);
imshow(grayimg);


% --------------------------------------------------------------------
function Untitled_64_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_64 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web -broswer http://47.107.106.122/obtain1/


% --- Executes during object creation, after setting all properties.
function text7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --------------------------------------------------------------------
function Untitled_65_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_65 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_66_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_66 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global grayimg

hist2=imhist(grayimg);
answer=inputdlg('输入直方图的截取百分比：','SEU-TJ');
a=str2num(answer{:});
n_pixel = round(sum(hist2)*a);

%如果是要统计从0开始且占比超过98%开始的区间，用以下函数即可
cs = cumsum(hist2);
for i = 1:size(hist2,1)
if cs(i) >= n_pixel
disp(['建议阈值：',num2str(i-1),]);
num=i-1;

break

end
end
num1=num/255;
axes(handles.axes2);  
d=im2bw(grayimg,num1);
imshow(d);
title('基于直方图的阈值分割结果');
set(handles.text6,'string',num1);


% --------------------------------------------------------------------
function Untitled_68_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_68 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
c=size(im,1);
set(handles.text8,'string',c);


% --------------------------------------------------------------------
function Untitled_67_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_67 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Cannyimg
prompt={'上限','下限'};
dlg_title='确定处理图片的上下限';
num_lines=1;
def={'400','200'};
answer=inputdlg(prompt,dlg_title,num_lines,def);
a1=str2num(answer{1,1});
a2=str2num(answer{2,1});
Cannyimg(a2:a1,:)=0;
axes(handles.axes2);
imshow(Cannyimg);

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text8.
function text8_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_69_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_69 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web -broswer http://47.107.106.122/parameter/


% --------------------------------------------------------------------
function Untitled_70_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_70 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ObjDir=uigetdir('E:\','请选择所需处理图片的文件夹');
OutputDir=uigetdir('E:\','结果保存在？');
prompt={'第几道','第几部分','所要处理的图片数量'};
dlg_title='确定处理图片的名称及数量';
num_lines=1;
def={'5','1','20'};
answer=inputdlg(prompt,dlg_title,num_lines,def);
a1=str2num(answer{1,1});
a2=str2num(answer{2,1});
tnum=str2num(answer{3,1});
h=waitbar(0,'程序正在运行中...');
for i=1:tnum
     waitbar(i/tnum)
     bgFile = [ObjDir,'\','第',num2str(a1),'道','-',num2str(a2),'_页面_',num2str(i,'%03d'),'.png'];% 读入图片的完整路径
    orimg = imread(bgFile);

    imwrite(orimg,[OutputDir,'\',int2str(i),'.png']);
end
close(h);


% --- Executes during object creation, after setting all properties.
function text5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
