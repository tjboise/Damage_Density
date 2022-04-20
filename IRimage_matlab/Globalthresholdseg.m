%% Global threshold segmentation

count=0;
f=imread('/Users/zhangtianjie/Downloads/20220407_163017_IR.jpg');
T=mean2(f);
done=false;
while ~done
    count=count+1;
    g=f>T;
    Tnext=0.5*(mean(f(g))+mean(f(~g)));
    done=abs(T-Tnext)<0.5;
end

g=im2bw(f,T/255);
imshow(f);
figure,imhist(f);
figure,imshow(g);
imwrite(g,'/Users/zhangtianjie/Documents/MATLAB/IRsegment/Global_threshold.jpg');
