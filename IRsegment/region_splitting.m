%% Region splitting and merging
img=imread('o1.jpg');
subplot(1,2,1); %The image display is divided into one row and two columns, and a coordinate system is created on the first graph on the left
imshow(img); %Show the original image 
[M,N]=size(img);%The image size is stored in the array 
divide_range=70; 
merge_range=40; 
Seg_matrix(1,12)=0; 
Seg_matrix(1,2:6)=1; 
Seg_matrix(1,4)=N; 
Seg_matrix(1,6)=M; 
Seg_matrix(1,9)=0;
%************ Segment Algorihm ************* 
seg=1; 
seg_tot=1;
while seg<=seg_tot
left=Seg_matrix(seg,3);%=1 
right=Seg_matrix(seg,4);%=N
up=Seg_matrix(seg,5); %=1 
down=Seg_matrix(seg,6);%=M 
if abs(left-right)>1&&abs(up-down)>1
tot_gray_sum=0; 
single_segment=1; 
for p=up:down
for q=left:right
if p==up&&q==left
%The gray value of the pixel is assigned to tot gray sum
tot_gray_sum=double(img(p,q));
pixel_count=1; 
else
%The average value of the gray level of pixel in the region is obtained
average=tot_gray_sum/pixel_count;
if abs(average-double(img(p,q)))>divide_range
single_segment=0; 
break; 
end
tot_gray_sum=tot_gray_sum+double(img(p,q));
pixel_count=pixel_count+1;%The number of pixels 
end
end
if single_segment==0
break; 
end
end
%*********************divide segment **************** 
if single_segment==0
seg_tot=seg_tot+1;
Seg_matrix(seg,2)=0; % Not using 
Seg_matrix(seg_tot:seg_tot+3,2)=1;%using==yes
Seg_matrix(seg_tot:seg_tot+3,9)=2;%All will connection to two segments 
mid_x=left+floor((right-left)/2)-1; 
mid_y=up+floor((down-up)/2)-1;
% seglLUSplit the upper left part 
Seg_matrix(seg_tot,3:6)=[left mid_x up mid_y];
cell_array(seg_tot,1)={seg_tot+1};% 2 
cell_array(seg_tot,2)={seg_tot+2};% 3 
% seg2 RUSplit the upper right part 
seg_tot=seg_tot+1;
Seg_matrix(seg_tot,3:6)=[mid_x+1 right up mid_y]; 
cell_array(seg_tot,1)={seg_tot-1};% 1
cell_array(seg_tot,2)={seg_tot+2};% 4 
% seg3 LD Split left lower part 
seg_tot=seg_tot+1;
Seg_matrix(seg_tot,3:6)=[left mid_x mid_y+1 down];
cell_array(seg_tot,1)={seg_tot-2};% 1 
cell_array(seg_tot,2)={seg_tot+1};%4
% seg4 RD Split right lower part 
seg_tot=seg_tot+1;
Seg_matrix(seg_tot,3:6)=[mid_x+1 right mid_y+1 down]; 
cell_array(seg_tot,1)={seg_tot-2};%2 
cell_array(seg_tot,2)={seg_tot-1};%3


old_conection=Seg_matrix(seg,9); 
for o_c=1:old_conection
con_seg=cell_array{seg,o_c}; 
if Seg_matrix(con_seg,2)~=0
B1(1:4)=Seg_matrix(con_seg,3:6); 
for child_seg=seg_tot:-1:seg_tot-3
    B2(1:4)=Seg_matrix(child_seg,3:6);
if B2(2)+1<B1(1)|| B1(2)+1<B2(1)||B2(4)+1<B1(3)|| B1(4)+1<B2(3) 
else
if (B2(2)+1==B1(1)||B1(2)+1==B2(1))&&(B2(4)+1==B1(3)||B1(4)+1==B2(3)) 
else
Seg_matrix(child_seg,9)=Seg_matrix(child_seg,9)+1;% Updating child connection 
cell_array(child_seg,Seg_matrix(child_seg,9))={con_seg};
Seg_matrix(con_seg,9)=Seg_matrix(con_seg,9)+1;%Updating connected segments 
cell_array(con_seg,Seg_matrix(con_seg,9))={child_seg};
end
end
end
end
end
else
Seg_matrix(seg,7)=tot_gray_sum; 
Seg_matrix(seg,8)=pixel_count; 
end
else
tot_gray_sum=0; 
pixel_count=1; 
for p=up:down
for q=left:right
tot_gray_sum=tot_gray_sum+double(img(p,q)); 
pixel_count=pixel_count+1; 
end
end
Seg_matrix(seg,7)=tot_gray_sum; 
Seg_matrix(seg,8)=pixel_count-1; 
end
seg=seg+1; 
end
%***************************meargealgorithm**************************** 
cnt=0;
for seg=1:seg_tot
if Seg_matrix(seg,1:2)==[0 1]
curr_gry_sum=Seg_matrix(seg,7); 
curr_pxl_cnt=Seg_matrix(seg,8);
cnt=cnt+1;
Seg_matrix(seg,10)=cnt;
loop_flag=1; 
curr_seg=seg;
Seg_matrix(curr_seg,11)=0; 
Seg_matrix(seg,1)=1; 
while (loop_flag==1)
connection_found=0;
while Seg_matrix(curr_seg,12)<Seg_matrix(curr_seg,9)
Seg_matrix(curr_seg,12)=Seg_matrix(curr_seg,12)+1; 
next_seg=cell_array{curr_seg,Seg_matrix(curr_seg,12)}; 
if Seg_matrix(next_seg,1:2)==[0 1]
curr_average=curr_gry_sum/curr_pxl_cnt;
next_average=Seg_matrix(next_seg,7)/(Seg_matrix(next_seg,8));
if abs(next_average-curr_average)<merge_range 
    connection_found=1; 
    break; 
else
f=1; 
end
end
end
if connection_found==1 %Merging 
curr_gry_sum=curr_gry_sum+Seg_matrix(next_seg,7); 
curr_pxl_cnt=curr_pxl_cnt+Seg_matrix(next_seg,8); 
Seg_matrix(next_seg,10)=cnt; 
Seg_matrix(next_seg,1)=1;
Seg_matrix(next_seg,11)=curr_seg;
curr_seg=next_seg; 
else
curr_seg=Seg_matrix(curr_seg,11); 
end
if curr_seg==0
loop_flag=0; 
end
end
if curr_pxl_cnt>100
valid_seg_index(cnt)=1; 
end
end
end
max_cnt=cnt;
valid_seg_index(cnt+1)=0; 
for seg=1:seg_tot
if Seg_matrix(seg,1)==1
cnt=Seg_matrix(seg,10); 
if valid_seg_index(cnt)==1
L=Seg_matrix(seg,3); 
R=Seg_matrix(seg,4); 
U=Seg_matrix(seg,5); 
D=Seg_matrix(seg,6);
result(U:D,L:R,cnt)=img(U:D,L:R); 
img_seg(U:D,L:R)=cnt; 
end
end
end
k=1;
for cnt=1:max_cnt;
if valid_seg_index(cnt)==1
res(:,:,k)=result(:,:,cnt); 
k=k+1; 
end
end
Lrgb=label2rgb(img_seg); 
%subplot(1,2,2); 
figure(2),imshow(Lrgb);
imwrite(Lrgb,'/Users/zhangtianjie/Documents/MATLAB/IRsegment/region_splitting.jpg');