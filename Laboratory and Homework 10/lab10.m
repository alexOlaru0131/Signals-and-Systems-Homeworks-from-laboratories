%%
clc
clear all
close all

im = imread('circles.png');
imshow(im)

if( ~islogical(im))
    if(ndims(im) > 2) im = rgb2gray(im); end
    level = graythresh(im); BW = im2bw(im, level);
else
    BW = im;
end

figure, imshow(BW)

[B,L,N] = bwboundaries(BW,'noholes');
for k = 1:N
    X = B{k}(:,2);
    Y = B{k}(:,1);
    contur = [X'; Y'];
    figure, plot(X,Y)
end

%% ex1 tema
clc
clear all
close all

im = imread('imagine.jpg')
imshow(im)

if (~islogical(im))
    % transformare imagine RGB in imagine cu nuante de gri
    if (ndims(im)>2) 
        im = rgb2gray(im);
    end
    % calcul prag in functie de care se va binariza imaginea
   level=graythresh(im); 
    % binarizare imagine
    BW = im2bw(im,level);
end
figure, imshow(BW)
% daca in urma binarizarii fundalul este alb si obiectele negre, se va complementa imaginea
% BW = ~BW;
% figure, imshow(BW)
[B,L,N] = bwboundaries(BW,'noholes'); 

nc = 15;
for (k=1:N)
    X = B{k}(:,2);
    Y = B{k}(:,1);
    contur = [X'; Y'];
    
    angularFunctionDescriptors(contur, nc);
   ellipticFourierDescriptors(contur, nc);
   
   %pause
   
end

%% ex2 tema
clc
clear all
close all



%%