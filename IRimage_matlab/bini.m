function [image1] = bini(image)
%UNTITLED3 姝ゅ鏄剧ず鏈夊叧姝ゅ嚱鏁扮殑鎽樿
%   姝ゅ鏄剧ず璇︾粏璇存槑
[m,n]=size(image);
for i=1:m
    for j=1:n
        if image(i,j)>0
            image1(i,j)=1;
        else
            image1(i,j)=0;
        
        end
        
    end
end
end