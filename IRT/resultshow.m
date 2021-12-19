function resultshow(image_in,geshu,fuhe,stats)

figure(1);
imshow(image_in);
for h=1:geshu
    mouge=stats(fuhe(h)).BoundingBox;
    xMin=mouge(1);
    yMin=mouge(2);
    width=mouge(3);
    height=mouge(4);        
    hold on
    rectangle('Position',[xMin,yMin,width,height],'EdgeColor','r');
end
