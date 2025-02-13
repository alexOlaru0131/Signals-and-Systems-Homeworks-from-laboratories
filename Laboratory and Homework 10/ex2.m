close all
I=imread('drept.bmp');
BW=im2bw(I);
BW=~BW;
figure, imshow(im)

[B,L,N]=bwboundaries(BW,'noholes');

X=B{1}(:,2);
Y=B{1}(:,1);
s=regionprops(L,'Centroid');
xc=s.Centroid(1)
yc=s.Centroid(2)
   
rho=sqrt((X-xc).^2+(Y-yc).^2);

figure, imshow(I); hold on; plot(xc,yc,'*')
figure; plot(rho)
