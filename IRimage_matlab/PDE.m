%% segmentation based on PDE
function main
%achieve Active Contours Without Edges
Img=imread('o1.jpg'); %Awell-behaved CV model 
%Img-imread('vessel.bmp); %Abad-behavedCVmodel 
%Img-imread(twoCells.bmp); %Abad-behavedCVmodel 
U=Img(:,:,1);%get size
[nrow,ncol]=size(U); 
ic=nrow/2; 
jc=ncol/2; 
r=20;
phi_0=sdf2circle(nrow,ncol,ic,jc,r); 
delta_t=0.1; 
lambda_1=1; 
lambda_2=1; 
nu=0; 
h=1; 
epsilon=1;
mu=0.01*255*255; 
I=double(U); 
phi=phi_0; 
figure;
imagesc(uint8(I));colormap(gray) 
hold on;
plotLevelSet(phi,0,'r'); 
numIter=1; 
for k=1:50
phi=EVOLUTION_CV(I,phi,mu,nu,lambda_1,lambda_2,delta_t,epsilon,numIter);
%Update the level set function
if mod(k,10)==0
pause(.5);
imagesc(uint8(I));colormap(gray);
hold on;
plotLevelSet(phi,0,'r'); 
end
end
%backward gradient.m
function [bdy,bdx]=backward_gradient(f)
[nr,nc]=size(f); 
bdx=zeros(nr,nc);
bdy=zeros(nr,nc);
bdx(2:nr,:)=f(2:nr,:)-f(1:nr-1,:); 
bdy(:,2:nc)=f(:,2:nc)-f(:,1:nc-1);
%binaryfit.m
function [C1,C2]=binaryfit(phi,U,epsilon) 
    H=Heaviside(phi,epsilon);
    a=H.*U; 
    numer_1=sum(a(:)); 
    denom_1=sum(H(:)); 
    C1=numer_1/denom_1; 
    b=(1-H).*U;
numer_2=sum(b(:)); 
c=1-H;
denom_2=sum(c(:));
C2=numer_2/denom_2;
%BoundMirrorEnsure.m
function B=BoundMirrorEnsure(A)
    [m,n]=size(A); 
    if(m<3||n<3)
error('either the number of rows or columns is smaller than 3'); 
    end
yi=2:m-1; 
xi=2:n-1; 
B=A;
B([1 m],[1 n])=B([3 m-2],[3 n-2]);
B([1 m],xi)=B([3 m-2],xi); 
B(yi,[1 n])=B(yi,[3 n-2]);
%BoundMirrorExpandm
    function B=BoundMirrorExpand(A)
        [m,n]= size(A); 
        yi=2:m+1; 
        xi=2:n+1;
B=zeros(m+2,n+2); 
B(yi,xi)=A;
B([1 m+2],[1 n+2])=B([3 m],[3 n]);B([1 m+2],xi)=B([3 m],xi);

B(yi,[1 n+2])=B(yi,[3 n]);

%BoundMirrorShrinkm
function B=BoundMirrorShrink(A)
    [m,n]=size(A); 
    yi=2:m-1; 
    xi=2:n-1; 
    B=A(yi,xi);
    % curvature.m
function K=curvature(f)
[f_fx,f_fy]=forward_gradient(f);
[f_bx,f_by]=backward_gradient(f); 
mag1=sqrt(f_fx.^2+f_fy.^2+1e-10); 
n1x=f_fx./mag1; 
n1y=f_fy./mag1;
mag2=sqrt(f_bx.^2+f_fy.^2+1e-10); 
n2x=f_bx./mag2; 
n2y=f_fy./mag2;
mag3=sqrt(f_fx.^2+f_by.^2+1e-10); 
n3x=f_fx./mag3; 
n3y=f_by./mag3;
mag4=sqrt(f_bx.^2+f_by.^2+1e-10); 
n4x=f_bx./mag4; 
n4y=f_by./mag4;
nx=n1x+n2x+n3x+n4x; 
ny=n1y+n2y+n3y+n4y; 
magn=sqrt(nx.^2+ny.^2); 
nx=nx./(magn+1e-10); 
ny=ny./(magn+1e-10);
[nxx,nxy]=gradient(nx);
[nyx,nyy]=gradient(ny); 
K=nxx+nyy;
%Delta.m
function Delta_h=Delta(phi,epsilon)
Delta_h=(epsilon/pi)./(epsilon^2+ phi.^2);
%EVOLUTION CV.m
function phi=EVOLUTION_CV(I,phi0,mu,nu,lambda_1,lambda_2,delta_t,epsilon,numIter)
    I=BoundMirrorExpand(I);
phi=BoundMirrorExpand(phi0); 
for k=1:numIter
phi=BoundMirrorEnsure(phi); 
delta_h=Delta(phi,epsilon); 
Curv=curvature(phi);
[C1,C2]=binaryfit(phi,I,epsilon);
phi=phi+delta_t*delta_h.*(mu*Curv-nu-lambda_1*(1-C1).^2+lambda_2*(1-C2).^2); 
end
phi=BoundMirrorShrink(phi);
% forward gradient.m
function [fdy,fdx]=forward_gradient(f)
    [nr,nc]=size(f); 
    fdx=zeros(nr,nc); 
    fdy=zeros(nr,nc);
a=f(2:nr,:)-f(1:nr-1,:); 
fdx(1:nr-1,:)=a;
b=f(:,2:nc)-f(:,1:nc-1); 
fdy(:,1:nc-1)=b;
%get phi.m
function [xcontour,ycontour]=get_phi(I,nrow,ncol,margin) 
    count=1; 
    x=margin;
for y=margin:nrow-margin+1
xcontour(count)=x; 
ycontour(count)=y;
count=count+1; 
end
y=nrow-margin+1;
for x=margin+1:ncol-margin+1
xcontour(count)=x; 
ycontour(count)=y; 
count=count+1; 
end
x=ncol-margin+1;
for y=nrow-margin:-1:margin
xcontour(count)=x; 
ycontour(count)=y; 
count=count+1; 
end
y=margin;
for x=ncol-margin:-1:margin+1
xcontour(count)=x; 
ycontour(count)=y; 
count=count+1;
end
%Heaviside.m
    function H=Heaviside(phi,epsilon) 
        H=0.5*(1+(2/pi)*atan(phi./epsilon));
        %plotLevelSet.m
        function [c,h]=plotLevelSet(u,zLevel,style)
            [c,h]=contour(u,[zLevel zLevel],style);
            % sdf2circle.m
function f=sdf2circle(nrow,ncol,ic,jc,r)
    [X,Y]=meshgrid(1:ncol,1:nrow); 
    f=sqrt((X-jc).^2+(Y-ic).^2)-r;
    % signed distance.m
function u = signed_distance(I,xcontour,ycontour,margin)
[nrow,ncol]=size(I);
[temp,contsize]=size(xcontour); 
Mark=zeros(nrow,ncol); 
for y=1:nrow
for x=1:ncol
if (x>ncol-margin+1)||(x<margin)||(y<margin)||(y>nrow-margin+1)
Mark(y,x)=-1; 
end
end
end
for y=1:nrow
for x=1:ncol
u(y,x)=sqrt(min((x-xcontour).^2+(y-ycontour).^2));
if Mark(y,x)==-1
u(y,x)=-u(yx); 
end
end
end