clc
clear all
close all


%% Exercitiul 1
% b
A = [ 0 16 32 48;...
      16 0 16 32;...
      32 16 0 16;...
      48 32 16 0];

h = 1/9 * ones(3,3);

figure(1), imagesc(A), colormap gray, title('Imagine originala');

Af = imfilter(A,h,'conv','circular');
figure(2), imagesc(Af), colormap gray, title('Imagine filtrata');

% c
B = convolutie(A,h);
figure(3), imagesc(B), colormap gray, title('Imagine filtrata folosind functia');

%% Exercitiul 2
% a

image = imread('peppers.png');
figure(4), imagesc(image), title('peppers.png');

% b

% Blur Gaussian filter
h = 1/256 * [1 4 6 4 1;...
             4 16 24 16 4;...
             6 24 36 24 6;...
             4 16 24 16 4;...
             1 4 6 4 1];
conv1 = imfilter(image,h,'conv','circular');
figure(5), imagesc(conv1), title('peppers.png + Blur Gaussian');

% Motion blur
h = zeros(9,9);
for i = 1:length(h)
    for j = 1:length(h)
        if(i==j) 
            h(i,j) = 1;
        end
    end
end
h = h/9;
conv2 = imfilter(image,h,'conv','circular');
figure(6), imagesc(conv2), title('peppers.png + Motion blur');

% evidentiere muchii (sharpening)
h = [-1 -1 -1;...
     -1 9 -1;...
     -1 -1 -1];
conv3 = imfilter(image,h,'conv','circular');
figure(7), imagesc(conv3), title('peppers.png + sharpening');

% filtre de tip Laplacian pentru detectia liniilor si muchiilor
figure(8)
h = [-1 -1 -1;...
     -1 9 -1;...
     -1 -1 -1];
conv4 = imfilter(image,h,'conv','circular');
subplot(2,3,1), imagesc(conv4), title('Evidentiere muchii peppers.png');
h = [-1 -1 -1;...
     2 2 2;...
     -1 -1 -1];
conv4 = imfilter(image,h,'conv','circular');
subplot(2,3,2), imagesc(conv4), title('Detectie linii orizontale peppers.png');
h = [-1 2 -1;...
     -1 2 -1;...
     -1 2 -1];
conv4 = imfilter(image,h,'conv','circular');
subplot(2,3,3), imagesc(conv4), title('Detectie linii verticale peppers.png');
h = [-1 -1 2;...
     -1 2 -1;...
     2 -1 -1];
conv4 = imfilter(image,h,'conv','circular');
subplot(2,3,4), imagesc(conv4), title('Detectie muchii peppers.png');
h = [2 -1 -1;...
     -1 2 -1;...
     -1 -1 2];
conv4 = imfilter(image,h,'conv','circular');
subplot(2,3,5), imagesc(conv4);

% filtre Sobel
figure(9)
h = [1 2 1;...
     0 0 0;...
     -1 -1 -1];
conv5 = imfilter(image,h,'conv','circular');
subplot(1,2,1), imagesc(conv5), title('Evidentiere muchii orizontale peppers.png');
h = [1 0 -1;...
     2 0 -2;...
     -1 0 -1];
conv5 = imfilter(image,h,'conv','circular');
subplot(1,2,2), imagesc(conv5), title('Evidentiere muchii verticale peppers.png');

% filtre Prewitt
figure(10)
h = [1 1 1;...
     0 0 0;...
     -1 -1 -1];
conv6 = imfilter(image,h,'conv','circular');
subplot(1,2,1), imagesc(conv6), title('Evidentiere muchii orizontale peppers.png');
h = [1 0 -1;...
     1 0 -1;...
     1 0 -1];
conv6 = imfilter(image,h,'conv','circular');
subplot(1,2,2), imagesc(conv6), title('Evidentiere muchii verticale peppers.png');

% c
imageNoisy = imnoise(image,'salt & pepper');
figure(11), imagesc(imageNoisy), title('peppers.png + noise');

% d
imwrite(imageNoisy,'photo1_noise.jpg','jpg');

% e
h = 1/9 * ones(3,3);
image = imfilter(imageNoisy,h,'conv','circular');
figure(12), imagesc(image), title('peppers.png + noise + filtru');
