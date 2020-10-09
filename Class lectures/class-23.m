% RGB, HSV, CNY, YIQ

k = imread('kathakali.jpg');
imtool(k, []);
imtool(k(:,:,1), []);
imtool(k(:,:,2), []);
imtool(k(:,:,3), []);
p = rgb2gray(k);
imtool(p, []);
clear all;
imtool close all;

k = imread('kathakali.jpg');
h = rgb2hsv(k);
imtool(h(:,:,1), []);
imtool(h(:,:,2), []);
imtool(h(:,:,3), []);
imtool(k, []);

k = double(k);
g = (k(:,:,1) + k(:,:,2) + k(:,:,3))./3;
imtool((uint8)(g), []);

clear all;
clc;
imtool close all;

k = imread('red.jpg');
imtool(k, []);
g = rgb2gray(k);
g1(:,:,1) = g;
g1(:,:,2) = g;
g1(:,:,3) = g;
[m n] = size(k);

for(i = 1:m)
    for(j = 1:n)
        if(k(:,:,1) > 200)
            g1(i,j,1) = k(i,j,1);
            g1(i,j,2) = k(i,j,2);
            g1(i,j,3) = k(i,j,3);
        end
    end
end
imtool(g1, []);
