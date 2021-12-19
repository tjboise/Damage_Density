[filename, pathname] = uigetfile( '*.*','????????????');
pathfile=fullfile(pathname, filename);
image=imread(pathfile);
grayimg=rgb2gray(image);

imshow(grayimg)
