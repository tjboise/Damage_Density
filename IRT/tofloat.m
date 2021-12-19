function [out,revertclass]=tofloat(in)
%% 作用：把图像转化为浮点
%revertclass是函数句柄，用于转化回输入
%% 读取图像
% if isempty(varargin)
% disp('请选择您要进行处理的图片');
% [filename, pathname] = uigetfile( '*.*','请选择您要进行处理的图片'); %选择图片文件
%     if isequal(filename,0)   %判断是否选择
%      msgbox('没有选择任何图片');
%     else
%       pathfile=fullfile(pathname, filename);  %获得图片路径
%       in=imread(pathfile);
%     end
% else
%     in=varargin;
% end
%% 转化
identity=@(x) x;
tosingle=@im2single;
table={'uint8',tosingle,@im2unit8
    'unit16',tosingle,@im2unit16
     'int16',tosingle,@im2int16
      'logical',tosingle,@logical
      'double',identity,identity
      'single',identity,identity};
  classIndex=find(strcmp(class(in),table(:,1)));
  if isempty(classIndex)
      error('Unsupported input image class.');
  end
  out=table{classIndex,2}(in);
  revertclass=table{classIndex,3};