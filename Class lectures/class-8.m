/*
    * Convolution and correlation
*/

k = imread('cameraman.tif');
k = double(k);
k1 = colfilt(k, [7 7], 'sliding', @mean);
imtool(k1, []);
imtool(k, []);
