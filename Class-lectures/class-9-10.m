/*
    * Convolution
*/

k = imread('cameraman.tif');
imtool(k, []);
h = fspecial('average', 5);
R = conv2(double(k), h, 'valid');
size(k);
size(R);
imtool(R, []);

R1 = conv2(double(k), h, 'same');
size(R1);
imtool(R1, []);
figure, surf(h);

h = fspecial('average', 9);
R = conv2(k, h, 'valid');
imtool(R, []);

h = fspecial('gaussian', 9, 3);
figure, surf(h);
R1 = conv2(k, h, 'valid');
imtool(R1, []);

h = fspecial('sobel');
R2 = conv2(k, h, 'valid');
imtool(abs(R2), []);

f1 = ones(3, 3)*.1/9;
f2 = ones(1, 3)*.1/3;

imtool(R, []);
figure, surf(h);

h = fspecial('average', 9);
R = conv2(k, h, 'valid');
imtool(R, []);
h = fspecial('gaussian', 9, 3);
figure, surf(h);
R1 = conv2(k, h, 'valid');
imtool(R1, []);

