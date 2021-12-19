[file_name, pathname] = uigetfile( '*.*','choose a file');
I1 = imread([pathname,'/',file_name]); 
I1=im2bw(I1,0.8);
imwrite(I1,'/Users/zhangtianjie/Documents/IR/Specialissue/mainprocess/2/mask.jpg');


[areacount,MajorAxis,MinorAxis,BW_seg,geshu,fuhe,stats]=tiqu(I1);
figure;
imshow(I1);
for h=1:geshu
    mouge=stats(fuhe(h)).BoundingBox;
    xMin=mouge(1);
    yMin=mouge(2);
    width=mouge(3);
    height=mouge(4);        
    hold on
    rectangle('Position',[xMin,yMin,width,height],'EdgeColor','r');
end
saveas(gca,'/Users/zhangtianjie/Documents/IR/Specialissue/mainprocess/9/mark.jpg');