%% a
clc
clear all
close all

% im = imread('peppers.png'); template = imread('onion.png');

im = imread('text2.png');
template = imcrop(im);
imwrite(template,'a.png','png');
% template = imread('a.png');

if(ndims(im) == 3)
    im = rgb2gray(im);
end
if(ndims(template) == 3)
    template = rgb2gray(template);
end

figure, imshow(im), title('Image'), figure, imshow(template), title('Template')

c = normxcorr2(template,im);
figure, surf(c), shading flat

[max_c, imax] = max(c(:));
[ypeak, xpeak] = ind2sub(size(c), imax(1));
corr_offset = [(xpeak - size(template,2))
               (ypeak - size(template,1))];
xoffset = corr_offset(1); yoffset = corr_offset(2);

xbegin = round(xoffset + 1);
xend = round(xoffset + size(template , 2));
ybegin = round(yoffset + 1);
yend = round(yoffset + size(template , 1));

recovered_template = uint8(zeros(size(im)));
recovered_template(ybegin:yend, xbegin:xend) = template;
figure, imshow(recovered_template)

[m, n] = size(im); mask = ones(m, n);
i = find(recovered_template == 0);
mask(i) = .5;
figure, imshow(im), title('Template overlayed on original image')
hold on
h = imshow(recovered_template);
set(h,'AlphaData', mask);

%% b
clc
clear all
close all

bw = imread('text.png');
% bw = imread('text2.png');
% a = imread('a.png');
a = bw(32:45, 88:98);
figure, imshow(bw), figure, imshow(a)

C = real(ifft2(fft2(bw) .* fft2(rot90(a,3),length(bw(:,1)),length(bw(1,:)))));
Z = real(ifft2(fft2(bw) .* fft2(rot90(a,2),length(bw(:,1)),length(bw(1,:)))));

thresh1 = max(C(:))*90/100;
thresh2 = max(Z(:))*90/100;

figure, imshow(C,[]), hold on, imshow(Z,[])
D = (C > thresh1);
Y = (Z > thresh2);

se = strel('disk', 5);
E = imdilate(D,se);
H = imdilate(Y,se);
E = E + H;
figure, imshow(E)

%%