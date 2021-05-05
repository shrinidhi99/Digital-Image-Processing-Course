/*
    * Denoising
*/

k = imread('cameraman.tif');
k = double(k);
imtool(k, []);
k1 = k + 20 * randn(size(k));
imtool(k1, []);

k2 = k + 20 * randn(size(k));
imtool(k2, []);

k3 = (k1 + k2)./ 2;
imtool(k3, []);

n1 = colfilt(k1, [7 7], 'sliding', @std);
mode(round(n1(:)));

n3 = colfilt(k3, [7 7], 'sliding', @std);
mode(round(n3(:)));

k4 = k + 20 * randn(size(k));
k5 = k + 20 * randn(size(k));
k6 = (k1 + k2 + k4 + k5)./ 4;
imtool(k6, []);
n6 = colfilt(k6, [7 7], 'sliding', @std);
mode(round(n6(:)));

d = colfilt(k1, [7 7], 'sliding', @mean);
mode(round(d(:)));
imtool(d, []);