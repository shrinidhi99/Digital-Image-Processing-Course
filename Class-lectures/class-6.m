/*
    * Consider an image of a scenary
*/
k = imread('scenary.jpg');
k1 = rgb2gray(k);
imtool(k1);
k1 = double(k1);
min_val = min(k1(:));
max_val = max(k1(:));

k2 = ((k1 - min_val)./(max_val - min_val)).*255;
imtool(uint8(k2));
imtool(uint8(k1)); // original image

/*
    * histogram equalization
*/

[h c g1] = histeq1(double(k1));
imtool(uint8(g1));
figure, plot(h);
figure, plot(c);
