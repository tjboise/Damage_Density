%% Infrared video detection
video=VideoReader('IMG_1121.MOV');
nFrames=video.NumFrames;  %get the frames
H=video.Height;  %get the height
W=video.Width;  %get the width
%Rate=video.FrameRate;  %rate of the video
mov(1:nFrames)=struct('cdata',zeros(H,W,3,'uint8'),'colormap',[]);
% a frame one time
for i=1:nFrames
    mov(i).cdata;
    %=read(video,i);
    P=mov(i).cdata;
    level = graythresh(P);
    BW = im2bw(P,level);
    %[areacount22,MajorAxis22,MinorAxis22,BW_seg,geshu,fuhe,stats]=tiqu(BW);
    %resultshow(P,geshu,fuhe,stats)

    movv(i).cdata=BW;
    movv(i).colormap=[];
end

VideoWriter(movv,'aaa.avi');