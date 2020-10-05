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