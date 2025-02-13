%% 1
clc
clear all
close all

% a
img = imread('peppers.png');

% b
if(ndims(img)==3) img = rgb2gray(img); end
figure, imshow(img);

% c
f_orizontal = fspecial('sobel');

% d
f_vertical = f_orizontal';
[M, N] = size(img);

% e
f_o_freq = freqz2(f_orizontal, N, M);
f_v_freq = freqz2(f_vertical, N, M);
figure, surf(log(abs(f_o_freq))), title('Filtru pentru detectie de linii orizontale')
figure, surf(log(abs(f_v_freq))), title('Filtru pentru detectie de linii verticale')

% f
F = fftshift(fft2(double(img)));

% g
G_o = f_o_freq.*F;
G_v = f_v_freq.*F;

% h
figure, surf(log(abs(G_o))), title('Detectie linii orzontale');
figure, surf(log(abs(G_v))), title('Detectie linii verticale');

% i
G = G_o + G_v;

% j
imgf = real(ifft2(ifftshift(double(G))));
figure, imshow(imgf,[]), title('Imaginea filtrata');

%% 2
clc
clear all
close all

% a
img1 = imread('saturn.png'); img2 = imread('cameraman.tif');

% b
if(ndims(img1)==3) img1 = rgb2gray(img1); end
if(ndims(img2)==3) img2 = rgb2gray(img2); end
figure, imshow(img1), title('saturn.png');
figure, imshow(img2), title('cameraman.tif');

% c
[M,N] = size(img2);
img1_r = imresize(img1,[N M]);

% d
F_img1 = fft2(double(img1_r));
F_img2 = fft2(double(img2));

% e
F_img1_shifted = fftshift(F_img1);
F_img2_shifted = fftshift(F_img2);

a_img1 = abs(F_img1_shifted);
a_img2 = abs(F_img2_shifted);
f_img1 = angle(F_img1_shifted);
f_img2 = angle(F_img2_shifted);
figure, imshow(log(a_img1+1),[]), title('Amplitudine saturn.png');
figure, imshow(log(a_img2+1),[]), title('Amplitudine cameraman.tif');
figure, imshow(f_img1), title('Faza saturn.png');
figure, imshow(f_img2), title('Faza cameraman.tif');

% f
F_img1_inverted = a_img1 .* exp(1i * (-f_img1));
F_img2_inverted = a_img2 .* exp(1i * (-f_img2));

% g
img1_inverted = ifft2(ifftshift(F_img1_inverted));
img2_inverted = ifft2(ifftshift(F_img2_inverted));

% h
figure, imshow(abs(img1_inverted),[]), title('saturn.png inversat')
figure, imshow(abs(img2_inverted),[]), title('cameraman.tif inversat')
