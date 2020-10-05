/*
    * Noise
*/

k = imread('cameraman.tif');
k = double(k);
imtool(k, []);
n = 15 * randn(size(k));
imtool(n, []);

k1 = k + n;
imtool(k1, []);
imtool(k, []);
imtool(k1, [0 255]);
imtool(k, [0 255]);
imtool(n, []);
std(n(:));

imtool(k1, []);
std(k1(:));

LS = colfilt(k1, [7 7], 'sliding', @std);
imtool(LS, []);
mode(round(LS(:)));